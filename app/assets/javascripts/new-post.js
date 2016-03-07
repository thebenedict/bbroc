// Import image
$(function () {
  var $image = $('#image');
  var $inputImage = $('#inputImage');
  var URL = window.URL || window.webkitURL;
  var blobURL;

  if (URL) {
    $inputImage.change(function () {
      var files = this.files;
      var file;

      if (!$image.data('cropper')) {
        return;
      }

      if (files && files.length) {
        file = files[0];
        if (/^image\/\w+$/.test(file.type)) {
          blobURL = URL.createObjectURL(file);
          console.log(blobURL);
          $image.one('built.cropper', function () {

            // Revoke when load complete
            URL.revokeObjectURL(blobURL);
          }).cropper('reset').cropper('replace', blobURL);
          $inputImage.val('');
        } else {
          window.alert('Please choose an image file.');
        }
      }
    });
  } else {
    $inputImage.prop('disabled', true).parent().addClass('disabled');
  }
});

$('#image').cropper({
  viewMode: 3,
  dragMode: 'nothing',
  autoCropArea: 1,
  aspectRatio: 4 / 3,
  strict: false,
  guides: false,
  highlight: false,
  dragCrop: false,
  cropBoxMovable: false,
  cropBoxResizable: false,
  crop: function(e) {
    // Output the result data for cropping image.
    //console.log(e.x);
    //console.log(e.y);
    //console.log(e.width);
    //console.log(e.height);
    //console.log(e.rotate);
    //console.log(e.scaleX);
    //console.log(e.scaleY);
  }
});

$('#rotate-left').on('click', function() {
  $('#image').cropper('rotate', -90);
});

$('#rotate-right').on('click', function() {
  $('#image').cropper('rotate', 90);
});

$('#inputImage').on('click', function() {
  $('#image').cropper('getImageData');
});

$('#take-image').on('click', function() {
  $(this).addClass('hidden');
  $('.item-image, #retake-image').removeClass('hidden');
  $('.form-actions input').css('background', '#479c9d');
});



/* the blob stuff for server upload!
  $().cropper('getCroppedCanvas').toBlob(function (blob) {
  var formData = new FormData();

  formData.append('croppedImage', blob);

  $.ajax('/path/to/upload', {
    method: "POST",
    data: formData,
    processData: false,
    contentType: false,
    success: function () {
      console.log('Upload success');
    },
    error: function () {
      console.log('Upload error');
    }
  });
});
*/
