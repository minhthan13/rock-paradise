@extends('admin.index')
@section('admin-main')
    <h2 class="text-center pt-3 fs-1 mb-3">Category Products</h2>
    <table class="table table-bordered align-middle text-center mt-4">
        <tr class="align-middle table-primary">
            <th>ID</th>
            <th>Name</th>
            <th>Product Quantity</th>
            <th>Image</th>
        </tr>

        @foreach ($cate as $ca)
            <tr>
                <td>{{ $ca->category_id }}</td>
                <td>{{ $ca->name }}</td>
                <td>{{ $ca->product_count }} - Products</td>
                <td><img src="{{ asset('images/product/' . $ca->cate_image->proname . '/' . $ca->cate_image->image_id . '.jpg') }}"
                        alt="{{ $ca->cate_image->proname }}" width="50px" height="50px" />

                </td>
            </tr>
        @endforeach

    </table>
@endsection
