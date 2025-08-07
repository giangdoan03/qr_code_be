<?php

namespace App\Controllers;

use App\Models\PurchaseHistoryModel;
use App\Models\UserModel;
use CodeIgniter\RESTful\ResourceController;
use App\Traits\AuthTrait;

class PurchaseHistoryController extends ResourceController
{
    use AuthTrait;

    protected $modelName = PurchaseHistoryModel::class;
    protected $format = 'json';

    public function index()
    {
        $currentUser = $this->getUser();
        $perPage = $this->request->getGet('per_page') ?? 10;
        $page = $this->request->getGet('page') ?? 1;
        $search = $this->request->getGet('search');
        $userId = $this->request->getGet('customer_id');

        $builder = $this->model
            ->select('purchase_histories.*, users.name as user_name, users.email as user_email, users.phone as user_phone, users.avatar as user_avatar')
            ->join('users', 'users.id = purchase_histories.customer_id', 'left');

        if ($currentUser['role'] === 'admin' && !empty($userId)) {
            $builder->where('purchase_histories.customer_id', $userId);
        } elseif ($currentUser['role'] !== 'admin') {
            $builder->where('purchase_histories.customer_id', $currentUser['id']);
        }

        if ($search) {
            $builder->groupStart()
                ->like('product_name', $search)
                ->orLike('note', $search)
                ->groupEnd();
        }

        $data = $builder->orderBy('starts_at', 'DESC')->paginate($perPage, 'default', $page);
        $pager = $this->model->pager;

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
        $currentUser = $this->getUser();

        $builder = $this->model
            ->select('purchase_histories.*, users.name as user_name, users.email as user_email, users.phone as user_phone, users.avatar as user_avatar')
            ->join('users', 'users.id = purchase_histories.customer_id', 'left')
            ->where('purchase_histories.id', $id);

        if ($currentUser['role'] !== 'admin') {
            $builder->where('purchase_histories.customer_id', $currentUser['id']);
        }

        $data = $builder->first();

        return $data
            ? $this->respond($data)
            : $this->failNotFound('Không tìm thấy lịch sử mua hàng');
    }

    public function create()
    {
        $data = $this->request->getJSON(true);
        $currentUser = $this->getUser();

        if ($currentUser['role'] === 'admin') {
            if (empty($data['customer_id'])) {
                return $this->failValidationErrors('Vui lòng chọn khách hàng cần đăng ký gói.');
            }

            $customer = model('App\Models\UserModel')->find($data['customer_id']);
            if (!$customer) {
                return $this->failNotFound('Khách hàng không tồn tại.');
            }
        } else {
            $data['customer_id'] = $currentUser['id'];
        }

        if (!empty($data['is_active']) && $data['is_active']) {
            $existing = $this->model
                ->where('customer_id', $data['customer_id'])
                ->where('is_active', 1)
                ->where('expires_at >', date('Y-m-d H:i:s'))
                ->first();

            if ($existing) {
                if ($currentUser['role'] === 'admin') {
                    $this->model->update($existing['id'], ['is_active' => 0]);
                } else {
                    return $this->fail('Bạn hiện đang có gói còn hiệu lực.');
                }
            }

            $now = date('Y-m-d H:i:s');
            $years = (int) ($data['quantity'] ?? 1);
            $data['starts_at'] = $now;
            $data['expires_at'] = date('Y-m-d H:i:s', strtotime("+{$years} year"));
        }

        if (empty($data['purchased_at'])) {
            $data['purchased_at'] = date('Y-m-d H:i:s');
        }

        $this->model->insert($data);
        $data['id'] = $this->model->getInsertID();

        return $this->respondCreated($data);
    }

    public function update($id = null)
    {
        $data = $this->request->getJSON(true);
        $currentUser = $this->getUser();

        if ($currentUser['role'] === 'admin') {
            $existing = $this->model->find($id);
        } else {
            $existing = $this->model
                ->where('id', $id)
                ->where('customer_id', $currentUser['id'])
                ->first();
        }

        if (!$existing) {
            return $this->failNotFound('Không tìm thấy lịch sử mua hàng phù hợp.');
        }

        if (!empty($data['extend_years'])) {
            $years = (int) $data['extend_years'];

            // Nếu gói đã hết hạn thì bắt đầu từ hôm nay, ngược lại thì cộng dồn
            $baseTime = strtotime($existing['expires_at']) > time()
                ? strtotime($existing['expires_at']) // còn hạn thì cộng dồn
                : time(); // hết hạn thì tính từ bây giờ

            $data['expires_at'] = date('Y-m-d H:i:s', strtotime("+{$years} year", $baseTime));
            // ✅ Cộng dồn hoặc trừ vào số lượng năm
            $data['quantity'] = ($existing['quantity'] ?? 0) + $years;
            unset($data['extend_years']);
        }

        $data['updated_at'] = date('Y-m-d H:i:s');
        $data['updated_by'] = $currentUser['id'];

        $this->model->update($id, $data);

        return $this->respond([
            'id' => $id,
            'message' => 'Đã cập nhật thành công'
        ]);
    }

    public function delete($id = null)
    {
        $currentUser = $this->getUser();

        if ($currentUser['role'] === 'admin') {
            $existing = $this->model->find($id);
        } else {
            $existing = $this->model
                ->where('id', $id)
                ->where('customer_id', $currentUser['id'])
                ->first();
        }

        if (!$existing) {
            return $this->failNotFound('Không tìm thấy lịch sử mua hàng');
        }

        $this->model->delete($id);

        return $this->respondDeleted(['id' => $id, 'message' => 'Đã xoá']);
    }

    protected function getUser(): array|object|null
    {
        $userId = $this->getUserId();
        $model = new UserModel();
        return $model->find($userId);
    }
}
