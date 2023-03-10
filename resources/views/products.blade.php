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
            <a href="{{ url('products/' . $pro->name . '.html') }}" class="detail">
                <div class="card">
                    <img src="{{ asset('images/product/' . $pro->name . '/' . $pro->image_id . '.jpg') }}"
                        alt="{{ $pro->name }}" width="400px" height="400px" />
                    <p class="name-product">{{ $pro->title }}</p>
                    <span class="price-product">{{ $pro->price }}$</span>
                    <div class="rate">
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                    </div>
                </div>
            </a>
        @endforeach

    </div>

    <div class="pagination">
        {{-- previous --}}
        @if ($products->onFirstPage())
            <span>&laquo;</span>
        @else
            <a href="{{ $products->previousPageUrl() }}" rel="prev">&laquo;</a>
        @endif
        {{-- Hiển thị các số trang --}}
        @for ($i = 1; $i <= $products->lastPage(); $i++)
            @if ($i == $products->currentPage())
                <span class="active">{{ $i }}</span>
            @else
                <a href="{{ $products->url($i) }}"
                    class="{{ Request::fullUrlIs(url('/products') . '?page=' . $i . '*') ? 'active' : '' }}">{{ $i }}</a>
            @endif
        @endfor
        {{-- next --}}
        @if ($products->hasMorePages())
            <a href="{{ $products->nextPageUrl() }}" rel="next">&raquo;</a>
        @else
            <span>&raquo;</span>
        @endif
    </div>
@endsection
