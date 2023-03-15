<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class BaseController extends Controller
{
    protected function getProductQuery() {
        return DB::table('product')
            ->select('product.product_id', 'product.name', 'product.is_top', 'product.price', 'product.title', 'image.image_id', 'image.default_image','product.description',
                DB::raw('ROUND(total_vote / vote_quantity, 1) as rating'))
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
            ->groupBy('product.product_id','product.name','product.is_top','product.price','product.title','image.image_id','image.default_image','rating','product.description')
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
}