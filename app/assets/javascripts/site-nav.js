// sign in and sign up toggle
$('.sign-up-toggle').on('click', function() {
  $('.sign-up').toggleClass('show');
  $('#item-requested').text($('#request-bar').val());
});
