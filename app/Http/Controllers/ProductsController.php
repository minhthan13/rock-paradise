<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductsController extends Controller
{
    public function home(){
        $query = DB::table('product')
        ->join('image','product.product_id','=','image.product_id')
            ->where('product.is_top','=','1')
            ->where('image.default_image','=','1')
            ->paginate(4);
        return view('layouts.body',['home'=>$query]);
    }

    public function products(){
        $query = DB::table('product')
        ->join('image','product.product_id','=','image.product_id')
        ->where('image.default_image','=','1')
        ->get();
        return view('products',['products'=>$query]);

    }
    public function product($id){
        $query = DB::table('product')
        ->join('image','product.product_id','=','image.product_id')  
        ->where('product.name','=',$id)
        ->get();
        return view('productdetail',['product'=>$query]);
    }
    public function cateProduct($name){
        $query = DB::table('product')
        ->join('category','product.category_id','=','category.category_id')
        ->join('image','product.product_id','=','image.product_id')
        ->select('product.name','image.image_id','product.title','product.price')
        ->where('category.name','=',$name)
        ->where('image.default_image','=','1')
        ->groupBy( 'product.name','image.image_id','product.title','product.price')
        ->get();
        return view('cateproduct',['cate'=>$query,'name'=>$name]);

    }
}