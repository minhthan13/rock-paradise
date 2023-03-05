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
        $query = DB::table('product')->where('product.product_id','='.$id)->get();
        return view('layouts.app',['product'=>$query]);
    }
}