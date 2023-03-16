const imgs = document.querySelectorAll(".img-select a");
const imgBtns = [...imgs];
let imgId = 1;

imgBtns.forEach((imgItem) => {
    imgItem.addEventListener("click", (event) => {
        event.preventDefault();
        imgId = imgItem.dataset.id;
        slideImage();
    });
});

function slideImage() {
    const displayWidth = document.querySelector(
        ".img-showcase img:first-child"
    ).clientWidth;

    document.querySelector(".img-showcase").style.transform = `translateX(${
        -(imgId - 1) * displayWidth
    }px)`;
}

let showRating = document.querySelector(".btn-rating");
let formRating = document.querySelector(".container-rating");
let boxRating = document.querySelector(".box-rating");

showRating.addEventListener("click", () => {
    formRating.classList.remove("close");
    formRating.classList.add("block");
});

formRating.addEventListener("click", () => {
    formRating.classList.remove("block");
    formRating.classList.add("close");
});

boxRating.addEventListener("click", (e) => {
    e.stopPropagation();
});

//  Star Rating
const stars = document.querySelectorAll(".star");
const newStars = [...stars];
const five = 5;
// Thêm các sự kiện vào từng ngôi sao
newStars.forEach((star, index) => {
    let num = Math.floor(index / five);
    star.addEventListener("click", () => {
        // Thay đổi màu của các ngôi sao đã chọn
        for (let i = five * num; i <= index; i++) {
            stars[i].classList.add("selected");
        }
        // Xóa màu của các ngôi sao chưa chọn
        for (let i = five * (num + 1) - 1; i > index; i--) {
            stars[i].classList.remove("selected");
        }
    });

    star.addEventListener("mouseover", () => {
        // Thêm màu cho các ngôi sao khi rê chuột qua
        for (let i = five * num; i <= index; i++) {
            stars[i].classList.add("hover");
        }
    });
    star.addEventListener("mouseout", () => {
        // Xóa màu của các ngôi sao khi rời chuột
        for (let i = num; i <= index; i++) {
            stars[i].classList.remove("hover");
        }
    });
});
stars.forEach(function (star) {
    star.addEventListener("click", function () {
        let value = this.querySelector("i").getAttribute("data-value");
        let input = document.querySelector('input[name="star"]');

        input.value = value;

        stars.forEach(function (s) {
            s.querySelector("i").classList.remove("star-active");
            if (s.querySelector("i").getAttribute("data-value") <= value) {
                s.querySelector("i").classList.add("star-active");
            }
        });
    });
});
