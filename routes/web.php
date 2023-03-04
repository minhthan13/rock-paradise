<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\SearchController;


// homepage
Route::get('/',[ProductsController::class,'products'] );
//product detail
Route::get('/product/{id}',[ProductsController::class,'product'] );