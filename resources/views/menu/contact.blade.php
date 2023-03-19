@extends('layouts.app')
@section('main')
    <div class="container-contact">
        <div class="contact-text">
            <h2 class="title-product">GET IN TOUCH</h2>
            <p>
                <strong>Email</strong>
            </p>
            <p>nguyenminhthan1308@gmail.com</p>
            <p>
                <strong>Phone</strong>
            </p>
            <p>(+84)-902-518-533</p>
        </div>
        <div class="form-contact">
            <form action="https://formspree.io/f/xbjeajoa" method="POST">
                @csrf
                <h2 class="title-product">Contact Us</h2>
                <div class="input-text">
                    <div class="name-email">
                        <div class="name">
                            <label for="">Name</label>
                            <input type="text" name="name">
                        </div>
                        <div class="email">
                            <label for="">Email</label>
                            <input type="email" name="email">
                        </div>
                    </div>
                    <div class="phone">
                        <label for="">Phone</label>
                        <input type="number" name="phone">
                    </div>
                    <div class="message">
                        <label for="">Message</label>
                        <textarea name="mess" id="" cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div class="link">
                    <input type="submit" value="SEND" />
                </div>
            </form>
        </div>
    </div>
@endsection
