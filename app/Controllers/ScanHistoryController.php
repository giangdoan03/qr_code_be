<?php

namespace App\Controllers;

use App\Models\QrScanLogModel;
use App\Models\UserModel;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;
use App\Traits\AuthTrait;

class ScanHistoryController extends ResourceController
{
    use AuthTrait;

    protected $format = 'json';
    protected $scanLogModel;

    public function __construct()
    {
        $this->scanLogModel = new QrScanLogModel();
    }

    public function index()
    {
        $user = $this->getUser();
        $userId = $user['id'];
        $role = $user['role'] ?? 'customer';

        $perPage = (int) ($this->request->getGet('per_page') ?? 10);
        $page = (int) ($this->request->getGet('page') ?? 1);
        $search = $this->request->getGet('search');

        $builder = $this->scanLogModel;

        if ($role !== 'admin') {
            $builder = $builder->where('user_id', $userId);
        }

        if ($search) {
            $builder = $builder->groupStart()
                ->like('qr_type', $search)
                ->orLike('city', $search)
                ->groupEnd();
        }

        $total = $builder->countAllResults(false);
        $results = $builder
            ->orderBy('created_at', 'DESC')
            ->findAll($perPage, ($page - 1) * $perPage);

        // 🔁 Bổ sung thêm thông tin QR và đối tượng
        foreach ($results as &$item) {
            $qr = model('QrCodeModel')->where('qr_id', $item['qr_id'])->first();

            $item['qr_name'] = $qr['qr_name'] ?? null;
            $item['qr_type'] = $qr['qr_type'] ?? null;

            if ($qr && $qr['target_type'] && $qr['target_id']) {
                $item['object_name'] = null;
                $item['object_image'] = $this->getObjectImage($qr['target_type'], (int)$qr['target_id']);

                // Gán tên đối tượng (nếu có)
                $modelMap = [
                    'product' => 'ProductModel',
                    'store' => 'StoreModel',
                    'event' => 'EventModel',
                    'person' => 'PersonModel',
                    'business' => 'BusinessModel',
                ];

                $targetModel = $modelMap[$qr['target_type']] ?? null;
                if ($targetModel) {
                    $target = model("App\\Models\\$targetModel")->find($qr['target_id']);
                    $item['object_name'] = $target['name'] ?? null;
                }
            }
        }


        return $this->respond([
            'data' => $results,
            'pager' => [
                'total' => $total,
                'per_page' => $perPage,
                'current_page' => $page,
            ]
        ]);
    }

    public function show($id = null)
    {
        $data = $this->scanLogModel->find($id);

        return $data
            ? $this->respond($data)
            : $this->failNotFound('Không tìm thấy lịch sử quét');
    }

    public function create()
    {
        $json = $this->request->getJSON(true);
        $cleanData = [];

        foreach ($json ?? [] as $key => $value) {
            if (is_string($key)) {
                $cleanData[$key] = $value;
            }
        }

        $request = service('request');
        $cleanData['ip_address'] = $request->getIPAddress();
        $cleanData['user_agent'] = (string) $request->getUserAgent();
        $cleanData['os'] = $request->getUserAgent()->getPlatform();
        $cleanData['app'] = $request->getUserAgent()->getBrowser();
        $cleanData['created_at'] = date('Y-m-d H:i:s');


        if (!empty($cleanData['qr_id'])) {
            $qr = model('QrCodeModel')->where('qr_id', $cleanData['qr_id'])->first();
            if ($qr && !empty($qr['user_id'])) {
                $cleanData['user_id'] = $qr['user_id']; // 👈 THÊM DÒNG NÀY
            }
        }


        $this->scanLogModel->insert($cleanData);
        $cleanData['id'] = $this->scanLogModel->getInsertID();

        return $this->respondCreated($cleanData);
    }

    public function delete($id = null)
    {
        if ($this->scanLogModel->delete($id)) {
            return $this->respondDeleted(['id' => $id, 'message' => 'Đã xoá']);
        }

        return $this->failNotFound('Không xoá được bản ghi');
    }

    public function summary(): ResponseInterface
    {
        $user = $this->getUser();
        $userId = $user['id'];
        $role = $user['role'] ?? 'customer';

        $builder = $this->scanLogModel->builder();
        if ($role !== 'admin') {
            $builder->where('user_id', $userId);
        }

        $summary = [
            'by_country' => (clone $builder)->select('country, COUNT(*) as total')
                ->groupBy('country')->get()->getResult(),
            'by_city' => (clone $builder)->select('city, COUNT(*) as total')
                ->groupBy('city')->get()->getResult(),
            'by_device' => (clone $builder)->select('device_type, COUNT(*) as total')
                ->groupBy('device_type')->get()->getResult(),
            'by_browser' => (clone $builder)->select('browser, COUNT(*) as total')
                ->groupBy('browser')->get()->getResult(),
            'by_os' => (clone $builder)->select('os, COUNT(*) as total')
                ->groupBy('os')->get()->getResult(),
        ];

        return $this->respond($summary);
    }

    // ⚠️ Phải có nếu dùng getUser thay getAuth
    public function getUser(): array
    {
        $model = new UserModel();
        $userId = session()->get('user_id');

        if (!$userId) {
            throw new \RuntimeException('Chưa đăng nhập hoặc session hết hạn.');
        }

        $user = $model->find($userId);
        if (!$user) {
            throw new \RuntimeException('Người dùng không tồn tại trong hệ thống.');
        }

        return $user;
    }

    private function isJson($string): bool
    {
        json_decode($string);
        return (json_last_error() === JSON_ERROR_NONE);
    }

    private function getObjectImage(string $type, int $id): ?string
    {
        $modelMap = [
            'product'  => 'ProductModel',
            'business' => 'BusinessModel',
            'person'   => 'PersonModel',
            'event'    => 'EventModel',
            'store'    => 'StoreModel',
        ];

        if (!isset($modelMap[$type])) return null;

        $model = model("App\\Models\\{$modelMap[$type]}");
        $target = $model->find($id);

        if (!$target || !is_array($target)) return null;

        // ✅ Ưu tiên lấy từ 'images'
        $imagesRaw = $target['images'] ?? null;
        if ($imagesRaw) {
            // Nếu là chuỗi JSON
            if (is_string($imagesRaw)) {
                $decoded = json_decode($imagesRaw, true);
                if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                    foreach ($decoded as $img) {
                        if (
                            isset($img['isCover']) && $img['isCover'] &&
                            isset($img['url']) && $img['url']
                        ) {
                            return $img['url'];
                        }
                    }

                    // fallback: trả về ảnh đầu tiên
                    return $decoded[0]['url'] ?? null;
                }
            }

            // Nếu là mảng
            if (is_array($imagesRaw)) {
                foreach ($imagesRaw as $img) {
                    if (
                        isset($img['isCover']) && $img['isCover'] &&
                        isset($img['url']) && $img['url']
                    ) {
                        return $img['url'];
                    }
                }

                return $imagesRaw[0]['url'] ?? null;
            }
        }

        // ✅ fallback sang avatar, logo, banner
        foreach (['avatar', 'logo', 'banner'] as $field) {
            if (!empty($target[$field])) {
                $val = $target[$field];

                if (is_string($val) && $this->isJson($val)) {
                    $decoded = json_decode($val, true);
                    return $decoded[0]['url'] ?? $decoded[0] ?? null;
                }

                if (is_array($val)) {
                    return $val[0]['url'] ?? $val[0] ?? null;
                }

                if (is_string($val)) {
                    return $val;
                }
            }
        }

        return null;
    }



}
