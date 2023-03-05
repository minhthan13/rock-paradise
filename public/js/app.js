// header
// header
var model = document.querySelector(".container-search");
var searchForm = document.querySelector(".search");

var iconSearch = document.querySelector(".fa-magnifying-glass");
iconSearch.addEventListener("click", search);

var iconClose = document.querySelector(".closeModel");
iconClose.addEventListener("click", Close);
function search() {
    model.classList.add("block");
    model.classList.remove("close");
}
function Close() {
    model.classList.remove("block");
    model.classList.add("close");
}
model.addEventListener("click", Close);
searchForm.addEventListener("click", function (event) {
    event.stopPropagation();
});

var iconBag = document.querySelector(".fa-bag-shopping");
var containerCart = document.querySelector(".container-cart");
var cartBox = document.querySelector(".cart-box");
var iconClose = document.querySelector(".xmark-cart");
iconClose.addEventListener("click", Close1);
iconBag.addEventListener("click", search1);
function search1() {
    containerCart.classList.add("block");
    containerCart.classList.remove("close");
}
function Close1() {
    containerCart.classList.remove("block");
    containerCart.classList.add("close");
}
containerCart.addEventListener("click", Close1);
cartBox.addEventListener("click", function (event) {
    event.stopPropagation();
});
// body

//  Star Rating
const stars = document.querySelectorAll(".star");
// Thêm các sự kiện vào từng ngôi sao
stars.forEach((star, index) => {
    star.addEventListener("click", () => {
        // Thay đổi màu của các ngôi sao đã chọn
        for (let i = 0; i <= index; i++) {
            stars[i].classList.add("selected");
        }
        // Xóa màu của các ngôi sao chưa chọn
        for (let i = index + 1; i < stars.length; i++) {
            stars[i].classList.remove("selected");
        }
    });
    star.addEventListener("mouseover", () => {
        // Thêm màu cho các ngôi sao khi rê chuột qua
        for (let i = 0; i <= index; i++) {
            stars[i].classList.add("hover");
        }
    });
    star.addEventListener("mouseout", () => {
        // Xóa màu của các ngôi sao khi rời chuột
        for (let i = 0; i <= index; i++) {
            stars[i].classList.remove("hover");
        }
    });
});

/* Scroll To Top */

var scrollToTopBtn = document.getElementById("scrollToTopBtn");

window.addEventListener("scroll", function () {
    if (window.pageYOffset > 100) {
        scrollToTopBtn.style.display = "block";
    } else {
        scrollToTopBtn.style.display = "none";
    }
});

scrollToTopBtn.addEventListener("click", function () {
    window.scrollTo({
        top: 0,
        behavior: "smooth",
    });
});
