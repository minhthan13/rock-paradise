const buttons = document.querySelectorAll('.discount-buttons button');

buttons.forEach(button => {
  button.addEventListener('click', () => {
    buttons.forEach(otherButton => {
      otherButton.classList.remove('btn-active');
    });
    button.classList.add('btn-active');
  });
});
