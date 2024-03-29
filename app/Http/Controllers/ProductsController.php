<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Validation\ValidatesRequests;

class BaseController extends Controller
{
    
    
    protected function getProductQuery() {
        return DB::table('product')
            ->select('product.product_id', 'product.name', 'product.is_top', 'product.price', 'product.title', 'image.image_id', 'image.default_image','product.description',
                DB::raw('ROUND(total_vote / vote_quantity, 1) as rating'),'vote_quantity')
            ->join('image', 'product.product_id', '=', 'image.product_id');
    }
}
class ProductsController extends BaseController
{
    public function home(){
        $query = $this->getProductQuery()
            ->where('product.is_top','=','1')
            ->where('image.default_image', '=', '1')
           ->orderByDesc(DB::raw('total_vote / vote_quantity'))
            ->paginate(4);
        return view('layouts.body',['home'=>$query]);
    }
    public function products(){
        $productsPerPage = $this->getProductQuery()
        ->where('image.default_image', '=', '1')
           ->orderByDesc(DB::raw('total_vote / vote_quantity'))
            ->paginate(12);
        return view('products',['products'=>$productsPerPage]);
    }
    public function product($id){
        $query = $this->getProductQuery()
            ->where('product.name','=',$id)
            ->get();
        return view('productdetail',['product'=>$query]);
    }

    public function cateProduct($name){
        $productsPerPage = $this->getProductQuery()
            ->join('category','product.category_id','=','category.category_id')
            ->where('category.name','=',$name)
            ->where('image.default_image', '=', '1')
            ->groupBy('product.product_id','product.name','product.is_top','product.price','product.title','image.image_id','image.default_image','rating','product.description','vote_quantity')
            ->orderByDesc(DB::raw('total_vote / vote_quantity'))
            ->paginate(12);
        return view('cateproduct',['cate'=>$productsPerPage,'name'=>$name]);
    }
    public function bestSelling(){
        $productsPerPage = $this->getProductQuery()
            ->where('product.is_top','=','1')
            ->where('image.default_image', '=', '1')
            ->orderByDesc(DB::raw('total_vote / vote_quantity'))
            ->paginate(12);
        return view('menu.bestselling',['bsell'=>$productsPerPage]);
    }

    public function rating(Request $request){
        $valid = $request->validate([
            'email' => 'required|email',
            'star' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string|max:255',
            'proID' => 'integer'
        ]);
        $id   = $request->post('proID');
        $mail = $request->post('email');
        $star = $request->post('star');
        $cmt  = $request->post('comment');

        $insertVote = DB::table('vote_product')
        ->insert([
            'product_id' => $id,
            'email' => $mail,
            'vote_rating' => $star,
            'comments' => $cmt
        ]);
        if ($insertVote) {
            return redirect()->back()->with('success', 'Vote saved!');
        } else {
            return redirect()->back()->with('error', 'Unable to save vote.');
        }
        
    }
}