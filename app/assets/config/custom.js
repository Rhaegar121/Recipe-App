document.addEventListener('turbo:load', function() {
  const hamburger = document.querySelector('.hamburger');
  const mobileMenu = document.querySelector('.nav-link');
  
  hamburger.onclick = () => {
    hamburger.classList.toggle('open');
    mobileMenu.classList.toggle('height');
  };
});