function openModal() {
  let openModal = document.querySelector('.modal__open')
  let closeModal = document.querySelector('.modal__close')
  let modal = document.querySelector('.modal')

  openModal.addEventListener('click', function() {
    modal.classList.remove('modal--hidden');
  });

  closeModal.addEventListener('click', function() {
    modal.classList.add('modal--hidden');
  });
}
openModal();

