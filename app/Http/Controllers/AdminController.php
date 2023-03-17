<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BaseAdminController extends Controller
{
    protected function getProductQuery() {
        return DB::table('product')
            ->select('*',
                DB::raw('ROUND(total_vote / vote_quantity, 1) as rating'))
                ->where('image.default_image', '=', '1')
            ->join('image', 'product.product_id', '=', 'image.product_id');
    }
}
class AdminController extends BaseAdminController
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
            session()->put('success_message', 'đăng nhập thành công');
            $query = $this->getProductQuery()
           ->paginate(25);
            return view('admin.dashboard',['user'=>$checkUser,'products'=>$query]);
        } else {
            return redirect()->back()->with('error', 'Thông tin tài khoản hoặc mật khẩu không chính xác.');
        }
    }
    public function dashboard(){
        $query = $this->getProductQuery()
        ->paginate(25);
         return view('admin.dashboard',['products'=>$query]);
    }
}