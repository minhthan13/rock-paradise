// header
var model = document.querySelector(".container-search");
var searchForm = document.querySelector(".search");

var iconSearch = document.querySelector(".fa-magnifying-glass");
iconSearch.addEventListener("click", search);

var iconClose1 = document.querySelector(".closeModel");
iconClose1.addEventListener("click", Close);
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
var iconClose2 = document.querySelector(".xmark-cart");
iconClose2.addEventListener("click", Close1);
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

// Responsive Menu
var showMenu = document.querySelector("i.fa-bars");
var menuResponsive = document.querySelector(".menu-navbar");

showMenu.addEventListener("click", () => {
    menuResponsive.classList.toggle("block");
});
var showSubMenu = document.querySelector("li.has-child");
var subMenuResponse = document.querySelector(".sub-menu");
showSubMenu.addEventListener("click", () => {
    subMenuResponse.classList.toggle("block");
});

// body
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


let starsElement = document.querySelectorAll(".present-rating");
// let newStarsElement =Array.from(starsElement);;
// console.log(newStarsElement)
    starsElement.forEach((item)=>{
        console.log(item);

        let averageRating = Math.floor(Math.random()*5);
        let fullStars = Math.floor(averageRating);
        let hasHalfStar = averageRating - fullStars != 0;

for (let i = 0; i < fullStars; i++) {
    let fullStarElement = document.createElement("i");
    fullStarElement.classList.add("fas", "fa-star", "selected");
    item.appendChild(fullStarElement);
}

if (hasHalfStar) {
    let halfStarElement = document.createElement("i");
    halfStarElement.classList.add("fas", "fa-star-half-alt", "selected");
    item.appendChild(halfStarElement);
}
})


