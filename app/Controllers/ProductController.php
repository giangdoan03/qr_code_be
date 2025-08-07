<?php

namespace App\Controllers;

use App\Models\BusinessModel;
use App\Models\ProductModel;
use App\Models\ProductAttributeModel;
use App\Models\StoreModel;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;

use App\Traits\AuthTrait;

class ProductController extends ResourceController
{
    protected $format = 'json';

    use AuthTrait; // 👈 Dùng trait

    private function validateProduct($data): ResponseInterface|bool
    {
        $rules = [
            'name' => 'required|min_length[3]',
            'sku' => 'required',
            'price' => 'required|decimal',
        ];

        if (!$this->validate($rules)) {
            return $this->failValidationErrors($this->validator->getErrors());
        }

        return true;
    }

    public function index()
    {
        $userId = $this->getUserId();

        // Lấy thông tin người dùng
        $user = model('App\Models\UserModel')->find($userId);
        $isAdmin = $user && $user['role'] === 'admin';

        log_message('debug', 'SESSION USER_ID in index: ' . $userId);

        $productModel = new ProductModel();
        $perPage = $this->request->getGet('per_page') ?? 10;
        $page = $this->request->getGet('page') ?? 1;
        $search = $this->request->getGet('search');

        $builder = $productModel->where('deleted_at', null);

        // Nếu không phải admin thì chỉ xem sản phẩm của chính mình
        if (!$isAdmin) {
            $builder->where('user_id', $userId);
        }

        if ($search) {
            $builder->groupStart()
                ->like('name', $search)
                ->orLike('sku', $search)
                ->groupEnd();
        }

        $products = $builder->paginate($perPage, 'default', $page);

        foreach ($products as &$product) {
            // Decode JSON fields
            $jsonFields = ['avatar', 'images', 'video', 'certificate_file', 'display_settings'];
            foreach ($jsonFields as $field) {
                if (isset($product[$field]) && is_string($product[$field])) {
                    $decoded = json_decode($product[$field], true);
                    $product[$field] = is_array($decoded) ? $decoded : [];
                } elseif (!isset($product[$field])) {
                    $product[$field] = [];
                }
            }

            unset($product['image']);

            // Gán attributes
            $product['attributes'] = (new ProductAttributeModel())
                ->where('product_id', $product['id'])
                ->findAll();
        }

        return $this->respond([
            'data' => $products,
            'pager' => $productModel->pager->getDetails(),
        ]);
    }



    public function show($id = null)
    {
        $userId = $this->getUserId(); // Dùng được ngay
        $user = model('App\Models\UserModel')->find($userId);
        $isAdmin = $user && $user['role'] === 'admin';

        $productModel = new ProductModel();
        $product = $productModel->getProductWithAttributes($id);

        if (!$product) {
            return $this->failNotFound('Product not found');
        }

        // ❌ Nếu không phải admin thì mới kiểm tra quyền sở hữu
        if (!$isAdmin && $product['user_id'] != $userId) {
            return $this->failForbidden('Bạn không có quyền xem sản phẩm này');
        }

        // ✅ Decode các trường JSON nếu là chuỗi
        $jsonFields = ['avatar', 'images', 'video', 'certificate_file', 'attributes', 'display_settings'];
        foreach ($jsonFields as $field) {
            if (!empty($product[$field]) && is_string($product[$field])) {
                $decoded = json_decode($product[$field], true);
                $product[$field] = is_array($decoded) ? $decoded : [];
            } else {
                $product[$field] = [];
            }
        }

        // ✅ Tự động gán danh sách nếu giá trị là "all"
        $settings = &$product['display_settings'];

        // Tạo các model liên quan
        $businessModel = new BusinessModel();
        $storeModel = new StoreModel();

        if (isset($settings['company']) && $settings['company'] === 'all') {
            $companies = $businessModel->select('id')->where('user_id', $userId)->findAll();
            $settings['selectedCompanies'] = array_column($companies, 'id');
        }

        if (isset($settings['store']) && $settings['store'] === 'all') {
            $stores = $storeModel->select('id')->where('user_id', $userId)->findAll();
            $settings['selectedStores'] = array_column($stores, 'id');
        }

        if (isset($settings['relatedProducts']) && $settings['relatedProducts'] === 'all') {
            $products = $productModel->select('id')->where('user_id', $userId)->findAll();
            $settings['selectedProducts'] = array_column($products, 'id');
        }

        return $this->respond($product);
    }


    /**
     * @throws \ReflectionException
     */
    public function create()
    {
        $userId = $this->getUserId();

        $productModel = new ProductModel();
        $attributeModel = new ProductAttributeModel();

        $data = $this->request->getJSON(true);

        // Validate
        $validationResult = $this->validateProduct($data);
        if ($validationResult !== true) {
            return $validationResult;
        }

        // Chuẩn bị data sản phẩm
        $productData = [
            'sku' => $data['sku'] ?? null,
            'name' => $data['name'] ?? null,
            'category_id' => $data['category_id'] ?? null,
            'price' => $data['price'] ?? null,
            'price_from' => $data['price_from'] ?? null,
            'price_to' => $data['price_to'] ?? null,
            'show_contact_price' => !empty($data['show_contact_price']) ? 1 : 0,
            'description' => $data['description'] ?? null,
            'status' => !empty($data['status']) ? 1 : 0,
            'contact_phone' => $data['contact_phone'] ?? null,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
            'display_settings' => json_encode($data['display_settings'] ?? []),
            'user_id' => $userId, // 👈 Gán user_id vào sản phẩm
        ];


        $arrayFields = ['avatar', 'images', 'video', 'certificate_file', 'attributes'];
        foreach ($arrayFields as $field) {
            if (isset($data[$field])) {
                $value = $data[$field];
                // Nếu đã là chuỗi JSON rồi thì dùng luôn, không encode lại
                $productData[$field] = is_string($value) ? $value : json_encode($value);
            } else {
                $productData[$field] = json_encode([]); // fallback nếu không có
            }
        }


        // Insert sản phẩm
        $productId = $productModel->insert($productData);

        // Insert attributes nếu có
        if (!empty($data['attributes']) && is_array($data['attributes'])) {
            foreach ($data['attributes'] as $attribute) {
                if (!empty($attribute['name']) && !empty($attribute['value'])) {
                    $attributeModel->insert([
                        'product_id' => $productId,
                        'name' => $attribute['name'],
                        'value' => $attribute['value'],
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    ]);
                }
            }
        }

        $product = $productModel->find($productId);
        return $this->respondCreated([
            'status' => 'success',
            'message' => 'Tạo sản phẩm thành công',
            'data' => $product
        ]);
    }


    /**
     * @throws \ReflectionException
     */
    public function update($id = null)
    {
        $session = session();
        $userId = $session->get('user_id');

        $productModel = new ProductModel();
        $attributeModel = new ProductAttributeModel();

        // Lấy thông tin user để kiểm tra role
        $user = model('App\Models\UserModel')->find($userId);
        $isAdmin = $user && $user['role'] === 'admin';

        $data = $this->request->getJSON(true);

        // Kiểm tra quyền sở hữu sản phẩm
        $product = $productModel->find($id);
        if (!$product) {
            return $this->failNotFound('Sản phẩm không tồn tại');
        }
        // Nếu không phải admin thì kiểm tra quyền sở hữu
        if (!$isAdmin && $product['user_id'] != $userId) {
            return $this->failForbidden('Bạn không có quyền sửa sản phẩm này');
        }


        // ✅ Trường hợp chỉ cập nhật ảnh (images) => bỏ qua validate
        if (isset($data['images']) && count($data) === 1) {
            $productModel->update($id, [
                'images' => is_array($data['images']) ? json_encode($data['images']) : $data['images'],
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            return $this->respond(['message' => 'Cập nhật ảnh sản phẩm thành công']);
        }

        // ✅ Trường hợp cập nhật đầy đủ => cần validate
        $validationResult = $this->validateProduct($data);
        if ($validationResult !== true) {
            return $validationResult;
        }

        // ✅ Chuẩn bị dữ liệu cập nhật
        $productData = [
            'sku' => $data['sku'] ?? null,
            'name' => $data['name'] ?? null,
            'category_id' => $data['category_id'] ?? null,
            'price_mode' => $data['price_mode'] ?? 'single',
            'price' => $data['price'] ?? null,
            'price_from' => $data['price_from'] ?? null,
            'price_to' => $data['price_to'] ?? null,
            'show_contact_price' => !empty($data['show_contact_price']) ? 1 : 0,
            'contact_phone' => $data['contact_phone'] ?? null,
            'description' => $data['description'] ?? null,
            'status' => !empty($data['status']) ? 1 : 0,
            'updated_at' => date('Y-m-d H:i:s'),
        ];

        // ✅ Các field dạng JSON
        $jsonFields = ['avatar', 'images', 'video', 'certificate_file', 'attributes', 'display_settings'];
        foreach ($jsonFields as $field) {
            if (isset($data[$field])) {
                $value = $data[$field];
                $productData[$field] = is_string($value) ? $value : json_encode($value);
            } else {
                $productData[$field] = json_encode([]);
            }
        }

        // ✅ display_settings nếu có
        if (!empty($data['display_settings'])) {
            $productData['display_settings'] = is_string($data['display_settings'])
                ? $data['display_settings']
                : json_encode($data['display_settings']);
        }

        // ✅ Cập nhật sản phẩm
        $productModel->update($id, $productData);

        // ✅ Cập nhật thuộc tính
        if (!empty($data['attributes']) && is_array($data['attributes'])) {
            $attributeModel->where('product_id', $id)->delete();
            foreach ($data['attributes'] as $attribute) {
                if (!empty($attribute['name']) && !empty($attribute['value'])) {
                    $attributeModel->insert([
                        'product_id' => $id,
                        'name' => $attribute['name'],
                        'value' => $attribute['value'],
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    ]);
                }
            }
        }

        return $this->respond(['message' => 'Cập nhật sản phẩm thành công']);
    }


    /**
     * @throws \ReflectionException
     */
    public function toggleStatus($id = null): ResponseInterface
    {
        $session = session();
        $userId = $session->get('user_id'); // 👈 Lấy user_id từ session

        $productModel = new ProductModel();
        $data = $this->request->getJSON(true);

        // Kiểm tra status hợp lệ
        if (!isset($data['status'])) {
            return $this->failValidationErrors('Thiếu trạng thái');
        }

        // Kiểm tra sản phẩm có tồn tại và thuộc user này không
        $product = $productModel->find($id);
        if (!$product) {
            return $this->failNotFound('Sản phẩm không tồn tại');
        }
        if ($product['user_id'] != $userId) {
            return $this->failForbidden('Bạn không có quyền thay đổi trạng thái sản phẩm này');
        }

        // Cập nhật trạng thái
        $productModel->update($id, [
            'status' => $data['status'] ? 1 : 0,
            'updated_at' => date('Y-m-d H:i:s')
        ]);

        return $this->respond(['message' => 'Cập nhật trạng thái thành công']);
    }


    public function delete($id = null)
    {
        $productModel = new ProductModel();
        $attributeModel = new ProductAttributeModel();

        // Delete attributes cứng
        $attributeModel->where('product_id', $id)->delete();

        // Soft delete product
        $productModel->delete($id);

        return $this->respondDeleted(['message' => 'Product soft deleted successfully']);
    }

    public function export(): ResponseInterface
    {
        $productModel = new ProductModel();
        $products = $productModel->where('deleted_at', null)->findAll();

        foreach ($products as &$product) {
            $product['attributes'] = (new ProductAttributeModel())
                ->where('product_id', $product['id'])
                ->findAll();
        }

        $filename = 'products_export_' . date('YmdHis') . '.json';
        $data = json_encode($products, JSON_PRETTY_PRINT);

        return $this->response
            ->setHeader('Content-Type', 'application/json')
            ->setHeader('Content-Disposition', 'attachment; filename="' . $filename . '"')
            ->setBody($data);
    }

    public function import(): ResponseInterface
    {
        $userId = session()->get('user_id');
        if (!$userId) {
            return $this->failUnauthorized('Bạn chưa đăng nhập hoặc phiên làm việc đã hết hạn.');
        }

        $file = $this->request->getFile('file');
        if (!$file || !$file->isValid()) {
            return $this->fail('File không hợp lệ.');
        }

        try {
            $spreadsheet = IOFactory::load($file->getTempName());
            $sheet = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);

            // Bỏ dòng tiêu đề
            array_shift($sheet);

            $productModel = new ProductModel();

            foreach ($sheet as $row) {
                $productData = [
                    'sku' => trim($row['A']),
                    'name' => trim($row['B']),
                    'price_mode' => $row['C'] ?? 'single',
                    'price' => $row['D'] ?? 0,
                    'price_from' => $row['E'] ?? null,
                    'price_to' => $row['F'] ?? null,
                    'category_id' => $row['G'] ?? null,
                    'description' => $row['H'] ?? '',
                    'show_contact_price' => $row['I'] === '1' ? 1 : 0,
                    'status' => $row['J'] === '1' ? 1 : 0,
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                    'user_id' => $userId,
                    'images' => $this->safeJson($row['L'] ?? ''),
                    'attributes' => $this->safeJson($row['K'] ?? ''),
                    'contact_phone' => $row['M'] ?? 0,
                ];

                $productModel->insert($productData);
            }

            return $this->respond(['message' => 'Import thành công']);
        } catch (\Throwable $e) {
            return $this->fail('Lỗi khi đọc file Excel: ' . $e->getMessage());
        }
    }

// 👇 Hàm phụ trợ dùng trong import
    private function safeJson($cell): bool|string
    {
        $raw = trim((string) $cell, "\"");
        $json = json_decode($raw, true);
        return is_array($json) ? json_encode($json) : json_encode([]);
    }


    public function exportExcel()
    {
        $productModel = new ProductModel();
        $products = $productModel->where('deleted_at', null)->findAll();

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Headers
        $sheet->setCellValue('A1', 'ID');
        $sheet->setCellValue('B1', 'Name');
        $sheet->setCellValue('C1', 'SKU');
        $sheet->setCellValue('D1', 'Price');
        $sheet->setCellValue('E1', 'Attributes');

        $row = 2;
        foreach ($products as $product) {
            $attributes = (new ProductAttributeModel())
                ->where('product_id', $product['id'])
                ->findAll();

            $attributeText = '';
            foreach ($attributes as $attribute) {
                $attributeText .= "{$attribute['name']}: {$attribute['value']}; ";
            }

            $sheet->setCellValue("A{$row}", $product['id']);
            $sheet->setCellValue("B{$row}", $product['name']);
            $sheet->setCellValue("C{$row}", $product['sku']);
            $sheet->setCellValue("D{$row}", $product['price']);
            $sheet->setCellValue("E{$row}", $attributeText);

            $row++;
        }

        $writer = new Xlsx($spreadsheet);
        $filename = 'products_export_' . date('YmdHis') . '.xlsx';

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"{$filename}\"");
        $writer->save('php://output');
        exit;
    }

    public function restore($id = null): ResponseInterface
    {
        $productModel = new ProductModel();
        $product = $productModel->onlyDeleted()->find($id);

        if (!$product) {
            return $this->failNotFound('Product not found or not deleted.');
        }

        $productModel->update($id, ['deleted_at' => null]);

        return $this->respond(['message' => 'Product restored successfully']);
    }

    public function exportSelected(): ResponseInterface
    {
        $ids = $this->request->getJSON(true)['ids'] ?? [];

        if (empty($ids)) {
            return $this->failValidationErrors('No product IDs provided.');
        }

        $productModel = new ProductModel();
        $products = $productModel->whereIn('id', $ids)->findAll();

        foreach ($products as &$product) {
            $product['attributes'] = (new ProductAttributeModel())
                ->where('product_id', $product['id'])
                ->findAll();
        }

        $filename = 'selected_products_export_' . date('YmdHis') . '.json';
        $data = json_encode($products, JSON_PRETTY_PRINT);

        return $this->response
            ->setHeader('Content-Type', 'application/json')
            ->setHeader('Content-Disposition', 'attachment; filename="' . $filename . '"')
            ->setBody($data);
    }


}
