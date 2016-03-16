$(function(){
  $("#request-bar").typed({
  strings: ["sour cream", "raspberries", "soy milk", "greek yogurt", "blueberries", "Maker's Mark"],
	  typeSpeed: 100,
	  loop: true
  });
});

$(document).ready(function(){
  var baseFBUri = $('.fb-sign-in').attr('href');
  $(".sign-up-toggle").attr("disabled", "true");
  $(".request-box").keyup(function(e){
    var requestVal = $("#request-bar").val();
    $('.fb-sign-in').attr('href', baseFBUri + '?request=' + encodeURIComponent(requestVal));
    $("#user_requests_attributes_0_body").val(requestVal);

	  if (e.which == 13) {
	    $(".sign-up-toggle").click();
	    return false;
	  }
    if ($(this).val() != "") {
      $(".sign-up-toggle").removeAttr("disabled");
    } else {
      $(".sign-up-toggle").attr("disabled", "true");
    }
  });
});
