// navigation
// $('.nav a').on('click', function() {
//   var className = $(this).attr('class');
//   var panelId = '#' + className;
//   $(this).add(panelId).siblings().removeClass('active');
//   $(this).add(panelId).addClass('active');
// });

// sign in and sign up toggle
$('.toggle-container span a').on('click', function() {
  $('.sign-up, .sign-in').toggleClass('hidden');
});
