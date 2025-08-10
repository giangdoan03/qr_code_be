<?php

namespace App\Controllers;

use App\Models\PurchaseHistoryModel;
use App\Models\UserModel;
use CodeIgniter\RESTful\ResourceController;
use App\Traits\AuthTrait;
use Config\Services;

class CustomerController extends ResourceController
{
    use AuthTrait;

    protected $modelName = UserModel::class;
    protected $format    = 'json';

    public function index()
    {
        $page    = (int)($this->request->getGet('page') ?? 1);
        $perPage = (int)($this->request->getGet('per_page') ?? 10);

        // Subquery đếm QR theo user_id
        $qrCountSub = '(SELECT user_id, COUNT(*) AS qr_used FROM qr_codes GROUP BY user_id) qc';

        $userQuery = $this->model
            ->select('users.*, COALESCE(qc.qr_used, 0) AS qr_used')
            ->where('role', 'customer')
            ->join($qrCountSub, 'qc.user_id = users.id', 'left'); // <-- JOIN ở đây

        if ($search = $this->request->getGet('search')) {
            $userQuery->groupStart()
                ->like('name', $search)
                ->orLike('email', $search)
                ->orLike('phone', $search)
                ->groupEnd();
        }
        if ($phone = $this->request->getGet('phone')) $userQuery->like('phone', $phone);
        if ($email = $this->request->getGet('email')) $userQuery->like('email', $email);
        if ($city  = $this->request->getGet('city'))  $userQuery->like('city', $city);
        if ($from  = $this->request->getGet('from'))  $userQuery->where('created_at >=', $from);
        if ($to    = $this->request->getGet('to'))    $userQuery->where('created_at <=', $to);

        // Sắp xếp mới -> cũ (tùy bạn)
        $userQuery->orderBy('users.updated_at', 'DESC')
            ->orderBy('users.created_at', 'DESC')
            ->orderBy('users.id', 'DESC');

        $users = $userQuery->paginate($perPage, 'default', $page);
        $pager = $this->model->pager;

        // Nếu cần thêm thông tin gói như code cũ
        $purchaseModel = new PurchaseHistoryModel();
        $users = is_array($users) ? $users : [];

        foreach ($users as &$user) {
            unset($user['password']);

            $packages = $purchaseModel
                ->where('customer_id', $user['id'])
                ->orderBy('starts_at', 'desc')
                ->findAll();

            $user['packages'] = is_array($packages) ? $packages : [];

            $latestStatus = null;
            foreach ($user['packages'] as &$package) {
                $now = time();
                $expireTime = strtotime($package['expires_at']);

                if ((int)$package['is_paid'] === 0) {
                    $package['is_active'] = 0; $latestStatus = 2; // chưa thanh toán
                } else {
                    if ($expireTime < $now) {
                        $package['is_active'] = 0; $latestStatus = 4; // hết hạn
                    } else {
                        $package['is_active'] = 1; $latestStatus = 1; // còn hạn
                    }
                }
                $purchaseModel->update($package['id'], ['is_active' => $package['is_active']]);
            }

            if ($latestStatus !== null && (int)$user['status'] !== $latestStatus) {
                $this->model->update($user['id'], ['status' => $latestStatus]);
                $user['status'] = $latestStatus;
            }

            // $user['qr_used'] đã có từ JOIN (COALESCE(...))
        }

        return $this->respond([
            'data'  => $users,
            'pager' => [
                'total'    => $pager->getTotal(),
                'per_page' => $perPage,
                'current'  => $page,
            ]
        ]);
    }



    public function show($id = null)
    {
        $customer = $this->model
            ->where('role', 'customer')
            ->find($id);

        if (!$customer) {
            return $this->failNotFound('Không tìm thấy khách hàng');
        }

        unset($customer['password']); // ❌ Bảo vệ thông tin nhạy cảm

        // Nếu muốn trả kèm danh sách gói đã mua:
        $purchaseModel = new PurchaseHistoryModel();
        $customer['packages'] = $purchaseModel
            ->where('customer_id', $customer['id'])
            ->orderBy('starts_at', 'desc')
            ->findAll();

        return $this->respond($customer);
    }



    public function create()
    {
        $data = $this->request->getJSON(true);

        $validation = Services::validation();

        $rules = [
            'name'              => 'required',
            'email'             => 'required|valid_email|is_unique[users.email]',
            'phone'             => 'required|regex_match[/^(0|\+84)[0-9]{9,10}$/]',
            'password'          => 'required|min_length[6]',
            'confirm_password'  => 'required|matches[password]',
        ];

        if (!$this->validate($rules)) {
            return $this->failValidationErrors($validation->getErrors());
        }

        unset($data['confirm_password']);

        // ✅ Băm mật khẩu trước khi lưu
        $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);

        // ✅ Gán role là customer
        $data['role'] = 'customer';

        $id = $this->model->insert($data);
        return $this->respondCreated(['id' => $id]);
    }


    public function update($id = null)
    {
        $existing = $this->model->where('role', 'customer')->find($id);

        if (!$existing) {
            return $this->failNotFound('Không tìm thấy khách hàng');
        }

        $data = $this->request->getJSON(true);

        $validation = Services::validation();

        $rules = [
            'name'  => 'required',
            'email' => 'required|valid_email',
            'phone' => 'required|regex_match[/^(0|\+84)[0-9]{9,10}$/]',
        ];

        if (!empty($data['password'])) {
            $rules['password'] = 'min_length[6]';
            $rules['confirm_password'] = 'matches[password]';
        }

        if (!$this->validate($rules)) {
            return $this->failValidationErrors($validation->getErrors());
        }

        if (!empty($data['password'])) {
            $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);
        } else {
            unset($data['password']);
        }

        unset($data['confirm_password']);

        $this->model->update($id, $data);

        return $this->respondUpdated(['id' => $id]);
    }


    public function delete($id = null)
    {
        $existing = $this->model->where('role', 'customer')->find($id);

        if (!$existing) {
            return $this->failNotFound('Không tìm thấy khách hàng');
        }

        $this->model->delete($id);

        return $this->respondDeleted(['id' => $id]);
    }
}
