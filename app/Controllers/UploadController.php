<?php

namespace App\Controllers;

use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;

class UploadController extends ResourceController
{
    private function getUploadConfig(): array
    {
        return [
            'upload_dir'    => rtrim(env('UPLOAD_DIR', WRITEPATH . '../public/uploads/'), '/') . '/',
            'assets_domain' => rtrim(env('ASSETS_DOMAIN', 'http://assets.giang.test/image/'), '/')
        ];
    }

    private function getAllowedOrigins(): array
    {
        // Cho phép origin động tuỳ theo môi trường
        return [
            // Localhost
            'http://giang.test:5173',
            'http://api.giang.test',

            // Trên VPS / production
            'https://admin-qrcode.labit365.com',
            'https://qrcode.labit365.com',
            'https://api-qrcode.labit365.com',
        ];
    }

    public function upload(): ResponseInterface
    {
        $allowedOrigins = $this->getAllowedOrigins();
        $origin = $_SERVER['HTTP_ORIGIN'] ?? null;

        if ($origin && !in_array($origin, $allowedOrigins)) {
            return $this->failForbidden('Không được phép upload từ domain này.');
        }

        $file = $this->request->getFile('file');
        if (!$file || !$file->isValid()) {
            return $this->fail('Không tìm thấy file hoặc file không hợp lệ.');
        }

        $config = $this->getUploadConfig();

        if (!is_dir($config['upload_dir'])) {
            mkdir($config['upload_dir'], 0777, true);
        }

        $newName = $file->getRandomName();
        $file->move($config['upload_dir'], $newName);

        $publicUrl = $config['assets_domain'] . '/' . $newName;

        return $this->respond(['url' => $publicUrl]);
    }

    public function uploadFromUrl(): ResponseInterface
    {
        $url = $this->request->getJSON()->url ?? null;

        if (!$url || !filter_var($url, FILTER_VALIDATE_URL)) {
            return $this->fail('URL không hợp lệ.');
        }

        try {
            $imageContents = file_get_contents($url);
        } catch (\Exception $e) {
            return $this->fail('Không thể tải ảnh từ URL.');
        }

        $pathInfo = pathinfo($url);
        $extension = isset($pathInfo['extension']) ? strtolower($pathInfo['extension']) : 'jpg';
        $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

        if (!in_array($extension, $allowedExtensions)) {
            return $this->fail('Định dạng file không được hỗ trợ.');
        }

        $filename = uniqid() . '.' . $extension;
        $config = $this->getUploadConfig();

        if (!is_dir($config['upload_dir'])) {
            mkdir($config['upload_dir'], 0777, true);
        }

        file_put_contents($config['upload_dir'] . $filename, $imageContents);

        $publicUrl = $config['assets_domain'] . '/' . $filename;

        return $this->respond(['url' => $publicUrl]);
    }
}
