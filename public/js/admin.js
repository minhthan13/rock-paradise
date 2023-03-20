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
let proIDField = document.getElementById("proID");
let titleField = document.getElementById("title");
let priceField = document.getElementById("price");
let cateField = document.getElementById("cate");
let styleField = document.getElementById("style");
let typeField = document.getElementById("type");
let coloField = document.getElementById("color");
let fileField = document.getElementById("imageUP");

let confirmProID = document.getElementById("confirm-proID");
let confirmTitle = document.getElementById("confirm-title");
let confirmPrice = document.getElementById("confirm-price");
let confirmStyle = document.getElementById("confirm-style");
let confirmType = document.getElementById("confirm-type");
let confirmColor = document.getElementById("confirm-color");
let confirmCate = document.getElementById("confirm-cate");
let confirmIMG = document.getElementById("confirm-imageUP");

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
        let numFiles = fileField.files.length;
        confirmIMG.innerText = `${numFiles} File${numFiles !== 1 ? "s" : ""}`;
    });
