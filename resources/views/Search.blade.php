@extends('layouts.app')
@section('main')
    <h2 class="title-allProduct">Search: {{ $title }}</h2>
    <div class="select">
        <select name="" id="" class="filter">
            <option value="" selected>Thap den cao</option>
            <option value="">Cao den thap</option>
            <option value="">Tu A-Z</option>
            <option value="">Tu Z-A</option>
        </select>
    </div>
    <div class="product-container">
        @foreach ($search as $pro)
            <div class="card">
                <a href="{{ url('products/' . $pro->name . '.html') }}" class="detail">
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
                </a>
            </div>
        @endforeach

    </div>

    <div class="pagination">
        {{-- previous --}}
        @if ($search->onFirstPage())
            <span>&laquo;</span>
        @else
            <a href="{{ $search->previousPageUrl() }}" rel="prev">&laquo;</a>
        @endif
        {{-- Hiển thị các số trang --}}
        @for ($i = 1; $i <= $search->lastPage(); $i++)
            @if ($i == $search->currentPage())
                <span class="active">{{ $i }}</span>
            @else
                <a href="{{ $search->url($i) }}"
                    class="{{ Request::fullUrlIs(url('/products') . '?page=' . $i . '*') ? 'active' : '' }}">{{ $i }}</a>
            @endif
        @endfor
        {{-- next --}}
        @if ($search->hasMorePages())
            <a href="{{ $search->nextPageUrl() }}" rel="next">&raquo;</a>
        @else
            <span>&raquo;</span>
        @endif
    </div>
@endsection
