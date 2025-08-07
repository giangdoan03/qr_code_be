<?php

namespace App\Controllers;

use App\Models\UserModel;
use CodeIgniter\Controller;
use CodeIgniter\HTTP\ResponseInterface;

class Auth extends Controller
{
    public function login(): ResponseInterface
    {
        $session = session();
        $request = service('request');
    
        $data = $request->getJSON();
        $email = $data->email ?? '';
        $password = $data->password ?? '';
    
        log_message('debug', 'Email received: ' . $email);
        log_message('debug', 'Password received: ' . $password);
    
        $userModel = new UserModel();
        $user = $userModel->where('email', $email)->first();
    
        log_message('debug', 'User from DB: ' . print_r($user, true));

        if ($user && password_verify($password, $user['password'])) {
            $session->regenerate();
            $session->set([
                'user_id'    => $user['id'],
                'user_email' => $user['email'],
                'role'       => $user['role'], // 👉 nên thêm dòng này
                'logged_in'  => true,
            ]);

            return $this->response->setJSON([
                'status' => 'success',
                'message' => 'Login successful',
                'user' => [
                    'id'       => $user['id'],
                    'email'    => $user['email'],
                    'name'     => $user['name'] ?? '',
                    'role'     => $user['role'] ?? '',
                    'role_id'  => $user['role_id'] ?? null,
                    'avatar'   => $user['avatar'] ?? null,
                ]
            ]);
        }



        return $this->response->setJSON(['status' => 'error', 'message' => 'Invalid credentials']);
    }


    public function check(): ResponseInterface
    {
        $session = session();

        if ($session->get('logged_in')) {
            $userModel = new UserModel();
            $user = $userModel->find($session->get('user_id'));

            if ($user) {
                // Loại bỏ trường password nếu tồn tại
                unset($user['password']);

                return $this->response->setJSON([
                    'status' => 'success',
                    'user'   => $user,
                ]);
            }

            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'User not found'
            ]);
        }

        return $this->response->setJSON([
            'status' => 'error',
            'message' => 'Not logged in'
        ]);
    }


    public function logout(): ResponseInterface
    {
        $session = session();
        $session->destroy(); // ✅ phải có dòng này
        return $this->response->setJSON(['status' => 'success', 'message' => 'Logged out']);
    }
}
