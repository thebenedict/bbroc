$(function() {
    $('#post_image').change(function(e) {
        var file = e.target.files[0],
            imageType = /image.*/;

        if (!file.type.match(imageType))
            return;


    });

    // geolocation for new vendors
    function updateVendorDropdown(lat, lng) {
      $.ajax({
        type: "GET",
        url: "/vendors?lat=" + lat + "&lng=" + lng,
        success: function(result) {
          console.log("vendors fetched");
        },
          error: function(e) {
          console.log("something wrong!");
        }
      });
    }

    navigator.geolocation.getCurrentPosition(function(position) {
      updateVendorDropdown(position.coords.latitude, position.coords.longitude);
    });

    $('.post_vendor_name').removeClass('visible');

    $('.location-trigger').click(function() {
      if($('.post_vendor_name').is(":visible")) {
        $('.post_vendor_name').removeClass('visible');
        $('#post_vendor_attributes_name').val('');
      } else {
        $('.post_vendor_name').addClass('visible');
        $('#post_vendor_id').val('');
      }
    });

    $('#post_vendor_id').change(function() {
      if($(this).val()) {
        $('.post_vendor_name').removeClass('visible');
        $('#post_vendor_attributes_name').val('');
      }
    })

  console.log("test");
  $('#post_image').change();

});

function geo_success(position) {
  console.log(position);
  $('#post_vendor_attributes_lat').val(position.coords.latitude);
  $('#post_vendor_attributes_lng').val(position.coords.longitude);
  $('#post_vendor_attributes_accuracy').val(position.coords.accuracy);
}

function geo_error() {
  console.log("Sorry, no position available.");
}

var geo_options = {
  enableHighAccuracy: true,
  maximumAge        : 10000,
  timeout           : 27000
};

var wpid = navigator.geolocation.watchPosition(geo_success, geo_error, geo_options);

$('#take-image').on('click', function() {
  $(this).addClass('hidden');
  $('.item-image, #retake-image').removeClass('hidden');
});
