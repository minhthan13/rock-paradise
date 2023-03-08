<div class="navbar">
    <div class="logo-navbar">
        <a href="/">
            <img src="{{ asset('images/logo.avif') }}" alt="logo" />

        </a>
    </div>
    <div class="menu-navbar">
        <ul class="nav-list">
            <li class="nav-item"><a class="link" href="/">Home</a></li>
            <li class="nav-item has-child">
                <a class="link" href="/products">Product</a>
                <ul class="sub-menu">
                    @foreach ($cate as $c)
                        <li class="sub-menu-item"><a href="/product/{{ $c->name }}">{{ $c->name }}</a></li>
                    @endforeach
                </ul>
            </li>
            <li class="nav-item">
                <a class="link" href="/best-selling">Best Selling</a>
            </li>
            <li class="nav-item"><a class="link" href="/contact">Contact</a></li>
            <li class="nav-item"><a class="link" href="/about">About Us</a></li>
            <li class="nav-item"><a class="link" href="/FAQ">FAQ</a></li>
        </ul>
    </div>
    <div class="nav-icon">
        <a href="login/login.html"><i class="fa-regular fa-user"></i></a>
        <i class="fa-solid fa-magnifying-glass"></i>
        <i class="fa-solid fa-bag-shopping"></i>
        <i class="fa-solid fa-bars"></i>
    </div>
</div>
<div class="container-search close">
    <div class="search">
        <form action="">
            <button type="submit"><i class="fa-solid fa-magnifying-glass" onclick="search()"></i></button>
            <input type="text" placeholder="Search Our Store">
        </form>
        <button class="closeModel"><i class="fa-solid fa-xmark"></i></button>
    </div>
</div>
<div class="container-cart close">
    <div class="cart-box">
        <div class="header-cart-box">
            <p>YOUR CART</p>
            <i class="fa-solid fa-xmark xmark-cart"></i>
        </div>
        <hr>
    </div>
</div>
