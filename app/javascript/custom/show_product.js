var btn_quantity = document.querySelectorAll('.btn_quantity');
var minus = btn_quantity[0];
var value = btn_quantity[1];
var add = btn_quantity[2];

add.onclick = () => {
    value.value++;
}

minus.onclick = () => {
    if (value.value > 0) {
        value.value--;  
    }
}