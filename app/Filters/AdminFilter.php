<?php
namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class AdminFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $session = session();
        $userId  = $session->get('user_id');
        $role    = strtolower((string) $session->get('role'));
        $logged  = (bool) $session->get('logged_in');

        if (!$userId || !$logged) {
            return service('response')->setStatusCode(401)->setJSON([
                'status'  => 401,
                'error'   => 'Unauthorized',
                'message' => 'Bạn chưa đăng nhập.',
            ]);
        }

        if ($role !== 'admin') {
            return service('response')->setStatusCode(403)->setJSON([
                'status'  => 403,
                'error'   => 'Forbidden',
                'message' => 'Chỉ admin mới có quyền thực hiện thao tác này.',
            ]);
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
    }
}
