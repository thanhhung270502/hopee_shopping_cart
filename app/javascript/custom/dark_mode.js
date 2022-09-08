const btn_moon = document.querySelector('.fa-moon');
const btn_sun = document.querySelector('.fa-sun');
const currentTheme = localStorage.getItem('theme');

if (currentTheme) {
    document.documentElement.setAttribute('data-theme', currentTheme);
    if (currentTheme === 'light') {
        btn_moon.classList.remove('dark-mode-active');
        btn_sun.classList.add('dark-mode-active');
    }
}

btn_moon.onclick = () => {
    btn_moon.classList.remove('dark-mode-active');
    btn_sun.classList.add('dark-mode-active');
    document.documentElement.setAttribute('data-theme', 'light');
    localStorage.setItem('theme', 'light');
}

btn_moon.onclick = () => {
    btn_moon.classList.remove('dark-mode-active');
    btn_sun.classList.add('dark-mode-active');
    document.documentElement.setAttribute('data-theme', 'light');
    localStorage.setItem('theme', 'light');
}