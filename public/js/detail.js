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
