<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\SearchController;



//home
Route::get('/',[ProductsController::class,'home']);
// products
Route::get('/products',[ProductsController::class,'products'] );
//product detail
Route::get('/product/{id}',[ProductsController::class,'product'] );


//menu homepage
Route::get('/best-selling',function (){ return view('menu.bestselling');});
Route::get('/contact',function (){ return view('menu.contact');});
Route::get('/about',function (){ return view('menu.about');});
Route::get('/FAQ',function (){ return view('menu.FAQ');});