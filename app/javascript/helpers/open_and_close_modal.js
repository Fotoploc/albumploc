const openModal = document.querySelector('.modal__open')
const closeModal = document.querySelector('.modal__close')
const modal = document.querySelector('.modal')

openModal.addEventListener('click', function() {
  modal.classList.remove('modal--hidden');
});

closeModal.addEventListener('click', function() {
  modal.classList.add('modal--hidden');
});
