<?php
namespace App\Http\Controllers;
use App\Model\Login;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
class UpdateUserController extends Controller {

    public function index() {
        return view('/update');
    }

    public function getInfor() {
        $inforUser = DB::table('users')->where([
            ['email', Session::get('email')],
        ])->get();
        return view('/update', compact('inforUser'));
    }

    public function postUpdate(Request $request) {
        $vali = Validator::make($request->all(), [
            'name' => 'required|string',
            'password' => '',
            'phone' => 'integer',
        ], [
        ]);

        if ($vali->fails()) {
            return redirect()->route('update')->withErrors($vali);
        } else {
            $email = Session::get('email');
            $users = Login::where('email', $email)->first();
            if ($request->password == null) {
                $pass = $users->password;
            } else {
                $pass = $request->password;
            }
            DB::table('users')
            ->where('email', $email)
            ->update([
                'name' => $request->name,
                'password' => bcrypt($pass),
                'phone' => $request->phone,
            ]);
            return redirect()->route('update')->with('success', 'Cập nhật thông tin thành công!');
        }
    }

}
