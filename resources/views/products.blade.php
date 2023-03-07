@extends('layouts.app')
@section('main')
    <h2 class="title-allProduct">ALL PRODUCT</h2>
    <div class="select">
        <select name="" id="" class="filter">
            <option value="" selected>Thap den cao</option>
            <option value="">Cao den thap</option>
            <option value="">Tu A-Z</option>
            <option value="">Tu Z-A</option>
        </select>
    </div>
    <div class="product-container">
        @foreach ($products as $pro)
            <div class="card">
                <a href="{{ url('products/' . $pro->name . '.html') }}" class="detail">
                    <img src="{{ asset('images/product/' . $pro->name . '/' . $pro->image_id . '.jpg') }}" alt=""
                        width="400px" height="400px" />
                    <p class="name-product">{{ $pro->title }}</p>
                    <span class="price-product">{{ $pro->price }}$</span>
                    <div class="rate">
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                    </div>
                </a>
            </div>
        @endforeach

    </div>
    <ul class="pagination">
        <li class="pagination-item">
            <a href="" class="pagination-item-link"><i class="fa-solid fa-chevron-left"></i></a>
        </li>
        <li class="pagination-item">
            <a href="" class="pagination-item-link">1</a>
        </li>
        <li class="pagination-item">
            <a href="" class="pagination-item-link">2</a>
        </li>
        <li class="pagination-item">
            <a href="" class="pagination-item-link">3</a>
        </li>
        <li class="pagination-item">
            <a href="" class="pagination-item-link">...</a>
        </li>
        <li class="pagination-item">
            <a href="" class="pagination-item-link">10</a>
        </li>
        <li class="pagination-item">
            <a href="" class="pagination-item-link"><i class="fa-solid fa-chevron-right"></i></a>
        </li>
    </ul>
@endsection
