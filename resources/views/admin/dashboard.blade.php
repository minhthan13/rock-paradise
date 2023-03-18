@extends('admin.index')
@section('admin-main')
    <div>
        <h2 class="text-center pt-3 fs-1 mb-3">Dashboard Products</h2>
        {{-- button add product --}}
        <a class="btn btn-info float-end mb-2 text-black-50 fw-bolder" href="{{ route('product.insert') }}" role="button">Add
            Product</a>
        <table class="table table-bordered align-middle text-center">
            <tr class="align-middle table-primary">
                <th>Product</th>
                <th>Category</th>
                <th>Name</th>
                <th>Image</th>
                <th>Price</th>
                <th>Description</th>
                <th>Rating</th>
                <th>Color</th>
                <th>Size</th>
                <th class="text-nowrap">Created-time</th>
                <th>Setting</th>
            </tr>
            @foreach ($products as $pro)
                <tr>
                    <td>{{ $pro->proname }}</td>
                    <td>{{ $pro->name }}</td>
                    <td class="shorten">{{ $pro->title }}</td>
                    <td>
                        @php
                            $imagePath = "images/product/{$pro->proname}/{$pro->image_id}.jpg";
                        @endphp
                        @if (file_exists(public_path($imagePath)))
                            <img src="{{ asset($imagePath) }}" alt="{{ $pro->proname }}" width="40px" height="40px" />
                        @else
                            <img src="{{ asset('images/logo.avif') }}" alt="{{ $pro->proname }}" width="40px"
                                height="40px" />
                        @endif
                    </td>
                    <td class="text-nowrap">{{ $pro->price }} &dollar;</td>
                    <td class=" shorten">{{ $pro->description }}</td>
                    <td>{{ $pro->rating ?? 'none' }}</td>
                    <td>{{ $pro->color }}</td>
                    <td>{{ $pro->size }}</td>
                    <td>{{ $pro->created_time }}</td>
                    <td>
                        <div class="d-flex justify-content-around box-crud">
                            <div class="box-edit">
                                <i id="edit-product" class="bi bi-gear"></i>
                            </div>

                            <div class="box-deleted">
                                <i id="delete-product" class="bi bi-trash " data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" data-proname="{{ $pro->proname }}"
                                    data-proid="{{ $pro->product_id }}">
                                </i>
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">DELETED</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>You are sure you want to delete the product : <span
                                                        class="productName text-danger"></span> ?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <a href="">
                                                    <button type="button" class="btn btn-primary">Deleted</button>
                                                </a>
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
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

    {{-- message index --}}
    <script>
        @if (session()->has('success_message'))
            alert('{{ session()->get('success_message') }}');
        @endif
    </script>
    {{-- message delete --}}
    <script>
        var showAlert = true;
        // thông báo xóa
        @if (Session::has('messDeleted'))
            if (showAlert) {
                alert("{{ Session::get('messDeleted') }}");
                showAlert = false;
            }
        @endif
    </script>

    <script>
        @if (session()->has('inser-alert'))
            alert('{{ session()->get('insertsuccess') }}');
        @endif
    </script>
@endsection
