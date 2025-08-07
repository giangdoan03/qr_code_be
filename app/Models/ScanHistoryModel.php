<?php

namespace App\Models;

use CodeIgniter\Model;

class ScanHistoryModel extends Model
{
    protected $table = 'qr_scan_logs'; // ✅ đúng tên bảng
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'qr_id',
        'tracking_code',
        'short_code',       // thêm nếu dùng
        'target_id',
        'target_type',
        'type',
        'qr_url',
        'user_agent',
        'os',
        'device_type',
        'browser',
        'ip_address',
        'referer',
        'scan_source',      // thêm nếu có
        'is_unique',        // thêm nếu có
        'country',
        'city',
        'latitude',
        'longitude',
        'phone_number',
        'qr_name',          // ✅ tên QR code
        'object_name',      // ✅ tên đối tượng (product name)
        'object_image',     // ✅ ảnh đối tượng (avatar[0])
        'qr_type',          // ✅ free / pro
        'customer',         // ✅ tên khách hàng hoặc mã
        'app',              // trình duyệt / ứng dụng
    ];


    protected $useTimestamps = true;
    protected $createdField = 'created_at';
}

