<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class SearchController extends Controller
{
    public function search(Request $request){
        $search = $request->post('product');
        $query = DB::table('product')
        ->select('product.product_id', 'product.name', 'product.is_top', 'product.price', 'product.title', 'image.image_id', 'image.default_image','product.description',
                DB::raw('ROUND(total_vote / vote_quantity, 1) as rating'))
        ->join('image','product.product_id','=','image.product_id')
        ->where('image.default_image','=','1')
        ->where('title','like','%'.$search.'%')
        ->orderByDesc(DB::raw('total_vote / vote_quantity'));
        $productsPerPage = $query->paginate(12);
        return view('Search',['search'=>$productsPerPage,'title'=>$search]);
    }
}