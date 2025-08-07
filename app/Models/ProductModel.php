<?php

namespace App\Models;

use CodeIgniter\Model;

class ProductModel extends Model
{
    protected $table = 'products';
    protected $primaryKey = 'id';

    protected $useSoftDeletes = true;
    protected $deletedField = 'deleted_at';
    protected $allowedFields = [
        'user_id', 'sku', 'name', 'category_id', 'price', 'price_from', 'price_to','price_mode',
        'show_contact_price','contact_phone', 'avatar', 'images', 'video', 'certificate_file',
        'description', 'attributes', 'status', 'created_at', 'updated_at', 'display_settings','product_links'
    ];

    protected $useTimestamps = true;

    public function getProductWithAttributes($id = null): ?array
    {
        $builder = $this->db->table($this->table);
        $builder->select('*')->where('id', $id);
        return $builder->get()->getRowArray(); // Không gọi đến bảng phụ nữa
    }


}
