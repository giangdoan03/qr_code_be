<?php
namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\HTTP\ResponseInterface;
use Config\Services;

class ControllerWpMediaProxy extends ResourceController
{
    /* -------------------- CONFIG -------------------- */
    private function cfg(): array
    {
        return [
            'wp_media_endpoint' => rtrim((string) env('WP_MEDIA_ENDPOINT', ''), '/'),
            'wp_user'           => (string) env('WP_USER', ''),
            'wp_app_password'   => (string) env('WP_APP_PASSWORD', ''),
            'cors_allowed'      => $this->csvToList((string) env('CORS_ALLOWED_ORIGINS', '')),
            'max_bytes'         => (int) env('UPLOAD_MAX_BYTES', 20 * 1024 * 1024),
            'allowed_mimes'     => array_map('trim', explode(',', (string) env('UPLOAD_ALLOWED_MIMES', 'image/jpeg,image/png,image/gif,image/webp,application/pdf'))),
            'auth_probe'        => filter_var(env('WP_AUTH_PROBE', 'true'), FILTER_VALIDATE_BOOLEAN),
            'ssl_verify'        => filter_var(env('CURL_SSL_VERIFY', 'true'), FILTER_VALIDATE_BOOLEAN),
            'timeout'           => (int) env('CURL_TIMEOUT', 40),
        ];
    }
    private function csvToList(string $csv): array
    {
        if ($csv === '') return [];
        $parts = preg_split('/\s*,\s*/', $csv, -1, PREG_SPLIT_NO_EMPTY);
        return array_values(array_unique(array_map(fn($o) => rtrim($o, '/'), $parts)));
    }

    /* -------------------- CORS -------------------- */
    private function originAllowed(?string $origin, array $allowlist): bool
    {
        if (!$origin) return false;
        $origin = rtrim($origin, '/');
        if (in_array('*', $allowlist, true) || in_array($origin, $allowlist, true)) return true;
        foreach ($allowlist as $pat) {
            if (str_contains($pat, '*')) {
                $regex = '#^' . str_replace('\*', '.*', preg_quote($pat, '#')) . '$#i';
                if (preg_match($regex, $origin)) return true;
            }
        }
        return false;
    }
    private function applyCors(string $origin): void
    {
        $this->response
            ->setHeader('Access-Control-Allow-Origin', $origin)
            ->setHeader('Vary', 'Origin')
            ->setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS')
            ->setHeader('Access-Control-Allow-Headers', 'Authorization, Content-Type, Content-Disposition, X-Requested-With')
            ->setHeader('Access-Control-Allow-Credentials', 'true');
    }

    /* -------------------- POST /upload -------------------- */
    public function upload(): ResponseInterface
    {
        $cfg    = $this->cfg();
        $origin = $_SERVER['HTTP_ORIGIN'] ?? null;

        // Preflight
        if ($this->request->getMethod(true) === 'OPTIONS') {
            if ($origin && $this->originAllowed($origin, $cfg['cors_allowed'])) {
                $this->applyCors($origin);
                return $this->respond('', 204);
            }
            return $this->failForbidden('CORS: origin not allowed.');
        }

        // CORS cho response thật
        if (!$origin || !$this->originAllowed($origin, $cfg['cors_allowed'])) {
            return $this->failForbidden('CORS: origin not allowed.');
        }
        $this->applyCors($origin);

        // Validate config
        if ($cfg['wp_media_endpoint'] === '' || $cfg['wp_user'] === '' || $cfg['wp_app_password'] === '') {
            return $this->failServerError('Missing WP_MEDIA_ENDPOINT / WP_USER / WP_APP_PASSWORD.');
        }

        // Validate file
        $file = $this->request->getFile('file');
        if (!$file || !$file->isValid()) return $this->failValidationErrors('Missing or invalid file.');
        if ($cfg['max_bytes'] > 0 && $file->getSize() > $cfg['max_bytes']) {
            return $this->failValidationErrors('File too large.');
        }
        $mime = $file->getMimeType() ?: 'application/octet-stream';
        if ($cfg['allowed_mimes'] && !in_array($mime, $cfg['allowed_mimes'], true)) {
            return $this->failValidationErrors('Mime type not allowed: ' . $mime);
        }

        // Optional meta
        $title   = $this->request->getPost('title');
        $alt     = $this->request->getPost('alt_text');
        $caption = $this->request->getPost('caption');
        $postId  = $this->request->getPost('post');

        // HTTP client
        $client = Services::curlrequest([
            'timeout'     => $cfg['timeout'],
            'http_errors' => false,
            'headers'     => [
                'Authorization' => 'Basic ' . base64_encode($cfg['wp_user'] . ':' . $cfg['wp_app_password']),
                'Accept'        => 'application/json',
                'User-Agent'    => 'GoldenWin-Uploader/1.0',
            ],
            'verify'      => $cfg['ssl_verify'],
        ]);

        // Probe /users/me
        // Probe /users/me (hỗ trợ cả /wp-json và ?rest_route=)
        if ($cfg['auth_probe']) {
            try {
                $usersMe = $cfg['wp_media_endpoint'];

                if (stripos($usersMe, 'rest_route=') !== false) {
                    // https://domain/?rest_route=/wp/v2/media  ->  ?rest_route=/wp/v2/users/me
                    $usersMe = preg_replace(
                        '#rest_route=\s*/wp/v2/media/?#i',
                        'rest_route=/wp/v2/users/me',
                        $usersMe
                    );
                } else {
                    // https://domain/wp-json/wp/v2/media  ->  /wp-json/wp/v2/users/me
                    $usersMe = rtrim($usersMe, '/');
                    $usersMe = preg_replace('#/media/?$#i', '/users/me', $usersMe);
                }

                // Theo dõi redirect nếu có
                $probe   = $client->get($usersMe, ['follow_redirects' => true]);
                $status  = $probe->getStatusCode();

                // Nếu vẫn 3xx thì follow thủ công 1 lần
                if ($status >= 300 && $status < 400) {
                    $loc = $probe->getHeaderLine('Location');
                    if ($loc) {
                        $probe  = $client->get($loc, ['follow_redirects' => true]);
                        $status = $probe->getStatusCode();
                    }
                }

                // (Khuyên) đừng chặn cứng ở đây; nếu probe != 200 thì log cảnh báo rồi vẫn thử upload
                if ($status !== 200) {
                    log_message('warning', 'WP auth probe non-200: ' . $status . ' URL=' . $usersMe);
                    // KHÔNG return 401 ở đây nữa — để phần upload tự quyết định
                }
            } catch (\Throwable $e) {
                log_message('warning', 'WP auth probe error: ' . $e->getMessage());
                // cũng không fail sớm — cứ tiếp tục thử upload
            }
        }


        // Try #1: RAW
        try {
            $resp = $client->post($cfg['wp_media_endpoint'], [
                'headers' => [
                    'Content-Type'        => $mime,
                    'Content-Disposition' => 'attachment; filename="' . $file->getClientName() . '"',
                ],
                'body' => file_get_contents($file->getTempName()),
            ]);
            if ($resp->getStatusCode() === 201) {
                $json = json_decode((string) $resp->getBody(), true);
                if (is_array($json) && isset($json['source_url'])) {
                    return $this->respondCreated($this->pickMedia($json));
                }
            }
        } catch (\Throwable $e) {
            log_message('error', 'RAW upload error: ' . $e->getMessage());
        }

        // Try #2: multipart/form-data
        try {
            $fields = [
                'file' => new \CURLFile($file->getTempName(), $mime, $file->getClientName()),
            ];
            if ($title)   $fields['title']     = $title;
            if ($alt)     $fields['alt_text']  = $alt;
            if ($caption) $fields['caption']   = $caption;
            if ($postId)  $fields['post']      = (string) $postId;

            // Khai báo form multipart qua setter của CI4
            $client->setForm($fields, true);             // ✅ true = multipart/form-data
            $resp2 = $client->post($cfg['wp_media_endpoint'], [
                'follow_redirects' => true,
                // 'headers' => ['Expect' => ''],
            ]);

            $code2 = $resp2->getStatusCode();
            $body2 = (string) $resp2->getBody();
            $ctype = $resp2->getHeaderLine('Content-Type');

            if ($code2 === 201) {
                $json2 = json_decode($body2, true);
                if (is_array($json2) && isset($json2['source_url'])) {
                    return $this->respondCreated($this->pickMedia($json2));
                }
            }

            if ($code2 === 200 && (stripos($ctype, 'json') === false)) {
                log_message('error', "WP returned non-JSON (200) at media endpoint. Ctype=$ctype First200=" . substr($body2,0,200));
                return $this->fail('Unexpected response from WP (HTML). Check endpoint/cache/auth.', 502);
            }

            $err = $this->minifyWpError($body2);
            log_message('error', 'WP multipart fail ['.$code2.']: ' . $err['log']);
            return $this->fail($err['client'], ($code2 >= 400 && $code2 <= 599) ? $code2 : 502);

        } catch (\Throwable $e) {
            log_message('error', 'Multipart upload exception: ' . $e->getMessage());
            return $this->failServerError('Upload exception: ' . $e->getMessage());
        }

    }

    // helper: đoán nội dung HTML
    private function isHtml(string $body, string $ctype = ''): bool
    {
        if ($ctype && stripos($ctype, 'application/json') !== false) return false;
        $s = ltrim($body);
        return stripos($ctype, 'text/html') !== false
            || str_starts_with($s, '<!DOCTYPE') || str_starts_with($s, '<html');
    }

    /* -------------------- POST /upload-from-url -------------------- */
    public function uploadFromUrl(): ResponseInterface
    {
        $cfg    = $this->cfg();
        $origin = $_SERVER['HTTP_ORIGIN'] ?? null;

        if ($this->request->getMethod(true) === 'OPTIONS') {
            if ($origin && $this->originAllowed($origin, $cfg['cors_allowed'])) {
                $this->applyCors($origin);
                return $this->respond('', 204);
            }
            return $this->failForbidden('CORS: origin not allowed.');
        }
        if (!$origin || !$this->originAllowed($origin, $cfg['cors_allowed'])) {
            return $this->failForbidden('CORS: origin not allowed.');
        }
        $this->applyCors($origin);

        $json    = $this->request->getJSON(true);
        $url     = $json['url']      ?? null;
        $title   = $json['title']    ?? null;
        $alt     = $json['alt_text'] ?? null;
        $caption = $json['caption']  ?? null;

        if (!$url || !filter_var($url, FILTER_VALIDATE_URL)) {
            return $this->failValidationErrors('Invalid URL.');
        }

        try {
            $bin = file_get_contents($url);
            if ($bin === false) throw new \RuntimeException('download failed');
        } catch (\Throwable $e) {
            return $this->fail('Cannot download: ' . $e->getMessage());
        }

        $filename = basename(parse_url($url, PHP_URL_PATH) ?: ('remote_' . time()));
        $mime     = (new \finfo(FILEINFO_MIME_TYPE))->buffer($bin) ?: 'application/octet-stream';

        $client = Services::curlrequest([
            'timeout'     => $cfg['timeout'],
            'http_errors' => false,
            'headers'     => [
                'Authorization' => 'Basic ' . base64_encode($cfg['wp_user'] . ':' . $cfg['wp_app_password']),
                'Accept'        => 'application/json',
                'User-Agent'    => 'GoldenWin-Uploader/1.0',
            ],
            'verify'      => $cfg['ssl_verify'],
        ]);

        // RAW
        try {
            $resp = $client->post($cfg['wp_media_endpoint'], [
                'headers' => [
                    'Content-Type'        => $mime,
                    'Content-Disposition' => 'attachment; filename="' . $filename . '"',
                ],
                'body' => $bin,
            ]);
            if ($resp->getStatusCode() === 201) {
                $json = json_decode((string) $resp->getBody(), true);
                if (is_array($json) && isset($json['source_url'])) {
                    $this->updateMeta($client, $cfg['wp_media_endpoint'], $json['id'] ?? null, $title, $alt, $caption);
                    return $this->respondCreated($this->pickMedia($json));
                }
            }
        } catch (\Throwable $e) {
            log_message('error', 'UploadFromUrl RAW error: ' . $e->getMessage());
        }

        // Multipart
        try {
            $code2 = $resp2->getStatusCode();
            $body2 = (string) $resp2->getBody();
            $ctype = $resp2->getHeaderLine('Content-Type');

            if ($code2 === 201) {
                $json2 = json_decode($body2, true);
                if (is_array($json2) && isset($json2['source_url'])) {
                    return $this->respondCreated($this->pickMedia($json2));
                }
            }

// nếu WP trả 200 nhưng không phải JSON ⇒ coi là upstream sai (502)
            if ($code2 === 200 && $this->isHtml($body2, $ctype)) {
                log_message('error', "WP returned HTML with 200 at media endpoint. Ctype=$ctype First200=" . substr($body2,0,200));
                return $this->fail('Unexpected response from WP (HTML). Check WP_MEDIA_ENDPOINT / cache / auth.', 502);
            }

            $err = $this->minifyWpError($body2);
            log_message('error', 'WP multipart fail ['.$code2.']: ' . $err['log']);
// nếu không phải lỗi 4xx/5xx, vẫn ép về 502 để FE biết là lỗi upstream
            $http = ($code2 >= 400 && $code2 <= 599) ? $code2 : 502;
            return $this->fail($err['client'], $http);

        } catch (\Throwable $e) {
            return $this->failServerError('UploadFromUrl multipart error: ' . $e->getMessage());
        }
    }

    /* -------------------- Helpers -------------------- */
    private function pickMedia(array $m): array
    {
        $sizes = $m['media_details']['sizes'] ?? [];
        $pick = fn($k) => $sizes[$k]['source_url'] ?? null;

        return [
            'id'         => $m['id'] ?? null,
            'url'        => $m['source_url'] ?? null,
            'url_medium' => $pick('medium') ?? $pick('medium_large') ?? $pick('thumbnail') ?? ($m['source_url'] ?? null),
            'filename'   => $m['media_details']['file'] ?? null,
            'mime_type'  => $m['mime_type'] ?? null,
            'width'      => $m['media_details']['width'] ?? null,
            'height'     => $m['media_details']['height'] ?? null,
            'title'      => $m['title']['rendered'] ?? null,
            'alt_text'   => $m['alt_text'] ?? null,
        ];
    }
    private function minifyWpError(string $body): array
    {
        $j = json_decode($body, true);
        if (is_array($j) && isset($j['code'], $j['message'])) {
            return ['client' => $j['message'] . ' (' . $j['code'] . ')', 'log' => $j['message'] . ' (' . $j['code'] . ')'];
        }
        return ['client' => 'Unexpected response from WP.', 'log' => substr($body, 0, 1000)];
    }
    private function updateMeta($client, string $mediaEndpoint, $id, $title = null, $alt = null, $caption = null): void
    {
        if (!$id) return;
        $url = rtrim($mediaEndpoint, '/') . '/' . $id;
        $data = [];
        if ($title)   $data['title']    = $title;
        if ($alt)     $data['alt_text'] = $alt;
        if ($caption) $data['caption']  = $caption;
        if ($data) {
            try { $client->post($url, ['form_params' => $data]); }
            catch (\Throwable $e) { log_message('warning', 'updateMeta failed: ' . $e->getMessage()); }
        }
    }
}
