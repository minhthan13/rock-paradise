@extends('layouts.app')
@section('main')
    <script src="{{ asset('js/detail.js') }}" defer></script>
    <div class="card-wrapper">
        <!-- card left -->
        <div class="product-imgs">
            <div class="img-display">
                <div class="img-showcase">
                    @foreach ($product as $p)
                        <img src="{{ asset('images/product/' . $p->name . '/' . $p->image_id . '.jpg') }}"
                            alt="{{ $p->image_id }}">
                    @endforeach
                </div>
            </div>
            <div class="img-select">
                @foreach ($product as $i)
                    <div class="img-item">
                        <a href="#" data-id="{{ $loop->iteration }}">
                            <img src="{{ asset('images/product/' . $i->name . '/' . $i->image_id . '.jpg') }}"
                                alt="{{ $i->image_id }}">
                        </a>
                    </div>
                @endforeach

            </div>
        </div>
        <!-- card right -->
        <div class="product-content">
            <h2 class="product-title">{{ $product[0]->title }}</h2>
            <div class="product-rating">
                <div class="background-rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <div class="present-rating">
                    </div>
                    &nbsp;(<p class="total-rate">
                        {{ $product[0]->rating }} Star</p>&nbsp;-&nbsp;<p>{{ $product[0]->vote_quantity }} Vote</p>)
                </div>
            </div>
            <div class="product-price">
                <p class="new-price">Price: <span>${{ number_format($product[0]->price) }}.00</span></p>
            </div>

            <div class="product-desc">
                <h2>DECRIPSTION: </h2>
                <p>{{ $product[0]->description }}</p>

            </div>

            <div class="purchase-info">
                <button type="button" class="btn">
                    Add to Cart <i class="fas fa-shopping-cart"></i>
                </button>
                <button type="button" class="btn btn-rating">Rating</button>
            </div>

            <div class="social-links">
                <p>Share At: </p>
                <a href="#">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="#">
                    <i class="fab fa-whatsapp"></i>
                </a>
                <a href="#">
                    <i class="fab fa-pinterest"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="container-rating close">

        <form action="{{ route('product.rating') }}" id="form-rating" method="post">
            @csrf
            <div class="box-rating">
                <div class="header-rating">
                    <p>Rating</p>
                </div>
                <div class="body-rating">
                    <div class="email-userRating">
                        <label for="email-rate">Email User: <span style="color:red">*</span></label>
                        <input type="email" name="email" id="email-rate" required>
                    </div>
                    <div class="star-userRating">
                        <p>Vote: <span style="color:red">*</span></p>
                        <div class="rate">
                            <span class="star"><i class="fa-solid fa-star star-active" data-value="1"></i></span>
                            <span class="star"><i class="fa-solid fa-star" data-value="2"></i></span>
                            <span class="star"><i class="fa-solid fa-star" data-value="3"></i></span>
                            <span class="star"><i class="fa-solid fa-star" data-value="4"></i></span>
                            <span class="star"><i class="fa-solid fa-star" data-value="5"></i></span>
                        </div>
                        <input type="hidden" name="star" id="star-input" value="">
                        <input type="hidden" name="proID" value="{{ $product[0]->product_id }}">
                    </div>
                    <div class="comment-userRating">
                        <p>Comment:</p>
                        <textarea name="comment" id="comment" cols="30" rows="10"></textarea>
                    </div>
                    <button class="btn-userRating" type="submit">Rated</button>
                </div>
            </div>
        </form>
    </div>
    @if (session('success'))
        <script>
            alert('{{ session('success') }}');
        </script>
    @endif

    @if (session('error'))
        <script>
            alert('{{ session('error') }}');
        </script>
    @endif
@endsection
