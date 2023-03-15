<script src="{{ asset('js/filter.js') }}" defer></script>
@csrf
<div class="show-boxFilter">
    <i class="fa-solid fa-filter"></i>
</div>
<div class="container-filter close">

    <div class="box-filter">
        <div class="header-filter">
            <p>Filter Product</p>
            <div class="closeFilter" style="display:none">
                <i class="fa-solid fa-xmark xmark-cart"></i>
            </div>
        </div>
        <div class="filter">
            <p>Price</p>
            <div class="select-filter">
                <div class="price-input">
                    <div class="field">
                        <input type="number" name="price_min" class="input-min"
                            value="{{ request()->query('price_min') ? intval(request()->query('price_min')) : '1' }}">
                    </div>
                    <div class="separator">-</div>
                    <div class="field">
                        <input type="number" name="price_max" class="input-max"
                            value="{{ request()->query('price_min') ? intval(request()->query('price_max')) : '40000' }}">
                    </div>
                </div>
                <div class="slider">
                    <div class="progress"></div>
                </div>
                <div class="range-input">
                    <input type="range" class="range-min" min="1" max="40000"
                        value="{{ request()->query('price_min') ? intval(request()->query('price_min')) : '1' }}"
                        step="1">
                    <input type="range" class="range-max" min="1" max="40000"
                        value="{{ request()->query('price_max') ? intval(request()->query('price_max')) : '40000' }}"
                        step="1">
                </div>
            </div>
            <button id='find-price'>Find Price</button>
        </div>
        <div class="filter">
            <p>Rating</p>
            <div class="select-filter">
                <div class="option">
                    <input type="checkbox" name="rate[]" value="1"
                        {{ in_array('1', request()->input('rate', [])) ? 'checked' : '' }}>
                    <label for="">1 star</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="rate[]" value="2"
                        {{ in_array('2', request()->input('rate', [])) ? 'checked' : '' }}>
                    <label for="">2 star</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="rate[]" value="3"
                        {{ in_array('3', request()->input('rate', [])) ? 'checked' : '' }}>
                    <label for="">3 star</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="rate[]" value="4"
                        {{ in_array('4', request()->input('rate', [])) ? 'checked' : '' }}>
                    <label for="">4 star</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="rate[]" value="5"
                        {{ in_array('5', request()->input('rate', [])) ? 'checked' : '' }}>
                    <label for="">5 star</label>
                </div>
            </div>
        </div>
        <div class="filter">
            <p>Brand</p>
            <div class="select-filter">
                <div class="option">
                    <input type="checkbox" name="brands[]" value="Tiffany"
                        {{ in_array('Tiffany', request()->input('brands', [])) ? 'checked' : '' }}>
                    <label for="">Tiffany</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="brands[]" value="Swarovski"
                        {{ in_array('Swarovski', request()->input('brands', [])) ? 'checked' : '' }}>
                    <label for="">Swarovski</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="brands[]" value="pandora"
                        {{ in_array('pandora', request()->input('brands', [])) ? 'checked' : '' }}>
                    <label for="">Pandora</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="brands[]" value="Other"
                        {{ in_array('Other', request()->input('brands', [])) ? 'checked' : '' }}>
                    <label for="">Other</label>
                </div>
            </div>
        </div>
        <div class="filter">
            <p>Color</p>
            <div class="select-filter">
                <div class="option">
                    <input type="checkbox" name="color[]" value="Purple"
                        {{ in_array('Purple', request()->input('color', [])) ? 'checked' : '' }}>
                    <label for="">Purple</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="color[]" value="White"
                        {{ in_array('White', request()->input('color', [])) ? 'checked' : '' }}>

                    <label for="">White</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="color[]" value="Pink"
                        {{ in_array('Pink', request()->input('color', [])) ? 'checked' : '' }}>
                    <label for="">Pink</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="color[]" value="Blue"
                        {{ in_array('Blue', request()->input('color', [])) ? 'checked' : '' }}>
                    <label for="">Blue</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="color[]" value="Green"
                        {{ in_array('Green', request()->input('color', [])) ? 'checked' : '' }}>
                    <label for="">Green</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="color[]" value="Yellow"
                        {{ in_array('Yellow', request()->input('color', [])) ? 'checked' : '' }}>
                    <label for="">Yellow</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="color[]" value="Red"
                        {{ in_array('Red', request()->input('color', [])) ? 'checked' : '' }}>
                    <label for="">Red</label>
                </div>
            </div>
        </div>
        <div class="filter">
            <p>Size</p>
            <div class="select-filter">
                <div class="option">
                    <input type="checkbox" name="size[]" value="small"
                        {{ in_array('small', request()->input('size', [])) ? 'checked' : '' }}>
                    <label for="">Small</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="size[]" value="middle"
                        {{ in_array('middle', request()->input('size', [])) ? 'checked' : '' }}>
                    <label for="">Middle</label>
                </div>
                <div class="option">
                    <input type="checkbox" name="size[]" value="big"
                        {{ in_array('big', request()->input('size', [])) ? 'checked' : '' }}>
                    <label for="">Big</label>
                </div>
            </div>
        </div>
        <hr>
        <button class="filter-reset">Reset</button>
    </div>

</div>
