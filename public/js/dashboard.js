// delete product
let modal = document.querySelector("#exampleModal");
modal.addEventListener("show.bs.modal", function (event) {
    let button = event.relatedTarget;
    let productName = button.dataset.proname;
    let productid = button.getAttribute("data-proid");
    console.log(productid);
    // Chuyển giá trị vừa lấy vào trong Modal
    let modalBody = modal.querySelector(".modal-body p span.productName");
    modalBody.textContent = productName;
    // lấy thẻ a và thêm đường dẫn router
    let deleteButton = modal.querySelector(".modal-footer a");
    deleteButton.href = "/admin/delete/" + productid;
});
