<?php

namespace App\Models;

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id';

    // Danh sách các trường cho phép thêm/sửa
    protected $allowedFields = [
        'email',
        'password',
        'name',
        'phone',
        'avatar',
        'role',
        'role_id',
        'address',
        'city',
        'status',
        'payment_status',
        'is_expired',
        'package_id',
        'package_start_date',
        'package_end_date',
        'note',
        'qr_quota',
        'qr_used',
        'created_at',
        'updated_at',
        'company_name',
        'tax_code',
        'customer_type',
    ];

    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
}
