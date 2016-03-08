// sign in and sign up toggle
$('.toggle-container span a').on('click', function() {
  $('.sign-up, .sign-in').toggleClass('hidden');
});


$(window).scroll(function () {
    if ($(document).scrollTop() == 100) {
        $('#header').removeClass('tiny');
        $('#menu-spacing').addClass('nav-margin-top');
        $('.title-area img').attr('src', 'img/resolute_logo.png');
    } else {
        $('#header').addClass('tiny');
        $('#menu-spacing').removeClass('nav-margin-top');
        $('.title-area img').attr('src', 'your-new-image.png');
    }
});
