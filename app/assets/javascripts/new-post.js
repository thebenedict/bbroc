$(function() {
    $('#inputImage').change(function(e) {
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
          newWidth = (cardWidth / width) * width;
          newHeight = cardHeight;

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
            context.drawImage(this, xCrop, yCrop, width, height, 0, 0, newWidth, newHeight);
            var uri = $('#canvas')[0].toDataURL("image/jpeg");
            $('#post_image').val(uri);
        });
    }
});

$('#take-image').on('click', function() {
  $(this).addClass('hidden');
  $('.item-image, #retake-image').removeClass('hidden');
  $('.form-actions input').css('background', '#479c9d');
});
