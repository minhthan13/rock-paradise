//pop-up
const showModel = document.querySelector(".show-boxFilter");
const modelBox = document.querySelector(".container-filter");
const boxFilter = document.querySelector(".box-filter");
const closeFilter = document.querySelector(".closeFilter");
showModel.addEventListener("click", () => {
    modelBox.classList.remove("close");
    modelBox.classList.add("block");
});

closeFilter.addEventListener("click", () => {
    modelBox.classList.add("close");
    modelBox.classList.remove("block");
});

modelBox.addEventListener("click", () => {
    modelBox.classList.add("close");
    modelBox.classList.remove("block");
});
boxFilter.addEventListener("click", function (event) {
    event.stopPropagation();
});

// xử lý tương tác price-range
const priceInput = document.querySelector(".price-input");
const rangeMin = document.querySelector(".range-min");
const rangeMax = document.querySelector(".range-max");
const inputMin = document.querySelector(".input-min");
const inputMax = document.querySelector(".input-max");
let oldMin, oldMax;

function updateRange() {
    let min = parseInt(inputMin.value);
    let max = parseInt(inputMax.value);
    if (max <= min) {
        max = min + 1;
        rangeMax.value = max;
    }
    // Check if min is greater than max
    if (min >= max) {
        rangeMin.value = oldMin;
        return;
    }
    oldMin = rangeMin.value;
    rangeMin.value = min;
    oldMax = rangeMax.value;
    rangeMax.value = max;
    updateSlider();
}

function updateField() {
    let min = parseInt(rangeMin.value);
    let max = parseInt(rangeMax.value);

    if (max <= min) {
        rangeMax.value = oldMax;
        return;
    }
    // Check if min is greater than max
    if (min >= max) {
        rangeMax.value = oldMax;
        inputMin.value = oldMin;
        return;
    }

    oldMin = inputMin.value;
    oldMax = rangeMax.value;
    inputMin.value = min;
    inputMax.value = max;
    updateSlider();
}

function updateSlider() {
    const min = parseInt(rangeMin.value);
    const max = parseInt(rangeMax.value);
    if (min === parseInt(rangeMin.max) && max === parseInt(rangeMax.max)) {
        return;
    }

    if (max <= min) {
        rangeMax.value = min + 1;
        return;
    }
    const range = parseInt(rangeMax.max) - parseInt(rangeMin.min);
    const progress = (max - min) / range;

    const slider = document.querySelector(".slider");
    const progressBar = document.querySelector(".progress");

    progressBar.style.left = (min / range) * 100 + "%";
    progressBar.style.right = ((rangeMax.max - max) / range) * 100 + "%";
    progressBar.style.width = progress * 100 + "%";
}
inputMin.addEventListener("input", updateRange);
inputMax.addEventListener("input", updateRange);
rangeMin.addEventListener("input", checkValueAndUpdate);
rangeMax.addEventListener("input", checkValueAndUpdate);
function checkValueAndUpdate() {
    const min = parseInt(rangeMin.value);
    const max = parseInt(rangeMax.value);

    // kiểm tra giá trị range-min, nếu như value của nó < min
    if (this === rangeMin && this.value < min) {
        this.value = min;
        return;
    }
    // kiểm tra giá trị range-max, nếu như value của nó > max
    if (this === rangeMax && this.value > max) {
        this.value = max;
        return;
    }
    // kiểm tra giá trị range-min, nếu như value của nó > max - 1
    if (this === rangeMin && this.value > max - 1) {
        this.value = max - 1;
        return;
    }

    // kiểm tra giá trị range-max, nếu như value của nó < min + 1
    if (this === rangeMax && this.value < min + 1) {
        this.value = min + 1;
        return;
    }
    updateField();
    updateSlider();
}

[inputMin, inputMax].forEach((el) => {
    el.addEventListener("focus", () => {
        el.value = "";
    });
    el.addEventListener("blur", () => {
        el.value = el.name === "price_min" ? rangeMin.value : rangeMax.value;
    });
});

oldMin = rangeMin.value;
oldMax = rangeMax.value;
updateSlider();

// xử lý sự kiện của filter
const findPrice = document.querySelector("#find-price");
const checkboxes = document.querySelectorAll("input[type=checkbox]");
const filterForm = document.querySelector("#form-filter");

findPrice.addEventListener("click", (event) => {
    event.preventDefault();
    filterForm.submit();
});
checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("change", () => {
        filterForm.submit();
    });
});
const resetButton = document.querySelector(".filter-reset");
resetButton.addEventListener("click", () => {
    checkboxes.forEach((checkboxes) => (checkboxes.checked = false));
    inputMin.value = 0;
    filterForm.submit();
});
