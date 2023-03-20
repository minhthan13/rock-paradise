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
                        <label for="proname" class="form-label">Product Title: <span class="text-danger">*</span></label>
                        <input type="text" name='title' class="form-control" id="title" placeholder="Product Title"
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
                    <script>
                        CKEDITOR.replace("des");
                    </script>
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
                        <label for="style" class="form-label">Style: <span class="text-danger">*</span></label>
                        <input type="text" name='style' class="form-control" id="style" placeholder="Product Style"
                            required>
                    </div>
                    <div class="mb-3">
                        <label for="type" class="form-label">Type: <span class="text-danger">*</span></label>
                        <input type="text" name='type' class="form-control" id="type" placeholder="Product Type"
                            required>
                    </div>
                    <div class="mb-3">
                        <label for="color" class="form-label">Color: <span class="text-danger">*</span></label>
                        <input type="text" name='color' class="form-control" id="color" placeholder="Product Color"
                            required>
                    </div>
                    <div id="form-size" class="mb-3">
                        <div class="d-flex justify-content-start gap-4 mb-3">
                            <label for="size" class="form-label">Size: <span class="text-danger">*</span></label>
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
                            <input class="form-control" name='images[]' type="file" id="imageUP" multiple>
                        </div>
                    </div>
                    <button type="button" class="btn btn-info text-black" data-bs-toggle="modal"
                        data-bs-target="#BoxConfirm">
                        ADD Product
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="BoxConfirm" tabindex="-1" aria-labelledby="Add-Confirm"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="Add-Confirm">
                                        <b>Confirm Product Information</b>
                                    </h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <table class="table">
                                        <tbody>
                                            <!-- Add a table row for each field of the form that you want to show in the modal -->
                                            <tr>
                                                <td class="col-4"><strong>Product ID:</strong></td>
                                                <td id="confirm-proID" class="col-8"></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Product Name:</strong></td>
                                                <td id="confirm-title"></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Category:</strong></td>
                                                <td id="confirm-cate"></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Price:</strong></td>
                                                <td id="confirm-price"></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Style:</strong></td>
                                                <td id="confirm-style"></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Type:</strong></td>
                                                <td id="confirm-type"></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Color:</strong></td>
                                                <td id="confirm-color"></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Image Upload</strong></td>
                                                <td id="confirm-imageUP"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-info text-black" value="Confirm" />
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
