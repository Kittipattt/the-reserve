// app/assets/javascripts/application.js

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
document.addEventListener('DOMContentLoaded', function () {
    if (document.querySelector('[data-flash-message]')) {
      openModal();
      setTimeout(closeModal, 2000);  // Close the modal after 2 seconds (2000 milliseconds)
    }
  });
  
  function openModal() {
    document.getElementById('loginModal').classList.remove('hidden');
  }
  
  function closeModal() {
    document.getElementById('loginModal').classList.add('hidden');
  }
  
  