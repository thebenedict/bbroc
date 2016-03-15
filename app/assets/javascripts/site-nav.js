// sign in and sign up toggle
$('.sign-up-toggle').on('click', function() {
  $('.sign-up').toggleClass('show');
  $('#item-requested').text($('#request-bar').val());
});

var initVal = "apples";
$(document).ready(function(){
    $(".sign-up-toggle").attr("disabled", "true");
    $(".request-box").blur(function(){
        if ($(this).val() != initVal && $(this).val() != "") {
            $(".sign-up-toggle").removeAttr("disabled");
        } else {
            $(".sign-up-toggle").attr("disabled", "true");
        }
    });
});
