@extends('layouts.app')
@section('main')
    @include('layouts.slide')
    <h2 class="title-product"> Product</h2>
    <div class="product-container">
        @foreach ($home as $pro)
            <a href="{{ url('products/' . $pro->name . '.html') }}" class="detail">
                <div class="card">
                    <img src="{{ asset('images/product/' . $pro->name . '/' . $pro->image_id . '.jpg') }}" alt=""
                        width="400px" height="400px" />
                    <p class="name-product">{{ $pro->title }}</p>
                    <span class="price-product">{{ $pro->price }}$</span>
                    <div class="product-rating">
                        <div class="background-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <div class="present-rating">
                            </div>
                        </div>
                        <p class="total-rate">
                            {{ $pro->rating }} star
                        </p>
                    </div>
                </div>
            </a>
        @endforeach
    </div>
    <div class="link">
        <a href="/products">SHOP ALL</a>
    </div>
    <div class="e-voucher">
        <img src="https://cdn.shopify.com/s/files/1/0072/9631/9591/collections/gift-cards-496323_1944x.jpg?v=1676309648"
            alt="" />
        <div class="link">
            <a href="/giftcard">GIFT CARD
            </a>
        </div>

    </div>
    <div class="hotspots">
        <h2 class="hotspots-title">THE LIFESTYLE EDIT</h2>
        <div class="hotspots-wrapper">
            <div class="hotspots-img">
                <img src="https://cdn.shopify.com/s/files/1/1552/6795/files/pexels-arina-krasnikova-6998590.jpg?v=1672065490&width=1920"
                    alt="" />
            </div>
            <div class="hotspots-content">
                <div class="sub-heading">THE CEREBRAL STONE</div>
                <h3>AMETHYST</h3>
                <p>
                    Amethyst is a powerful and protective stone. It guards against
                    psychic attack, transmuting the energy into love and protecting the
                    wearer from all types of harm, including geopathic or
                    electromagnetic stress and ill wishes from others.
                </p>
                <p>
                    The crystal boosts hormone production, tunes the endocrine system
                    and metabolism. It strengthens the immune system, reduces pain and
                    strengthens the body to fight against cancer. It destroys malignant
                    tumours and aids in tissue regeneration.
                </p>
                <p>
                    Amethyst eases headaches and releases tension. It reduces bruising,
                    swellings, injuries, and treats hearing disorders. Amethyst heals
                    diseases of the lungs and respiratory tract, skin conditions,
                    cellular disorders and diseases of the digestive tract.
                </p>
                <div class="link">
                    <a href="/products">
                        SHOP
                    </a>
                </div>
            </div>
        </div>
    </div>
@endsection
