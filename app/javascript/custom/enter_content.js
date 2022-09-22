const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

var modal = $('.modal')
var btn_upload = $('.modal_icon');
var modal_upload = $('.modal-image');

btn_upload.onclick = () => {
    modal_upload.classList.toggle('modal-show');
    modal.classList.toggle('modal-top')
    console.log("Hello World!");
}

console.log("Hello");