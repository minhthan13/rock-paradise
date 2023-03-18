@extends('admin.index')
@section('admin-main')
    <h2 class="text-center pt-3 fs-1 mb-3">Insert Product</h2>
    <div class="d-flex justify-content-center">
        <div id="form-insert" class="col-md-19">
            <form action="{{ route('product.inserted') }}" method="post" class="row gap-2  d-flex justify-content-evenly"
                enctype="multipart/form-data">
                @csrf
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="proID" class="form-label">Product ID: <span class="text-danger">*</span></label>
                        <input type="text" name='proID' class="form-control" id="proID" placeholder="Product ID"
                            required>
                    </div>
                    <div class="mb-3">
                        <label for="proname" class="form-label">Product Name: <span class="text-danger">*</span></label>
                        <input type="text" name='title' class="form-control" id="proname" placeholder="Product ID"
                            required>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price: <span class="text-danger">*</span></label>
                        <div class="input-group mb-3">
                            <span class="input-group-text">$</span>
                            <input type="number" name="price" class="form-control" id='price'
                                aria-label="Amount (to the nearest dollar)" min='1' required>
                            <span class="input-group-text">.00</span>
                        </div>

                    </div>
                    <div class="mb-3 ">
                        <label for="des" class="form-label">Description: </label>
                        <textarea class="form-control h-25" id="des" rows="6" name='des'></textarea>
                    </div>
                </div>
                {{-- right --}}
                <div class="col-md-4">
                    <div class="mb-3 col-md-11">
                        <label class="form-label" for="cate">Category: <span class="text-danger">*</span></label>
                        <select class="form-select mb-3" name='cateid' id="cate" required>
                            <option selected disabled>Category</option>
                            @foreach ($cate as $c)
                                <option value={{ $c->category_id }}>{{ $c->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="style" class="form-label">Style: </label>
                        <input type="text" name='style' class="form-control" id="style"
                            placeholder="Product Style">
                    </div>
                    <div class="mb-3">
                        <label for="type" class="form-label">Type: </label>
                        <input type="text" name='type' class="form-control" id="type" placeholder="Product Type">
                    </div>
                    <div class="mb-3">
                        <label for="color" class="form-label">Color: </label>
                        <input type="text" name='color' class="form-control" id="color"
                            placeholder="Product Color">
                    </div>
                    <div id="form-size" class="mb-3">
                        <div class="d-flex justify-content-start gap-4 mb-3">
                            <label for="size" class="form-label">Size: </label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="size[]" id="small">
                                <label class="form-check-label" for="small">
                                    Small
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="size[]" id="middle" checked>
                                <label class="form-check-label" for="middle">
                                    Middle
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="size[]" id="big">
                                <label class="form-check-label" for="big">
                                    Big
                                </label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="imageUP" class="form-label">Image Upload: </label>
                            <input class="form-control" name='images[]' type="file" id="imageUP">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-info text-black-50 mt-3">Add Product</button>
                </div>


            </form>
        </div>
    </div>
@endsection
