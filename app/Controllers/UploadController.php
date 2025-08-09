<?php

namespace App\Controllers;

use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;
use Config\Services;

class UploadController extends ResourceController
{
    /** Đọc và chuẩn hoá config từ .env */
    private function getUploadConfig(): array
    {
        return [
            'upload_dir'    => rtrim(env('UPLOAD_DIR', WRITEPATH . '../public/uploads/'), DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR,
            'assets_domain' => rtrim(env('ASSETS_DOMAIN', 'https://assets.goldenwin.vn/files'), '/'),
            'cors_origins'  => $this->envList(),
        ];
    }

    /** Tách list trong .env thành mảng, ngăn cách bởi dấu phẩy */
    private function envList(): array
    {
        $raw = (string) env('CORS_ALLOWED_ORIGINS', '');
        if ($raw === '') return [];
        $items = preg_split('/\s*,\s*/', $raw, -1, PREG_SPLIT_NO_EMPTY);
        // Loại trùng và chuẩn hoá bỏ dấu / cuối
        return array_unique(array_map(fn($o) => rtrim($o, '/'), $items));
    }

    /** Kiểm tra origin có được phép không (so khớp chính xác + hỗ trợ *) */
    private function isAllowedOrigin(?string $origin, array $allowed): bool
    {
        if (!$origin) return false;
        $origin = rtrim($origin, '/');

        if (in_array('*', $allowed, true)) return true;
        if (in_array($origin, $allowed, true)) return true;

        // Hỗ trợ pattern đơn giản: https://*.goldenwin.vn
        foreach ($allowed as $pat) {
            if (str_contains($pat, '*')) {
                $regex = '#^' . str_replace('\*', '.*', preg_quote($pat, '#')) . '$#i';
                if (preg_match($regex, $origin)) return true;
            }
        }
        return false;
    }

    /** Set CORS headers cho response */
    private function applyCorsHeaders(string $origin): void
    {
        $this->response
            ->setHeader('Access-Control-Allow-Origin', $origin)
            ->setHeader('Vary', 'Origin')
            ->setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS')
            ->setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With')
            ->setHeader('Access-Control-Allow-Credentials', 'true');
    }

    public function upload(): ResponseInterface
    {
        $file = $this->request->getFile('file');
        if (!$file || !$file->isValid()) {
            return $this->fail('Thiếu file hoặc file không hợp lệ.');
        }

        $endpoint = (string) env('WP_MEDIA_ENDPOINT', '');
        $user     = (string) env('WP_USER', '');
        $pass     = (string) env('WP_APP_PASSWORD', '');
        if ($endpoint === '' || $user === '' || $pass === '') {
            return $this->failServerError('Thiếu cấu hình WP_MEDIA_ENDPOINT / WP_USER / WP_APP_PASSWORD.');
        }

        $auth   = 'Basic ' . base64_encode($user . ':' . $pass);
        $ctype  = $file->getMimeType() ?: 'application/octet-stream';
        $client = Services::curlrequest([
            'timeout'     => 40,
            'http_errors' => false,
            'headers'     => [
                'Authorization' => $auth,
                'Accept'        => 'application/json',
            ],
        ]);

        // Gửi y như Postman: multipart/form-data với key "file"
        $resp = $client->post($endpoint, [
            'multipart' => [[
                'name'     => 'file',
                'contents' => fopen($file->getTempName(), 'rb'),
                'filename' => $file->getName(),     // hoặc $file->getRandomName()
                'headers'  => ['Content-Type' => $ctype],
            ]],
        ]);

        $code = $resp->getStatusCode();
        $body = (string) $resp->getBody();
        if ($code === 201) {
            $json = json_decode($body, true);
            return $this->respond([
                'id'  => $json['id'] ?? null,
                'url' => $json['source_url'] ?? null,
            ]);
        }

        // Trả nguyên body để dễ debug như khi test Postman
        return $this->failServerError($body ?: ('WordPress trả mã ' . $code));
    }

    public function uploadFromUrl(): ResponseInterface
    {
        $config = $this->getUploadConfig();
        $origin = $_SERVER['HTTP_ORIGIN'] ?? null;

        // preflight cho endpoint này
        if ($this->request->getMethod(true) === 'OPTIONS') {
            if ($origin && $this->isAllowedOrigin($origin, $config['cors_origins'])) {
                $this->applyCorsHeaders($origin);
                return $this->respond('', 204);
            }
            return $this->failForbidden('CORS blocked.');
        }
        if ($origin) $this->applyCorsHeaders($origin);

        $url = $this->request->getJSON()->url ?? null;
        if (!$url || !filter_var($url, FILTER_VALIDATE_URL)) {
            return $this->fail('URL không hợp lệ.');
        }

        try {
            $imageContents = file_get_contents($url); // cần bật allow_url_fopen
        } catch (\Throwable $e) {
            return $this->fail('Không thể tải ảnh từ URL.');
        }

        $ext = strtolower(pathinfo(parse_url($url, PHP_URL_PATH) ?? '', PATHINFO_EXTENSION) ?: 'jpg');
        $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
        if (!in_array($ext, $allowedExtensions, true)) {
            return $this->fail('Định dạng file không được hỗ trợ.');
        }

        if (!is_dir($config['upload_dir'])) {
            mkdir($config['upload_dir'], 0777, true);
        }

        $filename = uniqid('', true) . '.' . $ext;
        file_put_contents($config['upload_dir'] . $filename, $imageContents);

        $publicUrl = $config['assets_domain'] . '/' . $filename;
        return $this->respond(['url' => $publicUrl]);
    }


}
