// sign in and sign up toggle
$('.sign-up-toggle').on('click', function() {
  $('.sign-up').addClass('show');
  $('#item-requested').text($('#request-bar').val());
});

$('.post-toggle-options').on('click', function() {
  if ($(this).hasClass('tapped') ) {
    $('.post-toggle-options').removeClass('tapped');
  }else {
    $('.post-toggle-options').removeClass('tapped');
    $(this).addClass('tapped');
  }
});
