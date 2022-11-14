
document.querySelector('.modal__open').addEventListener('click', function() {
  document.querySelector('.modal').classList.remove('modal--hidden');
});
document.querySelector('.modal__close').addEventListener('click', function() {
  document.querySelector('.modal').classList.add('modal--hidden');
});
