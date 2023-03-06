@extends('layouts.app')
@section('main')
    <div class="card-wrapper">

        <!-- card left -->
        <div class="product-imgs">
            <div class="img-display">
                <div class="img-showcase">
                    <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/il_794xN.802093538_htgm_360x.webp?v=1677102103"
                        alt="">
                    <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/amethystring_360x.webp?v=1658851640"
                        alt="">
                    <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/il_794xN.801859479_r2en_360x.webp?v=1677877581"
                        alt="">
                    <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/03-thumbnail_IMG_1554_360x.jpg?v=1670818379"
                        alt="">
                    <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/il_794xN.801859479_r2en_360x.webp?v=1677877581"
                        alt="">
                </div>
            </div>
            <div class="img-select">
                <div class="img-item">
                    <a href="#" data-id="1">
                        <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/il_794xN.802093538_htgm_360x.webp?v=1677102103"
                            alt="">
                    </a>
                </div>
                <div class="img-item">
                    <a href="#" data-id="2">
                        <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/amethystring_360x.webp?v=1658851640"
                            alt="">
                    </a>
                </div>
                <div class="img-item">
                    <a href="#" data-id="3">
                        <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/il_794xN.801859479_r2en_360x.webp?v=1677877581"
                            alt="">
                    </a>
                </div>
                <div class="img-item">
                    <a href="#" data-id="4">
                        <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/03-thumbnail_IMG_1554_360x.jpg?v=1670818379"
                            alt="">
                    </a>
                </div>
                <div class="img-item">
                    <a href="#" data-id="5">
                        <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/il_794xN.801859479_r2en_360x.webp?v=1677877581"
                            alt="">
                    </a>
                </div>
            </div>
        </div>
        <!-- card right -->
        <div class="product-content">


            <h2 class="product-title">{{ $product[0]->name }}</h2>
            <div class="product-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <div class="product-price">
                <p class="new-price">Price: <span>${{ $product[0]->price }}.00</span></p>
            </div>

            <div class="product-desc">
                <h2>DECRIPSTION: </h2>
                <p>{{ $product[0]->description }}</p>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, perferendis eius. Dignissimos,
                    labore suscipit. Unde.</p>
            </div>

            <div class="purchase-info">
                <button type="button" class="btn">
                    Add to Cart <i class="fas fa-shopping-cart"></i>
                </button>
                <button type="button" class="btn">Buy Now</button>
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
@endsection
