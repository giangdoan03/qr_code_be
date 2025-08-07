<?php

namespace App\Models;

use CodeIgniter\Model;

class PurchaseHistoryModel extends Model
{
    protected $table = 'purchase_histories';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'customer_id',      // Khách hàng
        'product_name',     // Tên gói: Gói Premium, Gói VIP
        'amount',           // Tổng số tiền (nếu có)
        'quantity',         // Số năm
        'note',             // Ghi chú thêm
        'purchased_at',     // Ngày mua thực tế
        'starts_at',        // Ngày bắt đầu kích hoạt
        'expires_at',       // Ngày hết hạn
        'is_paid',          // Đã thanh toán hay chưa (0|1)
        'is_active',        // Gói đã được kích hoạt hay chưa (0|1)
        'created_at', 'updated_at'
    ];

    protected $useTimestamps = true;
}
