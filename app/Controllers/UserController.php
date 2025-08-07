<?php

namespace App\Controllers;

use App\Models\UserModel;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;

class UserController extends ResourceController
{
    protected $modelName = UserModel::class;
    protected $format = 'json';

    public function index()
    {
        $perPage = $this->request->getGet('per_page') ?? 10;
        $page = $this->request->getGet('page') ?? 1;
        $search = $this->request->getGet('search');

        $builder = new UserModel();
        $builder->where('role', 'admin'); // ✅ chỉ lấy admin

        if ($search) {
            $builder->groupStart()
                ->like('name', $search)
                ->orLike('phone', $search)
                ->orLike('email', $search)
                ->groupEnd();
        }

        $data = $builder->paginate($perPage, 'default', $page);
        $pager = $builder->pager;

        return $this->respond([
            'data' => $data,
            'pager' => [
                'total' => $pager->getTotal(),
                'per_page' => $perPage,
                'current_page' => $page,
            ]
        ]);
    }

    public function show($id = null)
    {
        $user = $this->model->find($id); // ❌ bỏ lọc role
        return $user
            ? $this->respond($user)
            : $this->failNotFound('Không tìm thấy tài khoản');
    }


    public function me(): ResponseInterface
    {
        $session = session();
        $userId = $session->get('user_id');

        if (!$userId) {
            return $this->failUnauthorized('Chưa đăng nhập');
        }

        $user = $this->model->find($userId);

        if (!$user) {
            return $this->failNotFound('Không tìm thấy người dùng');
        }

        // ✅ Xoá trường password trước khi trả về
        unset($user['password']);

        return $this->respond($user);
    }



    public function create()
    {
        $data = $this->getF();

        // Băm mật khẩu
        if (!empty($data['password'])) {
            $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);
        }

        $data['role'] = 'admin'; // Luôn gán role admin

        // Tính thời hạn gói nếu có truyền số năm
        $data = $this->applyPackageDuration($data); // Không cần lưu

        $this->model->insert($data);
        $data['id'] = $this->model->getInsertID();
        return $this->respondCreated($data);
    }

    public function update($id = null)
    {
        $existing = $this->model->find($id); // ❌ bỏ lọc role
        if (!$existing) {
            return $this->failNotFound('Không tìm thấy tài khoản');
        }

        $data = $this->getF();

        // Băm mật khẩu nếu có
        if (!empty($data['password'])) {
            $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);
        } else {
            unset($data['password']);
        }

        // Tính thời hạn gói nếu có thay đổi (nếu bạn dùng logic đó)
        $data = $this->applyPackageDuration($data);

        $this->model->update($id, $data);
        return $this->respond(['id' => $id, 'message' => 'Đã cập nhật']);
    }


    public function delete($id = null)
    {
        $existing = $this->model->where('role', 'admin')->find($id); // ✅ kiểm tra role admin
        if (!$existing) {
            return $this->failNotFound('Không tìm thấy tài khoản admin');
        }

        $this->model->delete($id);
        return $this->respondDeleted(['id' => $id, 'message' => 'Đã xoá']);
    }

    public function changePassword(): ResponseInterface
    {
        $request = $this->request->getJSON(true);
        $userId = session('user_id');

        if (!$userId) {
            return $this->failUnauthorized('Không xác thực');
        }

        $user = $this->model->find($userId);
        if (!$user || $user['role'] !== 'admin') { // ✅ chỉ cho phép admin đổi mật khẩu
            return $this->failForbidden('Không có quyền đổi mật khẩu');
        }

        $currentPassword = $request['current_password'] ?? '';
        $newPassword     = $request['new_password'] ?? '';

        if (!$newPassword) {
            return $this->failValidationErrors('Mật khẩu mới không được để trống');
        }

        if (!password_verify($currentPassword, $user['password'])) {
            return $this->failValidationErrors('Mật khẩu hiện tại không đúng');
        }

        $this->model->update($userId, [
            'password' => password_hash($newPassword, PASSWORD_BCRYPT),
        ]);

        return $this->respond(['message' => 'Đã đổi mật khẩu thành công']);
    }

    /**
     * @return array|bool|float|int|object|string
     */
    public function getF(): string|array|bool|int|object|float
    {
        $data = $this->request->getPost();

        // Xử lý avatar
        $file = $this->request->getFile('avatar');
        if ($file && $file->isValid()) {
            $newName = $file->getRandomName();
            $file->move(WRITEPATH . 'uploads', $newName);
            $data['avatar'] = base_url('uploads/' . $newName);
        }
        return $data;
    }

    /**
     * @param array $data
     * @return array
     */
    public function applyPackageDuration(array $data): array
    {
        if (!empty($data['duration_years']) && is_numeric($data['duration_years'])) {
            $years = (int) $data['duration_years'];
            $today = date('Y-m-d');
            $data['package_start_date'] = $today;
            $data['package_end_date'] = date('Y-m-d', strtotime("+{$years} year", strtotime($today)));
        }

        unset($data['duration_years']);
        return $data;
    }

}
