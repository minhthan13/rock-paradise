<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function index(Request $request){
        $validated  = $request->validate([
            'user' => 'required|string|min:4|max:255',
            'password' => 'required|string|min:4'
        ]);
       
        $checkUser = DB::table('user')
                    ->where('user_name','=',$validated['user'])
                    ->where('password','=',$validated['password'])
                    ->first();
                    if(!empty($checkUser)){
                        $succ = 'đăng nhập thành công';
                        return view('admin.dashboard',['mess'=>$succ,'user'=>$checkUser]);
                    } else {
                        return redirect()->back()->with('error', 'Thông tin tài khoản hoặc mật khẩu không chính xác.');
                    }
}}