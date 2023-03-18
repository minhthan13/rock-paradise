<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\FilterController;
use App\Http\Controllers\AdminController;



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
//rate star
Route::post('/rated',[ProductsController::class,'rating'])->name('product.rating');
//menu homepage
Route::get('/best-selling',[ProductsController::class,'bestSelling']);
Route::get('/contact',function (){ return view('menu.contact');});
Route::get('/about',function (){ return view('menu.about');});
Route::get('/FAQ',function (){ return view('menu.FAQ');});

// site map
Route::get('/sitemap',function(){return view('sitemap');});
// gift card
Route::get('/giftcard',function(){return view('giftcard');});

// admin
Route::get('/admin', 'ProductController@index')->name('admin.home');
Route::get('/login',function(){return view('admin.login');})->name('admin.login');
Route::post('/admin/dashboard',[AdminController::class,'index'])->name('admin.dashboard');
Route::get('/admin/dashboard',[AdminController::class,'dashboard'])->name('admin.product');
Route::get('admin/category',[AdminController::class,'cateadmin'])->name('admin.cate');
Route::get('admin/img',[AdminController::class,'imgadmin'])->name('admin.img');
Route::get('admin/user',[AdminController::class,'listUser'])->name('admin.listUser');

// deleted
Route::get('/admin/delete/{id}', [AdminController::class,'delete'])->name('product.delete');
Route::get('/admin/insert',function(){return view('admin.insertPro');})->name('product.insert');
Route::post('/admin/inserted', [AdminController::class,'insertPro'])->name('product.inserted');