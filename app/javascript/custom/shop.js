var nav_menu = document.querySelector('.shop__menu');

window.onscroll = () => {
    if (document.body.scrollTop > 460 || document.documentElement.scrollTop > 460) { 
        nav_menu.classList.add('fixed-top');
    }
    else {
        nav_menu.classList.remove('fixed-top');
    }
}