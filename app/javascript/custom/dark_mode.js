const btn_mode = document.querySelectorAll('.dropdown_mode');
const btn_moon = btn_mode[0];
const btn_sun = btn_mode[1];
const currentTheme = localStorage.getItem('theme');

if (currentTheme) {
    document.documentElement.setAttribute('data-theme', currentTheme);

    if (currentTheme === 'dark') {
        btn_moon.classList.remove('dark_mode_active');
        btn_sun.classList.add('dark_mode_active');
    }
}

btn_moon.onclick = () => {
    btn_moon.classList.remove('dark_mode_active');
    btn_sun.classList.add('dark_mode_active');

    console.log("Hello World!");

    document.documentElement.setAttribute('data-theme', 'dark');
    localStorage.setItem('theme', 'dark');
}

btn_sun.onclick = () => {
    btn_sun.classList.remove('dark_mode_active');
    btn_moon.classList.add('dark_mode_active');

    document.documentElement.setAttribute('data-theme', 'light');
    localStorage.setItem('theme', 'light');
}