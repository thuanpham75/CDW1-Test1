<?php
namespace App\Http\Controllers;
use App\Model\Login;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\MessageBag;
class LoginController extends Controller {

    use AuthenticatesUsers;

    public function index() {
        return view('/login');
    }

    protected function hasTooManyLoginAttempts(Request $request) {
        return $this->limiter()->tooManyAttempts(
                        $this->throttleKey($request), 3, 30 
        );
    }

    public function postLogin(Request $request) {
        $vali = Validator::make($request->all(), [
                    'email' => 'required|email',
                    'password' => 'required|min:6'
                    ],[
                    'email.required' => 'Email đăng nhập không hợp lệ!',
                    'email.email' => 'Email phải có .@gmail.com',
                    'password.required' => 'Password đăng nhập không hợp lệ!',
                    'password.min' => 'Password yêu cầu phải từ 6 ký tự trở lên!',
        ]);

        if ($vali->fails()) {
            return redirect()->back()->withErrors($vali)->withInput();
        } else {
            $email = $request->input('email');
            $password = $request->input('password');
            $dataUser = Login::where('email', $email)->first();

            if ($this->hasTooManyLoginAttempts($request)) {
                $this->fireLockoutEvent($request);
                return $this->sendLockoutResponse($request);
            } else {
                if (Auth::attempt(['email' => $email, 'password' => $password])) {
                    Session::put('name', $dataUser->name);
                    Session::put('email', $dataUser->email);
                    Session::put('login', TRUE);
                    $this->clearLoginAttempts($request);
                    return redirect()->intended('/index');
                } else {
                    $this->incrementLoginAttempts($request);
                    $count = $this->limiter()->attempts($this->throttleKey($request));
                    $left = 3 - $count;
                    $errors = new MessageBag(['errorlogin' => 'Email or Password không đúng, vui lòng nhập lại ! ' . $left . ' lần!']);
                    return redirect('/login')->withInput($request->except('password'))->withErrors($errors);
                }
            }
        }
    }

    public function logout() {
        Auth::logout();
        Session::put('login', FALSE);
        return redirect()->route('login');
    }

}
