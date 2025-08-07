<?php
namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UserModel;
use CodeIgniter\HTTP\RedirectResponse;
use App\Models\{QrCodeModel, QrScanLogModel};
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\CustomerModel;
use App\Traits\AuthTrait;
use Random\RandomException;


class QrCodeController extends BaseController
{
    use AuthTrait;
    use ResponseTrait;
    protected QrCodeModel $model;

    public function __construct()
    {
        $this->model = new QrCodeModel();
    }

    private const QR_TYPES_NO_TARGET = [
        'url', 'text', 'sms', 'email', 'phone', 'vcard', 'map', 'calendar',
        'wifi', 'pdf', 'audio', 'video', 'image', 'custom-url', 'app-store'
    ];

    /**
     * Lấy mã QR thuộc về người dùng
     */
    private function getOwnedQR($qr_id): object|array
    {
        $userId = $this->getUserId();

        // 👉 Lấy thông tin QR
        $qr = $this->model->where('qr_id', $qr_id)->first();
        if (!$qr) {
            return $this->failNotFound('Không tìm thấy mã QR');
        }

        // 👉 Lấy thông tin user
        $user = model('App\Models\UserModel')->find($userId);
        if (!$user) {
            return $this->failForbidden('Không xác định được người dùng');
        }

        // 👉 Chỉ admin mới được xem tất cả
        if ($user['role'] !== 'admin' && $qr['user_id'] != $userId) {
            return $this->failForbidden('Bạn không có quyền với mã QR này');
        }

        return $qr;
    }


    /**
     * Tạo QR Code mới
     * @throws RandomException
     * @throws \ReflectionException
     */
    public function create(): ResponseInterface
    {
        $data = $this->request->getJSON(true);
        $userId = $this->getUserId();

        // 👉 Lấy thông tin user
        $user = model('App\Models\UserModel')->find($userId);
        if (!$user || $user['status'] != 1) {
            return $this->failForbidden('Tài khoản không đủ điều kiện tạo mã QR. Vui lòng liên hệ bộ phận kinh doanh hoặc quản trị viên.');
        }

        // 👉 Giới hạn QR
        $count = $this->model->where('user_id', $userId)->countAllResults();
        $limit = 200; // Giới hạn mặc định

        // Nếu có cột max_qr_limit trong bảng users thì lấy từ đó
        if (!empty($user['max_qr_limit'])) {
            $limit = (int)$user['max_qr_limit'];
        }

        if ($count >= $limit) {
            return $this->failForbidden("Bạn đã đạt giới hạn {$limit} mã QR. Vui lòng liên hệ bộ phận kinh doanh để nâng cấp gói.");
        }

        // 👉 Tạo short_code và qr_id nếu chưa có
        if (empty($data['short_code'])) {
            $data['short_code'] = bin2hex(random_bytes(4));
        }

        if (empty($data['qr_id'])) {
            do {
                $data['qr_id'] = bin2hex(random_bytes(4));
            } while ($this->model->where('qr_id', $data['qr_id'])->first());
        }

        if (isset($data['settings_json']) && is_array($data['settings_json'])) {
            $data['settings_json'] = json_encode($data['settings_json']);
        }

        if (in_array($data['target_type'], self::QR_TYPES_NO_TARGET)) {
            $data['target_id'] = null;
        }

        $data['user_id'] = $userId;

        if (!$this->model->insert($data)) {
            log_message('error', 'QR Insert Failed: ' . json_encode($data));
            return $this->fail($this->model->errors());
        }

        return $this->respondCreated([
            'id' => $this->model->getInsertID(),
            'qr_id' => $data['qr_id'],
            'short_code' => $data['short_code']
        ]);
    }




/**
     * Cập nhật QR Code
     * @throws \ReflectionException
     */
    public function update(string $qr_id): ResponseInterface
    {
        $data = $this->request->getJSON(true);
        $qr = $this->getOwnedQR($qr_id);
        if ($qr instanceof ResponseInterface) return $qr;

        // 👇 Lấy thông tin user
        $userId = $this->getUserId();
        $userModel = new UserModel();
        $user = $userModel->find($userId);

        // 👇 Chặn nếu tài khoản không hoạt động
        if (!$user || $user['status'] != 1) {
            return $this->failForbidden('Tài khoản không đủ điều kiện cập nhật mã QR. Vui lòng liên hệ bộ phận kinh doanh hoặc quản trị viên.');
        }

        if (isset($data['settings_json']) && is_array($data['settings_json'])) {
            $data['settings_json'] = json_encode($data['settings_json']);
        }

        // 👇 Xử lý target_id nếu không cần thiết
        if (in_array($data['target_type'], self::QR_TYPES_NO_TARGET)) {
            $data['target_id'] = null;
        }

        if (!$this->model->update($qr['id'], $data)) {
            return $this->fail($this->model->errors());
        }

        return $this->respondUpdated(['qr_id' => $qr_id]);
    }



    /**
     * Xoá QR Code
     */
    public function delete(string $qr_id): ResponseInterface
    {
        $qr = $this->getOwnedQR($qr_id);
        if ($qr instanceof ResponseInterface) return $qr;

        if (!$this->model->delete($qr['id'])) {
            return $this->fail('Không xoá được mã QR');
        }

        return $this->respondDeleted(['qr_id' => $qr_id]);
    }

    /**
     * Lấy chi tiết 1 QR Code
     */
    public function show($qr_id): ResponseInterface
    {
        $qr = $this->getOwnedQR($qr_id);
        if ($qr instanceof ResponseInterface) return $qr;

        $qr['settings_json'] = json_decode($qr['settings_json'], true);
        return $this->respond(['data' => $qr]);
    }

    /**
     * Quét QR và chuyển hướng có tracking
     */
    public function scan($trackingCode): ResponseInterface
    {
        $qrId = $this->request->getGet('code');
        if (!$qrId) {
            return redirect()->to('/not-found');
        }

        $qr = $this->model->where('qr_id', $qrId)->first();
        if (!$qr || !$qr['is_active']) {
            return redirect()->to('/not-found');
        }

        return redirect()->to(base_url("/" . $qrId));
    }


    /**
     * Danh sách QR Code theo user, filter
     */
    public function list(): ResponseInterface
    {
        $user = $this->getUser(); // 👈 Lấy toàn bộ thông tin user từ session
        $userId = $user['id'];
        $role = $user['role'] ?? 'customer';

        $search = $this->request->getGet('search');
        $type = $this->request->getGet('type');

        $builder = $this->model;

        // 👇 Nếu không phải admin thì chỉ được thấy mã của chính mình
        if ($role !== 'admin') {
            $builder = $builder->where('user_id', $userId);
        }

        if ($search) {
            $builder = $builder->groupStart()
                ->like('qr_name', $search)
                ->orLike('qr_url', $search)
                ->groupEnd();
        }

        if ($type) {
            $builder = $builder->where('target_type', $type);
        }

        $data = $builder->orderBy('created_at', 'DESC')->findAll();

        foreach ($data as &$item) {
            $item['target_name'] = '';

            switch ($item['target_type']) {
                case 'product':
                    $target = model('ProductModel')->find($item['target_id']);
                    break;
                case 'store':
                    $target = model('StoreModel')->find($item['target_id']);
                    break;
                case 'event':
                    $target = model('EventModel')->find($item['target_id']);
                    break;
                case 'person':
                    $target = model('PersonModel')->find($item['target_id']);
                    break;
                case 'business':
                    $target = model('BusinessModel')->find($item['target_id']);
                    break;
                default:
                    $target = null;
            }

            $item['target_name'] = $target['name'] ?? '';
        }

        return $this->respond($data);
    }

    protected function getUser(): array
    {
        $userId = session()->get('user_id');
        if (!$userId) {
            throw new \RuntimeException('Chưa đăng nhập.');
        }

        $user = model('UserModel')->find($userId);
        if (!$user) {
            throw new \RuntimeException('Người dùng không tồn tại.');
        }

        return $user;
    }


    // 👉 Thêm hàm helper này vào trong class
    private function safeJsonDecode($value)
    {
        if (is_string($value)) {
            $decoded = json_decode($value, true);
            if (json_last_error() === JSON_ERROR_NONE) {
                return $decoded;
            }
        }
        return $value;
    }

    public function detail(string $qr_id): ResponseInterface
    {
        $qr = $this->model->where('qr_id', $qr_id)->first();

        if (!$qr) {
            return $this->respond([
                'qr' => null,
                'target' => null,
                'message' => 'QR không tồn tại'
            ]);
        }

        $target = match ($qr['target_type']) {
            'product'  => model('ProductModel')->find($qr['target_id']),
            'store'    => model('StoreModel')->find($qr['target_id']),
            'event'    => model('EventModel')->find($qr['target_id']),
            'business' => model('BusinessModel')->find($qr['target_id']),
            'person'   => model('PersonModel')->find($qr['target_id']),
            default => $qr['target_type'] === 'url' || $qr['target_type'] === 'custom'
                ? ['url' => $qr['qr_url']]
                : $qr,
        };

        if (!$target) {
            return $this->respond([
                'qr' => $qr,
                'target' => null,
                'message' => 'Không tìm thấy dữ liệu mục tiêu'
            ]);
        }

        // 🔁 Decode các trường JSON cần thiết
        foreach ([
                     'image', 'images', 'avatar', 'video', 'certificate_file', 'display_settings',
                     'attributes', 'logo', 'cover_image', 'library_images', 'video_intro',
                     'social_links', 'other_links', 'extra_info', 'contact_phone', 'product_ids'
                 ] as $field) {
            if (isset($target[$field])) {
                $target[$field] = $this->safeJsonDecode($target[$field]);
            }
        }

        $productModel = model('ProductModel');
        $businessModel = model('BusinessModel');
        $storeModel = model('StoreModel');
        $personModel = model('PersonModel');
        $eventModel = model('EventModel');

        if ($qr['target_type'] === 'event') {
            $event = $eventModel->where('id', $qr['target_id'])->first();

            if ($event) {
                foreach (['description', 'ticket_options', 'social_links', 'images', 'video', 'display_settings'] as $field) {
                    if (!empty($event[$field]) && is_string($event[$field])) {
                        $decoded = json_decode($event[$field], true);
                        if (is_string($decoded)) {
                            $decoded = json_decode($decoded, true);
                        }
                        $event[$field] = is_array($decoded) ? $decoded : [];
                    }
                    if (!empty($event['description']) && is_array($event['description'])) {
                        foreach ($event['description'] as &$desc) {
                            $desc['title'] = isset($desc['title']) ? strip_tags($desc['title']) : '';
                            $desc['content'] = isset($desc['content']) ? strip_tags($desc['content']) : '';
                        }
                        unset($desc); // Giải phóng tham chiếu
                    }

                    if (!empty($event['ticket_options']) && is_array($event['ticket_options'])) {
                        foreach ($event['ticket_options'] as &$desc) {
                            $desc['title'] = isset($desc['title']) ? strip_tags($desc['title']) : '';
                            $desc['description'] = isset($desc['description']) ? strip_tags($desc['description']) : '';
                        }
                        unset($desc); // Giải phóng tham chiếu
                    }


                }

                // Chuyển đổi thời gian thành ISO string
                $event['start_time'] = date('c', strtotime($event['start_time']));
                $event['end_time'] = date('c', strtotime($event['end_time']));

                // ⚠ Gán lại toàn bộ
                $target = $event;
            }
        }

        if (!empty($target['display_settings']) && is_array($target['display_settings'])) {
            $ds = &$target['display_settings'];
            $userId = $target['user_id'] ?? null;

            // ✅ Nếu là 'all' → Lấy theo user_id
            if ($userId) {
                if (($ds['relatedProducts'] ?? '') === 'all') {
                    $ds['selectedProducts'] = array_column(
                        $productModel->select('id')->where('status', 1)->where('user_id', $userId)->findAll(10),
                        'id'
                    );
                }

                if (($ds['company'] ?? '') === 'all') {
                    $ds['selectedCompanies'] = array_column(
                        $businessModel->select('id')->where('status', 1)->where('user_id', $userId)->findAll(),
                        'id'
                    );
                }

                if (($ds['store'] ?? '') === 'all') {
                    $ds['selectedStores'] = array_column(
                        $storeModel->select('id')->where('status', 1)->where('user_id', $userId)->findAll(),
                        'id'
                    );
                }
            }

            // ✅ Lấy thông tin selectedProducts
            if (!empty($ds['selectedProducts'])) {
                $products = $productModel
                    ->whereIn('id', $ds['selectedProducts'])
                    ->where('status', 1)
                    ->orderBy('created_at', 'DESC')
                    ->findAll(5);

                $target['selectedProducts'] = $this->decodeMediaFields($products, [
                    'avatar' => true,
                    'images', 'video', 'certificate_file', 'attributes'
                ]);
            }

            // ✅ topProducts
            if (!empty($ds['topProducts'])) {
                $products = $productModel
                    ->whereIn('id', $ds['topProducts'])
                    ->where('status', 1)
                    ->findAll();

                $target['topProducts'] = $this->decodeMediaFields($products, [
                    'avatar' => true,
                    'images', 'video', 'certificate_file', 'attributes'
                ]);
            }

            // ✅ selectedCompanies
            if (!empty($ds['selectedCompanies'])) {
                $companies = $businessModel
                    ->whereIn('id', $ds['selectedCompanies'])
                    ->where('status', 1)
                    ->findAll();

                $target['selectedCompanies'] = $this->decodeMediaFields($companies, [
                    'logo' => true, 'cover_image' => true,
                    'library_images', 'video_intro', 'certificate_file'
                ]);
            }

            // ✅ selectedStores
            if (!empty($ds['selectedStores'])) {
                $stores = $storeModel
                    ->whereIn('id', $ds['selectedStores'])
                    ->where('status', 1)
                    ->findAll();

                $target['selectedStores'] = $this->decodeMediaFields($stores, [
                    'logo' => true, 'cover_image' => true,
                    'images', 'video'
                ]);
            }

            // ✅ Nếu QR trỏ đến person → bổ sung thêm phần person chi tiết luôn
            if ($qr['target_type'] === 'person') {
                $person = $personModel
                    ->where('id', $qr['target_id'])
                    ->first();

                if ($person) {
                    // Decode avatar, social_links nếu là JSON
                    foreach (['avatar', 'social_links', 'video_url', 'certificate_file', 'display_settings'] as $field) {
                        if (!empty($person[$field]) && is_string($person[$field])) {
                            $decoded = json_decode($person[$field], true);
                            $person[$field] = is_array($decoded) ? $decoded : $person[$field];
                        }
                    }

                    $target['person_detail'] = $person;
                }
            }


        }

        return $this->respond([
            'qr' => $qr,
            'target' => $target,
            'message' => 'Thành công'
        ]);
    }
    private function decodeMediaFields(array $items, array $fields): array
    {
        return array_map(function ($item) use ($fields) {
            foreach ($fields as $key => $field) {
                $fieldName = is_int($key) ? $field : $key;
                $json = $item[$fieldName] ?? null;

                $decoded = $this->safeJsonDecode($json);
                if ($field === true || $key === 'avatar' || $key === 'logo' || $key === 'cover_image') {
                    $item[$fieldName] = is_array($decoded) ? ($decoded[0] ?? '') : '';
                } else {
                    $item[$fieldName] = is_array($decoded) ? $decoded : [];
                }
            }
            return $item;
        }, $items);
    }


    /**
     * @throws \ReflectionException
     */
    public function track(): ResponseInterface
    {
        $data = $this->request->getJSON(true);

        $qrId = $data['qr_id'] ?? null;
        $track = $data['track'] ?? null;
        $target_type = $data['target_type'] ?? null;
        $shortCode = $data['short_code'] ?? null;
        $qrUrl = $data['qr_url'] ?? null;
        $type = $data['type'] ?? null;
        $targetId = $data['target_id'] ?? null;
        $phone = $data['phone_number'] ?? null;
        $scanSource = $data['scan_source'] ?? null;

        if (!$qrId || !$track) {
            return $this->failValidationErrors('Thiếu qr_id hoặc tracking_code');
        }

        // Get IP, User Agent
        $ip = $this->request->getIPAddress();
        $userAgent = (string) $this->request->getUserAgent();
        $referer = $_SERVER['HTTP_REFERER'] ?? null;

        // Detect browser, OS, device
        $browser = $this->detectBrowser($userAgent);
        $os = $this->detectOS($userAgent);
        $device = $this->detectDevice($userAgent);

        if ($ip === '127.0.0.1' || $ip === '::1') {
            $country = $city = $latitude = $longitude = 1;
        } else {
            $geoData = $this->getGeoFromIP($ip);
            $country   = $geoData['country'] ?? null;
            $city      = $geoData['city'] ?? null;
            $latitude  = $geoData['lat'] ?? null;
            $longitude = $geoData['lon'] ?? null;
        }


        // is_unique = true nếu tracking_code là duy nhất cho qr_id
        $existing = model('QrScanLogModel')
            ->where('qr_id', $qrId)
            ->where('tracking_code', $track)
            ->first();

        $isUnique = $existing ? 0 : 1;

        $qrCode = model('QrCodeModel')
            ->where('qr_id', $data['qr_id'] ?? '')
            ->orWhere('short_code', $data['short_code'] ?? '')
            ->first();

        if (!$qrCode) {
            return $this->failNotFound('QR không tồn tại');
        }

        $ownerId = (int) $qr['user_id'];  // đại lý tạo QR

        model('QrScanLogModel')->insert([
            'qr_id'         => $qrId,
            'tracking_code' => $track,
            'short_code'    => $shortCode,
            'qr_url'        => $qrUrl,
            'type'          => $type,
            'target_id'     => $targetId,
            'target_type'   => $target_type,
            'user_agent'    => $userAgent,
            'os'            => $os,
            'browser'       => $browser,
            'device_type'   => $device,
            'ip_address'    => $ip,
            'referer'       => $referer,
            'scan_source'   => $scanSource,
            'is_unique'     => $isUnique,
            'country'       => $country,
            'city'          => $city,
            'latitude'      => $latitude,
            'longitude'     => $longitude,
            'phone_number'  => $phone,
            'user_id'       => $ownerId,
            'created_at'    => date('Y-m-d H:i:s')
        ]);

        return $this->respond(['status' => 'success', 'message' => 'Đã ghi tracking']);
    }


    private function getGeoFromIP(string $ip): array
    {
        try {
            $response = file_get_contents("http://ip-api.com/json/{$ip}?fields=status,country,city,lat,lon");
            $data = json_decode($response, true);

            if ($data && $data['status'] === 'success') {
                return $data;
            }
        } catch (\Throwable $e) {
            log_message('error', 'Geo IP lookup failed: ' . $e->getMessage());
        }

        return [];
    }



    private function detectBrowser(string $userAgent): string
    {
        if (str_contains($userAgent, 'Chrome')) return 'Chrome';
        if (str_contains($userAgent, 'Firefox')) return 'Firefox';
        if (str_contains($userAgent, 'Safari')) return 'Safari';
        if (str_contains($userAgent, 'Edge')) return 'Edge';
        if (str_contains($userAgent, 'MSIE') || str_contains($userAgent, 'Trident')) return 'Internet Explorer';
        return 'Khác';
    }

    private function detectOS(string $userAgent): string
    {
        if (preg_match('/windows/i', $userAgent)) return 'Windows';
        if (preg_match('/macintosh|mac os x/i', $userAgent)) return 'Mac OS';
        if (preg_match('/linux/i', $userAgent)) return 'Linux';
        if (preg_match('/android/i', $userAgent)) return 'Android';
        if (preg_match('/iphone|ipad|ipod/i', $userAgent)) return 'iOS';
        return 'Khác';
    }

    private function detectDevice(string $userAgent): string
    {
        if (preg_match('/mobile/i', $userAgent)) return 'Mobile';
        if (preg_match('/tablet/i', $userAgent)) return 'Tablet';
        return 'Desktop';
    }

    /**
     * @throws RandomException
     */
    public function redirectWithTrack($shortCode): RedirectResponse
    {
        $link = model('QrLinkModel')->where('short_code', $shortCode)->first();
        if (!$link) {
            return redirect()->to('/404');
        }

        $trackCode = bin2hex(random_bytes(4)); // mã track động

        return redirect()->to("/scan/{$trackCode}?type=scan&code={$shortCode}");
    }

    /**
     * @throws \ReflectionException
     */
    public function handleScan($trackCode): string|RedirectResponse
    {
        $shortCode = $this->request->getGet('code');
        if (!$shortCode) {
            return redirect()->to('/404');
        }

        $link = model('QrLinkModel')->where('short_code', $shortCode)->first();
        if (!$link) {
            return redirect()->to('/404');
        }

        // Ghi tracking log
        $logModel = new QrScanLogModel();
        $logModel->insert([
            'qr_id'         => $link['qr_id'],
            'tracking_code' => $trackCode,
            'ip_address'    => $this->request->getIPAddress(),
            'user_agent'    => (string) $this->request->getUserAgent(),
            'referer'       => $_SERVER['HTTP_REFERER'] ?? null,
            'browser'       => $this->detectBrowser((string) $this->request->getUserAgent()),
            'os'            => $this->detectOS((string) $this->request->getUserAgent()),
            'device_type'   => $this->detectDevice((string) $this->request->getUserAgent()),
            'created_at'    => date('Y-m-d H:i:s'),
        ]);

        // Lấy dữ liệu QR để hiển thị
        $qr = $this->model->where('qr_id', $link['qr_id'])->first();
        if (!$qr) {
            return redirect()->to('/404');
        }

        return view('qr/scan_detail', ['qr' => $qr]); // có thể thay bằng API JSON nếu dùng Vue
    }
}
