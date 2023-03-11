@extends('layouts.app')
@section('main')
    <div class="container-contact">
        <div class="contact-text">
            <h2 class="title-product">GET IN TOUCH</h2>
            <p>
                <strong>Email</strong>
            </p>
            <p>sales@rockparadise.com</p>
            <p>
                <strong>Phone</strong>
            </p>
            <p>866-364-9777</p>
        </div>
        <div class="form-contact">
            <form action="">
                <h2 class="title-product">Contact Us</h2>
                <div class="input-text">
                        <div class="name-email">
                            <div class="name">
                                <label for="">Name</label>
                                <input type="text">
                            </div>
                            <div class="email">
                                <label for="">Email</label>
                                <input type="email">
                            </div>
                        </div>
                        <div class="phone">
                            <label for="">Phone</label>
                            <input type="number" name="" id="">
                        </div>
                        <div class="message">
                            <label for="">Message</label>
                            <textarea name="" id="" cols="30" rows="10"></textarea>
                        </div>
                </div>
                <div class="btn">
                    <button type="submit">SEND</button>
                </div>
            </form>
        </div>
    </div>
@endsection
