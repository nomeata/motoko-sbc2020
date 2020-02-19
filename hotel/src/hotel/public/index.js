import hotel from 'ic:canisters/hotel';

hotel.greet(window.prompt("Enter your name:")).then(greeting => {
  window.alert(greeting);
});
