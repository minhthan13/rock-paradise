<link rel="stylesheet" href="{{ asset('css/admin/login.css') }}">
<div class="container">
    <div class="logo">ROCK PARADISE</div>
    <div class="login-item">
        <form action="{{ route('admin.dashboard') }}" method="post" class="form form-login">
            @csrf
            <div class="form-field">
                <label class="user" for="login-username"><span class="hidden">Username</span></label>
                <input id="login-username" name='user' type="text" class="form-input" placeholder="Username">
            </div>
            @if ($errors->has('user'))
                <div class="alert">{{ $errors->first('user') }}</div>
            @endif

            <div class="form-field">
                <label class="lock" for="login-password"><span class="hidden">Password</span></label>
                <input id="login-password" name="password" type="password" class="form-input" placeholder="Password">
            </div>
            @if ($errors->has('password'))
                <div class="alert">{{ $errors->first('password') }}</div>
            @endif

            <div class="form-field">
                <input type="submit" value="Log in">
            </div>
        </form>

    </div>
    @if (Session::has('error'))
        <div class="alert">{{ Session::get('error') }}</div>
    @endif

</div>
