// sign in and sign up toggle
$('.sign-up-toggle').on('click', function() {
  $('.sign-up').addClass('show');
  $('#item-requested').text($('#request-bar').val());
});

$(":not('.post-toggle-options')").on('click', function() {
  $('.post-toggle-options').removeClass('tapped');
  $('.close-button').removeClass('active');
});

$(document).on('click', '.post-toggle-options', function(){
    if ($(this).hasClass('tapped') ) {
      $('.post-toggle-options').removeClass('tapped');
        $('.close-button').removeClass('active');
    }else {
      $('.post-toggle-options').removeClass('tapped');
      $(this).addClass('tapped');
      $(this).siblings().addClass('active');
    }
});
