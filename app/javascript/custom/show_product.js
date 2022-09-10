// var btn_quantity = document.querySelectorAll('.btn_quantity');
// var minus = btn_quantity[0];
// var value = btn_quantity[1];
// var add = btn_quantity[2];

// console.log(btn_quantity);

// for (var i = 0; i <= btn_quantity.length - 3; i = i+3) {
//     var a = btn_quantity[i]
//     var b = btn_quantity[i+1]
//     // a.onclick = () => {
//     //     console.log("a: ", a);
//     //     var b = btn_quantity[i+1]
//     //     console.log("b: ", b);
//     //     b.value--;
//     // }
//     a.addEventListener("click", (e) => {
//         console.log("a: ", e.target);
//         console.log("b: ", b.value);
//         console.log("i: ", i);
//     })
//     console.log("Log: ", btn_quantity[i]);
// }

// for (var i = 2; i < btn_quantity.length; i = i+3) {
//     var a = btn_quantity[i]
//     a.onclick = () => {
//         console.log(a);
//         var b = btn_quantity[i - 1]
//         console.log(b);
//         b.value
//     }
// }

// add.onclick = () => {
//     value.value++;
// }

// minus.onclick = () => {
//     if (value.value > 0) {
//         value.value--;  
//     }
// }

var minus = document.querySelectorAll('.btn_quantity_1');
var data = document.querySelectorAll('.btn_quantity_2');
var add = document.querySelectorAll('.btn_quantity_3');

console.log(minus);

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
// var btn_quantity = document.querySelectorAll('.btn_quantity');
// var minus1 = btn_quantity[0];
// var data1 = btn_quantity[1];
// var add1 = btn_quantity[2];

// minus1.onclick = () => {
//     data1.value--;
// }

// minus1.addEventListener("click", () => {
//     data1.value--;
// })