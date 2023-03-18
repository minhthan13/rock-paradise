// index
const openNavButton = document.querySelector(".open-nav");

const navElement = document.querySelector("nav[role='navigation']");

openNavButton.addEventListener("click", function () {
    navElement.classList.toggle("open");
    openNavButton.style.display = "none";
});
document.addEventListener("click", function (event) {
    if (
        !event.target.closest('nav[role="navigation"]') &&
        navElement.classList.contains("open")
    ) {
        navElement.classList.remove("open");
        setTimeout(function () {
            openNavButton.style.display = "block";
        }, 500);
    }
});
// short content
let shortens = document.querySelectorAll(".shorten");
let limit = 40;

for (var i = 0; i < shortens.length; i++) {
    let shorten = shortens[i];
    let text = shorten.textContent.trim();
    if (text.length > limit) {
        let abstract = text.slice(0, limit) + "...";
        shorten.textContent = abstract;
    }
}
window.onload = function () {
    CKEDITOR.replace("des");
};
