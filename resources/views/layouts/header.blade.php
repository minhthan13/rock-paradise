<div class="navbar">
    <div class="logo-navbar">
        <img src="{{ asset('images/logo.avif') }}" alt="" />
    </div>
    <div class="menu-navbar">
        <ul class="nav-list">
            <li class="nav-item"><a class="link" href="">Home</a></li>
            <li class="nav-item has-child">
                <a class="link" href="">Product</a>
                <ul class="sub-menu">
                    @foreach ($cate as $c)
                        <li class="sub-menu-item"><a href="#">{{ $c->name }}</a></li>
                    @endforeach
                </ul>
            </li>
            <li class="nav-item">
                <a class="link" href="">Best Selling</a>
            </li>
            <li class="nav-item"><a class="link" href="">Contact</a></li>
            <li class="nav-item"><a class="link" href="">About Us</a></li>
            <li class="nav-item"><a class="link" href="">FAQ</a></li>
        </ul>
    </div>
    <div class="nav-icon">
        <a href=""><i class="fa-regular fa-user"></i></a>
        <i class="fa-solid fa-magnifying-glass" onclick="search()"></i>
        <a href=""><i class="fa-solid fa-bag-shopping"></i></a>
    </div>
</div>
<div class="container-search close">
    <div class="search">
        <form action="">
            <button type="submit">
                <i class="fa-solid fa-magnifying-glass" onclick="search()"></i>
            </button>
            <input type="search" placeholder="Search Our Store" />
        </form>
        <button onclick="Close()"><i class="fa-solid fa-xmark"></i></button>
    </div>
</div>
