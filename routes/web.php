<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\SearchController;


Route::get('/', function () {
    return view('layouts.app');
});
//all product
Route::get('/products',[ProductsController::class,'products'] );
//product detail
Route::get('/product/{id}',[ProductsController::class,'product'] );