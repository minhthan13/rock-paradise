<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible">
    <title>Rock Paraside</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/products.css') }}">
    <link rel="stylesheet" href="{{ asset('css/detail.css') }}">
    <link rel="stylesheet" href="{{ asset('css/about.css') }}">
    <link rel="stylesheet" href="{{ asset('css/contact.css') }}">
    <link rel="stylesheet" href="{{ asset('css/faq.css') }}">
    <link rel="stylesheet" href="{{ asset('css/filters.css') }}">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>

    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="{{ asset('js/faq.js') }}" defer></script>
</head>

<body>
    <header>
        @include('layouts.header')
    </header>
    <div>
        @yield('main')
    </div>
    <footer>
        @include('layouts.footer')
    </footer>
    <button id="scrollToTopBtn">
        <i class="fa-solid fa-arrow-up"></i>
    </button>
</body>

</html>
