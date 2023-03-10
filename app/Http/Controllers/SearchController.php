<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class SearchController extends Controller
{
    public function search(Request $request){
        $search = $request->post('product');
        $query = DB::table('product')
        ->join('image','product.product_id','=','image.product_id')
        ->where('image.default_image','=','1')
        ->where('title','like','%'.$search.'%')
        ->orderBy("product.product_id",'ASC');
        $productsPerPage = $query->paginate(12);
        return view('Search',['search'=>$productsPerPage,'title'=>$search]);

    }
}