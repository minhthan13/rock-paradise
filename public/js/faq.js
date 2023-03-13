const showQuestion = document.querySelectorAll(".main-question");
const moreQuestion = document.querySelectorAll(".more-question");

showQuestion.forEach((item, index) => {
    item.addEventListener("click", () => {
        moreQuestion[index].classList.toggle("block");
    });
});
