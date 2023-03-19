@extends('layouts.app')
@section('main')
    <div class="giftcard">
        <div class="giftcard-img">
            <img src="https://cdn.shopify.com/s/files/1/1552/6795/products/Card_720x.jpg?v=1603661943" alt="">
        </div>
        <div class="giftcard-info">
            <div class="giftcard-title">
                <p>GIFT CARDS - GIFT CERTIFICATE</p>
            </div>
            <div class="giftcard-price-option">
                <p>Choose a gift amount</p>
                <div class="discount-buttons">
                    <button id="discount-10">$10</button>
                    <button id="discount-20">$20</button>
                    <button id="discount-30">$40</button>
                    <button id="discount-40">$50</button>
                    <button id="discount-50">$60</button>
                </div>

            </div>
            <div class="giftcard-delivery">
                <p>Choose a delivery method</p>
                <div class="delivery-option">
                    <input type="radio" name="choose" id="">
                    <label for="">Email to recipient</label>
                </div>
                <div class="delivery-option">
                    <input type="radio" name="choose" id="">
                    <label for="">Email to you (printable)</label>
                </div>
            </div>
            <div class="giftcard-send">
                <p>To</p>
                <input type="text" name="" id="" placeholder="Recipients's name">
                <input type="email" name="" id="" placeholder="Recipients's email">
                <textarea name="" id="" cols="30" rows="10" placeholder="Gift message (optional)"></textarea>
                <p>From</p>
                <input type="text" name="" id="" placeholder="Sender's Name">
                <div class="link">
                    <button type="submit">Add to cart</button>
                </div>
            </div>
        </div>
    </div>
@endsection
