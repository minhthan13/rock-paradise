<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductsController extends Controller
{
    public function products(){
        $query = DB::table('product')->get();
        return view('layouts.body',['products'=>$query]);
    }
    public function product($id){
        $query = DB::table('product')->where('product.product_id','='.$id)->get();
        return view('layouts.app',['product'=>$query]);
    }
}