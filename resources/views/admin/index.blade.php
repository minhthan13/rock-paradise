<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dashboard</title>
    <link rel="stylesheet" href="{{ asset('css/admin/index.css') }}">
    <link rel="stylesheet" href="{{ asset('css/panigation.css') }}">


    <script src="{{ asset('js/admin.js') }}" defer></script>
    <script src="{{ asset('js/dashboard.js') }}" defer></script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
</head>

<body>
    <header role="banner" class="row fixed-top ">
        <h1>Rock Paradise Admin</h1>
        <ul class="utilities">
            <br>
            <li><a href="{{ url('/') }}">Homepage</a></li>
            <li class="logout warn"><a href="/">Log Out</a></li>
        </ul>
    </header>
    <nav role='navigation'>
        <ul class="main">
            <li class="dashboard"><a href="dashboard">Dashboard</a></li>
            <li class="category"><a href="{{ route('admin.cate') }}">Category</a></li>
            <li class="image"><a href="{{ route('admin.img') }}">Images</a></li>
            <li class="users"><a href="{{ route('admin.listUser') }}">Manage Users</a></li>
        </ul>
        <i class="fa fa-bars open-nav"></i>
    </nav>
    <div class="container section">

        <main class="row d-flex ">
            <i class="fa-light fa-screwdriver-wrench fs-1"></i>
            <div class="text-end"><i class="fa fa-user"></i> : {{ session('user')->user_name ?? '' }}</div>
            @yield('admin-main')
        </main>
    </div>




</body>

</html>
