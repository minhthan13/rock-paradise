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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
</head>

<body>
    <header role="banner" class="row fixed-top ">
        <h1>Rock Paradise Admin</h1>
        <ul class="utilities">
            <br>
            <li><a href="http://localhost:8000/">Homepage</a></li>
            <li class="logout warn"><a href="/">Log Out</a></li>
        </ul>
    </header>
    <nav role='navigation'>
        <ul class="main">
            <li class="dashboard"><a href="admindashboard">Dashboard</a></li>
            <li class="edit"><a href="#">Edit Website</a></li>
            <li class="write"><a href="#">Write news</a></li>
            <li class="comments"><a href="#">Ads</a></li>
            <li class="users"><a href="#">Manage Users</a></li>
        </ul>
        <i class="fa fa-bars open-nav"></i>
    </nav>
    <div class="container section">

        <main class="row d-flex ">
            @yield('admin-main')
        </main>
    </div>




</body>

</html>
