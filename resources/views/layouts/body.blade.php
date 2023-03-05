@extends('layouts.app')
@section('main')
    <script src="{{ asset('js/slide.js') }}" defer></script>

    <div class="slideshow-container">
        <div class="mySlides fade">
            <div class="title">
                <h2>Free Gift</h2>
                <div class="sub-title">with purchase of $25 or more. RETAIL only</div>
                <div class="link">
                    <a href="/products">Shop All</a>
                </div>
            </div>
            <img
                src="https://cdn.shopify.com/s/files/1/1552/6795/files/franco-antonio-giovanella-g95sf8-fEQg-unsplash.jpg?v=1672425027&width=352" />
        </div>
        <div class="mySlides fade">
            <div class="title">
                <h2>Free Gift</h2>
                <div class="sub-title">with purchase of $25 or more. RETAIL only</div>
                <div class="link">
                    <a href="/products">Shop All</a>
                </div>
            </div>
            <img
                src="https://cdn.shopify.com/s/files/1/1552/6795/files/close-up-background-of-purple-amethyst-crystals-2022-10-05-22-18-47-utc.jpg?v=1672426630&width=1920" />
        </div>

        <div class="mySlides fade">
            <div class="title">
                <h2>Free Gift</h2>
                <div class="sub-title">with purchase of $25 or more. RETAIL only</div>
                <div class="link">
                    <a href="/products">Shop All</a>
                </div>
            </div>
            <img
                src="https://cdn.shopify.com/s/files/1/1552/6795/files/pexels-karolina-grabowska-6825335.jpg?v=1672425640&width=1920" />
        </div>

        <a class="prev" onclick="plusSlides(-1)"></a>
        <a class="next" onclick="plusSlides(1)"></a>
    </div>
    <h2 class="title-product"> Product</h2>
    <div class="product-container">
        @foreach ($home as $pro)
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
        @endforeach


    </div>
    <div class="link">
        <a href="/products">Shop All</a>
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
                <a href="/products">SHOP</a>
            </div>
        </div>
    </div>
    <br />
    <hr />
@endsection
