<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;


class BaseAdminController extends Controller
{
    protected function getProductQuery() {
        return DB::table('product')
            ->select(
                'product.product_id',
                'product.name as proname',
                'category.name',
                'product.title',
                'image.image_id',
                'product.price',
                'product.description',
                'product.color',
                'product.size',
                'product.created_time',
                DB::raw('ROUND(total_vote / vote_quantity, 1) as rating'))
                ->join('category','product.category_id','=','category.category_id')
                ->join('image', 'product.product_id', '=', 'image.product_id')
                ->where('image.default_image', '=', '1');
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
            session()->put('user', $checkUser);
            $displayMessage = true;
            $query = $this->getProductQuery()->paginate(25);
            return view('admin.dashboard',['products'=>$query,'displayMessage' => $displayMessage]);
        } else {
            return redirect()->back()->with('error', 'Thông tin tài khoản hoặc mật khẩu không chính xác.');
        }
    }
    public function dashboard(){
        $query = $this->getProductQuery()->paginate(25);
        $displayMessage = false;
         return view('admin.dashboard',['products'=>$query,'displayMessage' => $displayMessage]);
    }
    public function cateadmin(){
        $categories = DB::table('category')->get();
    foreach ($categories as $category) {
        $category->product_count = DB::table('product')
                                      ->where('category_id', $category->category_id)
                                      ->count();
        $category->cate_image= DB::table('product')
                                        ->select('product.name as proname','image.image_id')
                                        ->join('image', 'product.product_id', '=', 'image.product_id')
                                        ->where('image.default_image', '=', '1')
                                        ->where('category_id', $category->category_id) 
                                        ->inRandomOrder()->first(); 
    }
        return view('admin.category',['cate'=>$categories]);
    }
    public function imgadmin(){
        $img = [];
        $products = DB::table('product')->select('product_id', 'name')->paginate(12);
        foreach ($products as $product) {
            //  lấy id của hình ảnh
            $productImages = DB::table('image')
            ->select('image_id')->where('product_id', '=', $product->product_id)->get();
            if (!isset($img[$product->name])) {
                $img[$product->name] = [
                    'name' => $product->name,
                    'images' => []
                ];
            }
            // Thêm toàn bộ image id vào data mới
            foreach ($productImages as $image) {
                array_push($img[$product->name]['images'], $image->image_id);
            }
        }
        return view('admin.imgAdmin',['imgs'=>$img,'products'=>$products]);
    }
    public function listUser(){
        $user = DB::table('user')->get();
        return view('admin.listUser',['user'=>$user]);
    }


    // delete 
    public function deleteProduct($id)
{
    // Kiểm tra xem hàng product có id=$id có tồn tại hay không
    $product = DB::table('product')->where('product_id', '=', $id)->first();
    if (!$product) {
        return 'Hàng không tồn tại';
    }
    // Xóa các hàng image liên quan đến product
    DB::table('image')->where('product_id', '=', $id)->delete();
    // Xóa hàng product
    DB::table('product')->where('product_id', '=', $id)->delete();
    return 'Đã xóa thành công';
}
public function delete($id){
    $mess= $this->deleteProduct($id);
    Session::flash('messDeleted', 'Đã xóa thành công');
   
    return redirect()->back()->with('messDeleted', Session::get('messDeleted'));
}


}