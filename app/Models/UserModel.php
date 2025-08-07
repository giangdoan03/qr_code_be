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
        'created_at',
        'updated_at'
    ];

    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
}
