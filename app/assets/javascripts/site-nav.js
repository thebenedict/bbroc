// navigation
$('.left').on('click', function() {
  $('#right, #bottom, #left, .right, .middle').removeClass('active');
  $('#left, .left').addClass('active');  
});

$('.middle').on('click', function() {
  $('#left, .left, #right, .right').removeClass('active');
  $('.middle').addClass('active');
});

$('.right').on('click', function() {
  $('#left, .left, .middle').removeClass('active');
  $('#right, .right').addClass('active');
});

$('body').on('swiperight', function() {
  // check to see if on middle or left panel
  if (($('.middle').hasClass('active')) || ($('.left').hasClass('active')) ) {
    $('#right, .right, #bottom, .middle').removeClass('active');
    $('#left, .left').addClass('active');
  } else {
      // must be on right panel, slide to middle
      $('#left, .left, #right, .right, .menu-indicator').removeClass('active');
      $('.middle').addClass('active');
    }
});

$('body').on('swipeleft', function() {
  // check to see if on middle or right panel
  if (($('.middle').hasClass('active')) || ($('.right').hasClass('active')) ) {
  $('#left, .left, .middle').removeClass('active');
  $('#right, .right').addClass('active');
  } else {
      // must be on left panel, slide to middle
      $('#left, .left, #right, .right').removeClass('active');
      $('.middle').addClass('active');
    }
});

// toggles
$('#email-signup').on('click', function() {
  $('#new_user').toggleClass('active');
});