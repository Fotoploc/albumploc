// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


import Swiper, { Navigation, Pagination } from 'swiper';

// init Swiper:
const swiper = new Swiper('.swiper', {
  // configure Swiper to use modules
  modules: [Navigation, Pagination],

});

function openModal(obj) {
  const modal = obj.target.nextSibling;
  modal.classList.toggle("active")
}

function closeModal(obj) {
  const element = obj.target
  const closest = element.closest(".modal")

  closest.classList.toggle("active")
}


window.openModal = openModal
window.closeModal = closeModal