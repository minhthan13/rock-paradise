<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
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
    public function listUser()
    {
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
    public function delete($id)
    {
        $mess = $this->deleteProduct($id);
        
        if ($mess === 'Đã xóa thành công') {
            Session::flash('messDeleted', 'Đã xóa thành công');
        } else {
            Session::flash('messDeleted', 'Không thể xóa sản phẩm này');
        }
   
    return redirect()->back();
    }

    public function insertPro(Request $request)
    {
        $valid = $request->validate([
            'proID' => 'required|string|min:4|max:25',
            'title' => 'required|string|min:1|max:255',
            'price' => ['required', 'integer', 'min:1', 'max:10000'],
            'cateid' => 'required',
            'style' => 'required',
            'type' => 'required',
            'color' => 'required',
            'images.*' => 'image|mimes:jpg|max:2048'
        ]);
        $proName = strtoupper($request->post('proID'));
        $title    = $request->post('title');
        $price    = $request->post('price');
        $cateid     = $request->post('cateid');
        $description = html_entity_decode(strip_tags($request->input('des')));
        $style = $request->post('style');
        $type = $request->post('type');
        $color = $request->post('color');
        $size = implode(', ', $request->input('size', []));
        
        $inserProduct = DB::table('product')
        ->insertGetId([
            'category_id' => $cateid,
            'name' => $proName,
            'title' => $title,
            'price' => $price,
            'description' => $description,
            'style' => $style,
            'type' => $type,
            'size' => $size,
            'color' => $color,
            
        ]);
        
            // sử lý file được gửi lên 
        if ($request->hasFile('images')) {
            // khởi tạo folder
            $createFolder = public_path("images/product/{$proName}");
                if (!File::exists($createFolder)) {
                File::makeDirectory($createFolder);
            }
        $imageFiles = $request->file('images');
            foreach ($imageFiles as $index => $imageFile) {
                $extension = $imageFile->getClientOriginalExtension();
                // tạo tên
                $fileName = "{$inserProduct}.{$extension}";
                //di chuyển với thu mục được tạo ở trên
                $imageFile->move($createFolder, $fileName);
                $setDefalt = ($index ==0) ? 1 :0;
                DB::table('image')->insert(['product_id' => $inserProduct,'default_image' => $setDefalt]);
                // sửa lại tên file với name là image_id mới
                $newFileName = DB::getPDO()->lastInsertId().".jpg";
                File::move("{$createFolder}/{$fileName}", "{$createFolder}/{$newFileName}");
            }
        }else{
            DB::table('image')->insert(['product_id' => $inserProduct,'default_image' => 1]);
        }

        // điều hướng về cuối trang sau khi insert
        $products = DB::table('product')->paginate(25);
        $page = $products->lastPage();
        return redirect()->route('admin.dashboard', ['page' => $page]);
    }
}