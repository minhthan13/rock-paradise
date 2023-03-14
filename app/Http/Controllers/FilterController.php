<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FilterController extends Controller
{
    public function filter(Request $request, $view){
        switch($view){
            case 'products':{
                $query = DB::table('product')
                ->join('image','product.product_id','=','image.product_id')
                ->where('image.default_image','=','1');
                $priceMin = $request->input('price_min', 1);
                $priceMax = $request->input('price_max', 40000);
                if($priceMin==0){return redirect('/products');}
                $query->whereBetween('price', [$priceMin, $priceMax]);
                $rates = $request->input('rate', []);
                if (!empty($rates)) {
                    $query->where('rate','<=', $rates);
                }
                if (!empty($brands)) {
                    $query->whereIn('brand', $brands);
                }
                $colors = $request->input('color', []);
                if (!empty($colors)) {
                    $query->whereIn('color', $colors);
                }
                $sizes = $request->input('size', []);
                if (!empty($sizes)) {
                    $query->whereIn('size', $sizes);
                }
                $query->orderBy("product.product_id",'ASC');
                $productsPerPage = $query->paginate(12, ['*'], 'page', $request->get('page'));
                return view('products', ['products' =>$productsPerPage->appends(request()->query())]);
                break;
            }
            case 'bestselling':{
                $query = DB::table('product')
                ->join('image','product.product_id','=','image.product_id')
                ->where('image.default_image','=','1')
                ->where('product.is_top','=','1');
                $priceMin = $request->input('price_min', 1);
                $priceMax = $request->input('price_max', 40000);
                if($priceMin==0){return redirect('/products');}
                $query->whereBetween('price', [$priceMin, $priceMax]);
                $rates = $request->input('rate', []);
                if (!empty($rates)) {
                    $query->where('rate','<=', $rates);
                }
                if (!empty($brands)) {
                    $query->whereIn('brand', $brands);
                }
                $colors = $request->input('color', []);
                if (!empty($colors)) {
                    $query->whereIn('color', $colors);
                }
                $sizes = $request->input('size', []);
                if (!empty($sizes)) {
                    $query->whereIn('size', $sizes);
                }
                    $query->orderBy("product.product_id",'ASC');
                    $productsPerPage = $query->paginate(12, ['*'], 'page', $request->get('page'));
                
                return view('menu.bestselling',['bsell'=>$productsPerPage->appends(request()->query())]);
                break;
            }

            default:{
                return view('error');
                break;
            }
        }
        
    }
}