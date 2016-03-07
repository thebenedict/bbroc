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
        var canvas = $('#image')[0];
        var context = canvas.getContext('2d');

        $img.load(function() {
            context.drawImage(this, 0, 0, 305, 289);
        });
    }
});

$('#inputImage').on('click', function() {
  $('#image').cropper('getImageData');
});

$('#take-image').on('click', function() {
  $(this).addClass('hidden');
  $('.item-image, #retake-image').removeClass('hidden');
  $('.form-actions input').css('background', '#479c9d');
});
