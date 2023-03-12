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
                    <div class="rate">
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                        <span class="star"><i class="fa-solid fa-star"></i></span>
                    </div>
                </div>
            </a>
        @endforeach
    </div>
    <div class="link">
        <a href="/products">SHOP ALL</a>
    </div>
    <div class="e-voucher">
        <img src="https://i.etsystatic.com/16874044/r/il/661143/3428144869/il_570xN.3428144869_iovn.jpg" alt="" />
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
