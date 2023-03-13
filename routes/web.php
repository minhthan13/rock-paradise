<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\FilterController;




//home
Route::get('/',[ProductsController::class,'home']);
// products
Route::get('/products',[ProductsController::class,'products'] );
//product detail
Route::get('/products/{id}.html',[ProductsController::class,'product'] );
//cate product
Route::get('/product/{name}',[ProductsController::class,'cateProduct'] );
//search
Route::post('product/search', [SearchController::class, "search"]);
// filter

Route::get('/{view}/filter', 'App\Http\Controllers\FilterController@filter')
->where('view', '(products|bestselling)')->name('filter');
//menu homepage
Route::get('/best-selling',[ProductsController::class,'bestSelling']);
Route::get('/contact',function (){ return view('menu.contact');});
Route::get('/about',function (){ return view('menu.about');});
Route::get('/FAQ',function (){ return view('menu.FAQ');});