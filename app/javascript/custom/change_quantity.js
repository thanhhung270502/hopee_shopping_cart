const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

var minus = $$('.btn_quantity_1');
var data = $$('.btn_quantity_2');
var add = $$('.btn_quantity_3');

const product__remain = $('.remain__active');

minus.forEach((value, index) => {
    // value.addEventListener("click", () => {
    //     data[index].value--;
    //     console.log("data: ", data[index].value);
    // })
    value.onclick = () => {
        if (data[index].value > 0) {
            data[index].value--;
        }
    }
})

add.forEach((value, index) => {
    // value.addEventListener("click", () => {
    //     data[index].value--;
    //     console.log("data: ", data[index].value);
    // })
    value.onclick = () => {
        data[index].value++;
    }
})

var btn_quantity = $$('.btn_quantity');
var minus1 = btn_quantity[0];
var data1 = btn_quantity[1];
var add1 = btn_quantity[2];

minus1.onclick = () => {
    if (data1.value > 0) {
        data1.value--;
    }
}

add1.onclick = () => {
    data1.value++;
}


