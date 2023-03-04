// header
function search() {
    var search = document.querySelector(".container-search");
    search.classList.add("block");
    search.classList.remove("close");
}
function Close() {
    var close = document.querySelector(".container-search");
    close.classList.remove("block");
    close.classList.add("close");
}
// body
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides((slideIndex += n));
}

function currentSlide(n) {
    showSlides((slideIndex = n));
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("mySlides");
    if (n > slides.length) {
        slideIndex = 1;
    }
    if (n < 1) {
        slideIndex = slides.length;
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex - 1].style.display = "block";
}
showSlides(slideIndex);
setInterval(function () {
    slideIndex++;
    showSlides(slideIndex);
}, 3000);

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
