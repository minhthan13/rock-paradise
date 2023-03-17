@extends('admin.index')
@section('admin-main')
    <i class="fa-light fa-screwdriver-wrench fs-1"></i>
    <div class="text-end"><i class="fa fa-user"></i> : {{ $user->user_name }}</div>
    <div>
        <h2 class="text-center pt-3 fs-1 mb-3">Dashboard Products</h2>
        <table class="table table-bordered align-middle text-center">
            <tr class="align-middle table-primary">
                <th>Product ID</th>
                <th>Category</th>
                <th>Name</th>
                <th>Image</th>
                <th>Price</th>
                <th>Description</th>
                <th>Color</th>
                <th>Size</th>
                <th class="text-nowrap">Created-time</th>
            </tr>
            @foreach ($products as $pro)
                <tr>
                    <td>{{ $pro->name }}</td>
                    <td>{{ $pro->category_id }}</td>
                    <td class="shorten">{{ $pro->title }}</td>
                    <td>{{ $pro->product_id }}</td>
                    <td>{{ $pro->price }}</td>
                    <td class=" shorten">{{ $pro->description }}</td>
                    <td>{{ $pro->color }}</td>
                    <td>{{ $pro->size }}</td>
                    <td>{{ $pro->created_time }}</td>
                </tr>
            @endforeach
        </table>
    </div>

    <div class="pagination mb-4">
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
                    class="{{ Request::fullUrlIs(url('/dashboard') . '?page=' . $i . '*') ? 'active' : '' }}">{{ $i }}</a>
            @endif
        @endfor
        {{-- next --}}
        @if ($products->hasMorePages())
            <a href="{{ $products->nextPageUrl() }}" rel="next">&raquo;</a>
        @else
            <span>&raquo;</span>
        @endif
    </div>
    @if (session()->has('success_message'))
        <script>
            alert('{{ session('success_message') }}');
        </script>
    @endif
@endsection
