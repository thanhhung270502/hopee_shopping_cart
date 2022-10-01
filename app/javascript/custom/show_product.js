const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

// Click hide/show product_image
const image__large = $$('.image__large');

const image__small = $$('.image__small');

image__small[0].classList.add('image__active');
image__large[0].classList.add('image-large__active');

image__small.forEach((value, index) => {
    value.onclick = () => {
        image__small.forEach((v, i) => {
            image__small[i].classList.remove('image__active');
            image__large[i].classList.remove('image-large__active')
        })

        image__small[index].classList.add('image__active');
        image__large[index].classList.add('image-large__active')
    }
})

// Footer
const product__nav_item = $$('.product__nav_item');
const product_field__item = $$('.product-field__item');

var product__nav_item_0 = product__nav_item[0];
var product__nav_item_1 = product__nav_item[1];
var product__nav_item_2 = product__nav_item[2];

var product_field__item_0 = product_field__item[0];
var product_field__item_1 = product_field__item[1];
var product_field__item_2 = product_field__item[2];

product__nav_item.forEach((value, index) => {
    value.onclick = () => {
        product__nav_item.forEach((v, i) => {
            product__nav_item[i].classList.remove('product__nav_item-active');
            product_field__item[i].classList.remove('product-field__item-active')
        })

        product__nav_item[index].classList.add('product__nav_item-active');
        product_field__item[index].classList.add('product-field__item-active')
    }
})

// Size - Quantity Remain
var btn_quantity = $$('.btn_quantity');
var minus1 = btn_quantity[0];
var data1 = btn_quantity[1];
var add1 = btn_quantity[2];

const item__sizes = $$('.item__size');
const product__remains = $$('.product__remain');
var product__remain = $('.remain__active');

item__sizes.forEach((value, index) => {
    value.onclick = () => {
        product__remains.forEach((v, i) => {
            v.classList.remove('remain__active');
        })
        product__remains[index + 1].classList.add('remain__active')
        product__remain = product__remains[index + 1]

        if (parseInt(data1.value) > parseInt(product__remain.textContent)) {
            data1.value = product__remain.textContent;
        }

        console.log(product__remain);
    }
})

// Decrease/Increase quantity
minus1.onclick = () => {
    if (data1.value > 0) {
        data1.value--;
    }
}

add1.onclick = () => {
    if (parseInt(data1.value) < parseInt(product__remain.textContent)) {
        data1.value++;
    }
}

// 