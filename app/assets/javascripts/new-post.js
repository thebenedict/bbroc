$(function() {
    $('#post_image').change(function(e) {
        var file = e.target.files[0],
            imageType = /image.*/;

        if (!file.type.match(imageType))
            return;

        var reader = new FileReader();
        reader.onload = fileOnload;
        reader.readAsDataURL(file);
    });

    function fileOnload(e) {
        var $img = $('<img>', { src: e.target.result });
        var canvas = $('#canvas')[0];
        var context = canvas.getContext('2d');

        var width = $img[0].width;
		    var height = $img[0].height;
        var r = (width / height);
        var cardWidth = 305;
        var cardHeight = 229;
        var newWidth;
		    var newHeight;
        var xCrop;
        var yCrop;

        if (r == 1) {
          newWidth = cardWidth;
          newHeight = (cardWidth / width) * height;

          var w = (width / newWidth);

          xCrop = ((width / 2) - (cardWidth / 2) * w);
          yCrop = 0;
        } else if (r > 1) {
          newHeight = cardHeight;
          newWidth = (cardHeight / height) * width;

          var w = (width / newWidth);

          xCrop = ((width / 2) - (cardWidth / 2) * w);
          yCrop = 0;
        } else {
          newWidth = cardWidth;
          newHeight = (cardWidth / width) * height;

          var h = (height / newHeight);

          xCrop = 0;
          yCrop = ((height / 2) - (cardHeight / 2) * h);
        }

        $img.load(function() {
          context.drawImage(this, 0, 0, newWidth, newHeight);
        });
    }

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