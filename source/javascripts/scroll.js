window.addEventListener("scroll", () => {
  const fadeElement = document.getElementById("navbarLogo");
  const scrollPosition = window.scrollY;
  const windowHeight = window.innerHeight;

  // Calcule l'opacité en fonction du scroll
  const opacity = Math.min(scrollPosition / windowHeight, 1);

  // Applique l'opacité à l'élément
  fadeElement.style.opacity = opacity;
});
