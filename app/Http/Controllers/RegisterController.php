<?php
namespace App\Http\Controllers;
use App\Model\Register;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
class RegisterController extends Controller{

    public function index(){
        return view('/register');
    }
    
    public function postRegister(Request $request) {
        $vali = Validator::make($request->all(), [
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            'name' => 'required',
            'phone' => 'required',
        ], [
            'email.required'=>'Email đăng nhập không hợp lệ!',
            'password.required'=>'Password yêu cầu phải từ 6 ký tự trở lên!',
            'name.required'=>'Tên đăng nhập không hợp lệ!',
            'phone.required'=>'Số điện thoại không hợp lệ!',
        ]);
        if ($vali->fails()) {
            return redirect()->route('register')->withErrors($vali);
        } else {
            DB::table('users')->insert([
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'name' => $request->name,
                'phone' => $request->phone,
            ]);
            return redirect()->route('login')->with('success', 'Đăng ký tài khoản thành công!');
        }
    }
    
}
