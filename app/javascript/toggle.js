// Obtén una referencia al div toggleBtn y al body
const toggleBtn = document.querySelector('.toggleBtn');
const body = document.body;

// Verificar el estado del modo oscuro almacenado
const isDarkMode = localStorage.getItem('darkMode') === 'true';

// Establecer el estado inicial del modo oscuro
if (isDarkMode) {
  body.classList.add('dark-mode');
}

// Agrega un event listener al div toggleBtn
toggleBtn.addEventListener('click', function() {
  // Alternar la clase 'dark-mode' en el body
  body.classList.toggle('dark-mode');

  // Guardar el estado del modo oscuro
  const currentMode = body.classList.contains('dark-mode');
  localStorage.setItem('darkMode', currentMode.toString());
});

// Aplicar el estado del modo oscuro cuando se carga una nueva página
document.addEventListener('DOMContentLoaded', function() {
  const isDarkMode = localStorage.getItem('darkMode') === 'true';

  if (isDarkMode) {
    body.classList.add('dark-mode');
  }
});


