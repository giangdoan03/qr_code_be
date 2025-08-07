<?php

namespace App\Controllers;

use App\Models\ProductModel;
use App\Models\BusinessModel;
use App\Models\QrCodeModel;
use App\Models\EventModel;
use App\Models\PersonModel;
use App\Models\PurchaseHistoryModel;
use App\Models\UserModel;
use CodeIgniter\RESTful\ResourceController;
use App\Traits\AuthTrait;

class StatisticsController extends ResourceController
{
    use AuthTrait;

    protected $format = 'json';

    public function index()
    {
        $user = $this->getUser(); // Gồm cả id và role
        $userId = $user['id'];
        $role = $user['role'] ?? 'customer'; // fallback

        $productModel = new ProductModel();
        $businessModel = new BusinessModel();
        $qrModel = new QrCodeModel();
        $eventModel = new EventModel();
        $personModel = new PersonModel();
        $purchaseModel = new PurchaseHistoryModel();

        // Nếu là admin → không lọc user_id
        if ($role === 'admin') {
            return $this->respond([
                'packages'      => $purchaseModel->countAllResults(),
                'products'      => $productModel->countAllResults(),
                'businesses'    => $businessModel->countAllResults(),
                'qrcodes'       => $qrModel->countAllResults(),
                'free_qrcodes'  => $qrModel->where('qr_type', 'free')->countAllResults(),
                'surveys'       => $eventModel->where('format_type', 'survey')->countAllResults(),
                'persons'       => $personModel->countAllResults()
            ]);
        }

        // Nếu là customer → chỉ đếm theo user_id
        return $this->respond([
            'packages'      => $purchaseModel->where('customer_id', $userId)->countAllResults(),
            'products'      => $productModel->where('user_id', $userId)->countAllResults(),
            'businesses'    => $businessModel->where('user_id', $userId)->countAllResults(),
            'qrcodes'       => $qrModel->where('user_id', $userId)->countAllResults(),
            'free_qrcodes'  => $qrModel->where('user_id', $userId)->where('qr_type', 'free')->countAllResults(),
            'surveys'       => $eventModel->where('user_id', $userId)->where('format_type', 'survey')->countAllResults(),
            'persons'       => $personModel->where('user_id', $userId)->countAllResults()
        ]);
    }

    public function getUser(): array
    {
        $model = new UserModel();
        $userId = session()->get('user_id'); // hoặc token
        return $model->find($userId);
    }

}
