const $ = document.querySelector.bind(document);

var modal = $('.modal_')
var btn_upload = $('.modal_icon');
var modal_upload = $('.modal-image');

btn_upload.onclick = () => {
    modal_upload.classList.toggle('modal-show');
    console.log(modal);
    modal.classList.toggle('modal-top')
    console.log("Hello World!");
}