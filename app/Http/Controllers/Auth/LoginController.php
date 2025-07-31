<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use Illuminate\Contracts\View\View;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    public function __construct()
    {
        // koonly code
        if ($this->isLoggedInKoonly()) {
            Auth::loginUsingId(1);
            $this->redirectTo();
        } // koonly code end
        $this->middleware('guest')->except('logout');
    }

    public function showLoginForm(): View
    {
        return view('auth.login');
    }

    protected function redirectTo(): string
    {
        return route('sendportal.dashboard');
    }

    public function isLoggedInKoonly(): bool
    {
        $cid = $_GET['cid']??'';
        $token = $_GET['token']??'';
        if (empty($token)) return false;
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, 'https://www.cloudkoonly.com/api/validateToken');
        curl_setopt($curl, CURLOPT_POST, true);
        $postData = ['cid'=>$cid, 'token' => $token];
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($postData));
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($curl);
        curl_close($curl);
        if ($response === false) {
            echo 'cURL error: ' . curl_error($curl);
        } else {
            $result = json_decode($response, true);
            if (isset($result['statusCode']) && $result['statusCode']===200 && isset($result['data']['status']) && $result['data']['status']==='ok') {
                return true;
            }
        }
        return false;
    }
}
