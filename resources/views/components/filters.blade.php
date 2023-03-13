<script src="{{ asset('js/filter.js') }}" defer></script>
<form method="POST" action="/">
    @csrf
    <div class="show-boxFilter">
        <p>Filter</p>
        <i class="fa-solid fa-filter"></i>
    </div>
    <div class="container-filter close">
        <div class="box-filter">
            <div class="header-filter">
                <p>Filter Product</p>
                <div class="closeFilter">
                    <i class="fa-solid fa-xmark xmark-cart"></i>
                </div>
            </div>
            <div class="filter">
                <p>Price</p>
                <div class="select-filter">
                    <div class="price-input">
                        <div class="field">
                            <input type="number" class="input-min" value="0">
                        </div>
                        <div class="separator">-</div>
                        <div class="field">
                            <input type="number" class="input-max" value="7500">
                        </div>
                    </div>
                    <div class="slider">
                        <div class="progress"></div>
                    </div>
                    <div class="range-input">
                        <input type="range" class="range-min" min="0" max="10000" value="0"
                            step="1">
                        <input type="range" class="range-max" min="0" max="10000" value="7500"
                            step="1">
                    </div>
                </div>
            </div>
            <div class="filter">
                <p>Brand</p>
                <div class="select-filter">
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Tiffany</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Swarovski</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Pandoras</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Orther</label>
                    </div>
                </div>
            </div>
            <div class="filter">
                <p>Color</p>
                <div class="select-filter">
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Purple</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">White</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Pink</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Blue</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Green</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Yellow</label>
                    </div>
                    <div class="option">
                        <input type="checkbox" name="" id="">
                        <label for="">Red</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
