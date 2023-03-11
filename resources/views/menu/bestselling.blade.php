@extends('layouts.app')
@section('main')
    <h2 class="title-allProduct">BEST SELLING PRODUCT</h2>
    <div class="select">
        <select name="" id="" class="filter">
            <option value="" selected>Thap den cao</option>
            <option value="">Cao den thap</option>
            <option value="">Tu A-Z</option>
            <option value="">Tu Z-A</option>
        </select>
    </div>
    <div class="product-container">
        @foreach ($bsell as $pro)
                <div class="card">
                    <a href="{{ url('products/' . $pro->name . '.html') }}" class="detail">
                        <img src="{{ asset('images/product/' . $pro->name . '/' . $pro->image_id . '.jpg') }}"
                        alt="{{ $pro->name }}" width="400px" height="400px" />
                    </a>
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
            
        @endforeach

    </div>
    <div class="pagination">
        {{-- previous --}}
        @if ($bsell->onFirstPage())
            <span>&laquo;</span>
        @else
            <a href="{{ $bsell->previousPageUrl() }}" rel="prev">&laquo;</a>
        @endif
        {{-- Hiển thị các số trang --}}
        @for ($i = 1; $i <= $bsell->lastPage(); $i++)
            @if ($i == $bsell->currentPage())
                <span class="active">{{ $i }}</span>
            @else
                <a href="{{ $bsell->url($i) }}"
                    class="{{ Request::fullUrlIs(url('/products') . '?page=' . $i . '*') ? 'active' : '' }}">{{ $i }}</a>
            @endif
        @endfor
        {{-- next --}}
        @if ($bsell->hasMorePages())
            <a href="{{ $bsell->nextPageUrl() }}" rel="next">&raquo;</a>
        @else
            <span>&raquo;</span>
        @endif
    </div>
@endsection
