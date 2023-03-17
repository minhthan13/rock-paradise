@extends('admin.index')
@section('admin-main')
    <div class="row d-flex justify-content-center">
        <div class="col-md-8 ">
            <h2 class="text-center pt-3 fs-1 mb-3">User Manager</h2>
            <table class="table table-bordered align-middle text-center mt-4">
                <tr class="align-middle table-primary">
                    <th>ID</th>
                    <th>Username</th>
                    <th>Nickname</th>
                </tr>
                @foreach ($user as $u)
                    <tr>
                        <td>{{ $u->user_id }}</td>
                        <td>{{ $u->user_name }}</td>
                        <td>{{ $u->nick_name }}</td>

                    </tr>
                @endforeach

            </table>
        </div>
    </div>
@endsection
