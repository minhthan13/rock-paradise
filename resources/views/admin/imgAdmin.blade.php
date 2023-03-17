@extends('admin.index')
@section('admin-main')
    <div class="row d-flex justify-content-center">
        <div class="col-md-10 ">


            <h2 class="text-center pt-3 fs-1 mb-3">
                Images Products</h2>
            <table class="table table-bordered align-middle text-center mt-4">
                <tr class="align-middle table-primary">
                    <th>Product Name</th>
                    <th>Images</th>
                </tr>
                </thead>
                <tbody>
                    @foreach ($imgs as $data)
                        <tr>
                            <td>{{ $data['name'] }}</td>
                            <td>
                                <div class="d-flex  gap-3">
                                    @foreach ($data['images'] as $image_id)
                                        <img src="{{ asset('images/product/' . $data['name'] . '/' . $image_id . '.jpg') }}"
                                            alt="{{ $data['name'] }}" width="70px" height="70px" />
                                    @endforeach
                                </div>
                            </td>
                        </tr>
                    @endforeach
            </table>
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
        </div>
    </div>
@endsection
