<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class FilterController extends Controller
{
    public function color(Request $request){
        $color = $request->post('color');
        $query = DB::table('product')
        ->join('image','product.product_id','=','image.product_id')
        ->where('image.default_image','=','1')
        ->where('color','=',$color)
        ->orderBy("product.product_id",'ASC');
        $productsPerPage = $query->paginate(12);
        return view('layouts.filter',['color'=>$productsPerPage]);
    }
}