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

