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

// window.addEventListener("resize", slideImage);

// Lấy phần tử sao từ HTML
let starsElement = document.querySelector('.product-rating');

// Tính toán số lượng sao và nửa ngôi sao cần được hiển thị dựa trên số sao trung bình
let averageRating = 4.5;
let fullStars = Math.floor(averageRating);
let hasHalfStar = (averageRating - fullStars) >= 0.5;

// Tạo HTML để hiển thị số sao và nửa ngôi sao
let starsHTML = '';
for (let i = 0; i < fullStars; i++) {
  starsHTML += '<span class="star selected"><i class="fa-solid fa-star"></i></span>';
}
if (hasHalfStar) {
  starsHTML += '<span class="star selected"><i class="fa-solid fa-star-half-alt"></i></span>';
}   
starsElement.innerHTML = starsHTML;

