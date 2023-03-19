<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FilterController extends Controller
{
    public function filter(Request $request, $view)
    {
        $query = DB::table('product')
            ->select(
                'product.product_id', 
                'product.name', 
                'product.is_top', 
                'product.price', 
                'product.title', 
                'image.image_id', 
                'image.default_image',
                'product.description',
                'product.vote_quantity',
                DB::raw('ROUND(total_vote / vote_quantity, 1) as rating')
            )
            ->join('image','product.product_id','=','image.product_id')
            ->where('image.default_image','=','1');
        
        $priceMin = $request->input('price_min', 1);
        $priceMax = $request->input('price_max', 40000);
        
        if($priceMin == 0){return redirect('/products');}
        
        $query->whereBetween('price', [$priceMin, $priceMax]);
        
        $rates = $request->input('rate', []);
        if (!empty($rates)) {
            $query->whereBetween(DB::raw('total_vote / vote_quantity'), [$rates[0], $rates[count($rates) - 1]]);
        }
        
        $brands = $request->input('brand', []);
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
        $query->orderByDesc('price');
        
        switch($view){
            case 'products':
                $perPage = $query->paginate(12, ['*'], 'page', $request->get('page'));
                return view('products', ['products' => $perPage->appends(request()->query())]);
            
            case 'bestselling':
                $query->where('product.is_top','=','1');
                $perPage = $query->paginate(12, ['*'], 'page', $request->get('page'));
                return view('menu.bestselling', ['bsell' => $perPage->appends(request()->query())]);
            default:
                return view('error');
        }
    }
}