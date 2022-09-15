const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const image__large = $$('.image__large');
const image__large_1 = image__large[0];
const image__large_2 = image__large[1];
const image__large_3 = image__large[2];

const image__small = $$('.image__small');
const image__small_1 = image__small[0];
const image__small_2 = image__small[1];
const image__small_3 = image__small[2];

image__small_1.classList.add('image__active');
image__large_1.classList.add('image-large__active');

image__small_1.onclick = () => {
    if (!image__small_1.classList.contains('image__active')) {
        image__small_1.classList.add('image__active');
        image__large_1.classList.add('image-large__active');

        image__small_2.classList.remove('image__active');
        image__small_3.classList.remove('image__active');

        image__large_2.classList.remove('image-large__active');
        image__large_3.classList.remove('image-large__active');
    }
}

image__small_2.onclick = () => {
    if (!image__small_2.classList.contains('image__active')) {
        image__small_2.classList.add('image__active');
        image__large_2.classList.add('image-large__active');

        image__small_1.classList.remove('image__active');
        image__small_3.classList.remove('image__active');

        image__large_1.classList.remove('image-large__active');
        image__large_3.classList.remove('image-large__active');
    }
}

image__small_3.onclick = () => {
    if (!image__small_3.classList.contains('image__active')) {
        image__small_3.classList.add('image__active');
        image__large_3.classList.add('image-large__active');

        image__small_2.classList.remove('image__active');
        image__small_1.classList.remove('image__active');

        image__large_2.classList.remove('image-large__active');
        image__large_1.classList.remove('image-large__active');
    }
}


// Footer
const product__nav_item = $$('.product__nav_item');
const product_field__item = $$('.product-field__item');

console.log(product__nav_item);
console.log(product_field__item);

var product__nav_item_0 = product__nav_item[0];
var product__nav_item_1 = product__nav_item[1];
var product__nav_item_2 = product__nav_item[2];

var product_field__item_0 = product_field__item[0];
var product_field__item_1 = product_field__item[1];
var product_field__item_2 = product_field__item[2];

product__nav_item_0.onclick = () => {
    product__nav_item_0.classList.add('product__nav_item-active');
    product_field__item_0.classList.add('product-field__item-active');
    
    product__nav_item_1.classList.remove('product__nav_item-active');
    product_field__item_1.classList.remove('product-field__item-active');
    
    product__nav_item_2.classList.remove('product__nav_item-active');
    product_field__item_2.classList.remove('product-field__item-active');
}

product__nav_item_1.onclick = () => {
    product__nav_item_1.classList.add('product__nav_item-active');
    product_field__item_1.classList.add('product-field__item-active');
    
    product__nav_item_0.classList.remove('product__nav_item-active');
    product_field__item_0.classList.remove('product-field__item-active');
    
    product__nav_item_2.classList.remove('product__nav_item-active');
    product_field__item_2.classList.remove('product-field__item-active');
}

product__nav_item_2.onclick = () => {
    product__nav_item_2.classList.add('product__nav_item-active');
    product_field__item_2.classList.add('product-field__item-active');
    
    product__nav_item_1.classList.remove('product__nav_item-active');
    product_field__item_1.classList.remove('product-field__item-active');
    
    product__nav_item_0.classList.remove('product__nav_item-active');
    product_field__item_0.classList.remove('product-field__item-active');
}

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


minus1.onclick = () => {
    if (data1.value > 0) {
        data1.value--;
    }
}

add1.onclick = () => {
    if (parseInt(data1.value) < parseInt(product__remain.textContent)) {
        data1.value++;
        console.log(data1.value);
    }
}
