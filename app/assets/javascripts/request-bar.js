$(function(){
  $("#request-bar").typed({
  strings: ["sour cream", "raspberries", "soy milk", "greek yogurt", "blueberries", "Maker's Mark"],
	  typeSpeed: 100,
	  loop: true
  });
});

$(document).ready(function(){
  $(".sign-up-toggle").attr("disabled", "true");
  $(".request-box").keyup(function(e){
    $("#user_requests_attributes_0_body").val($("#request-bar").val());
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
