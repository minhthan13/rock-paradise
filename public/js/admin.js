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

//  box confirm add product
const proIDField = document.getElementById("proID");
const titleField = document.getElementById("title");
const priceField = document.getElementById("price");
const cateField = document.getElementById("cate");
const styleField = document.getElementById("style");
const typeField = document.getElementById("type");
const coloField = document.getElementById("color");

const confirmProID = document.getElementById("confirm-proID");
const confirmTitle = document.getElementById("confirm-title");
const confirmPrice = document.getElementById("confirm-price");
const confirmStyle = document.getElementById("confirm-style");
const confirmType = document.getElementById("confirm-type");
const confirmColor = document.getElementById("confirm-color");
const confirmCate = document.getElementById("confirm-cate");

document
    .querySelector('[data-bs-target="#BoxConfirm"]')
    .addEventListener("click", () => {
        confirmProID.innerText = proIDField.value;
        confirmTitle.innerText = titleField.value;
        confirmPrice.innerText = `$${priceField.value}.00`;
        confirmCate.innerText = cateField.options[cate.selectedIndex].text;
        confirmStyle.innerText = styleField.value;
        confirmType.innerText = typeField.value;
        confirmColor.innerText = coloField.value;
    });
