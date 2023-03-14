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

// Tính toán số lượng sao và nửa ngôi sao cần được hiển thị dựa trên số sao trung bình
// let starsElement = document.querySelector(".present-rating");
// let averageRating = 5; // Thay đổi giá trị thành số lượng sao mong muốn
// for (let i = 1; i <= averageRating; i++) {
//     let starNode = document.createElement('i');
//     starNode.className = 'fas fa-star selected';
//     starsElement.appendChild(starNode);
// }

let starsElement = document.querySelector(".present-rating");
let averageRating = 4.2;
let fullStars = Math.floor(averageRating);
let hasHalfStar = averageRating - fullStars != 0;

for (let i = 0; i < fullStars; i++) {
    let fullStarElement = document.createElement("i");
    fullStarElement.classList.add("fas", "fa-star", "selected");
    starsElement.appendChild(fullStarElement);
}

if (hasHalfStar) {
    let halfStarElement = document.createElement("i");
    halfStarElement.classList.add("fas", "fa-star-half-alt", "selected");
    starsElement.appendChild(halfStarElement);
}
// const presentRating = document.querySelector(".present-rating");
// console.log(presentRating);


let showRating = document.querySelector(".btn-rating");
let formRating = document.querySelector(".container-rating");
let boxRating = document.querySelector(".box-rating");

showRating.addEventListener("click",()=>{
    formRating.classList.remove("close");
    formRating.classList.add("block");
});

formRating.addEventListener("click",()=>{
    formRating.classList.remove("block");
    formRating.classList.add("close");
});

boxRating.addEventListener("click",(e)=>{
    e.stopPropagation();
})