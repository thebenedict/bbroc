$(function() {
    $('#user_avatar').change(function(e) {
        $('.item-image').removeClass('hidden');
        var file = e.target.files[0],
            imageType = /image.*/;

        if (!file.type.match(imageType))
            return;

        var reader = new FileReader();
        reader.onload = fileOnload;
        reader.readAsDataURL(file);
    });

    function fileOnload(e) {
        var $img = new Image();
        var canvas = $('#canvas')[0];
        var context = canvas.getContext('2d');

        $img.onload = function(e) {
              context.clearRect(0, 0, canvas.width, canvas.height);
              var ct = document.getElementById('measure'); 
              ct.appendChild($img);
              var wrh = $img.width / $img.height;
              var newWidth = canvas.width;
              var newHeight = newWidth / wrh;
              if (newHeight > canvas.height) {
                  newHeight = canvas.height;
                  newWidth = newHeight * wrh;
              }
              ct.removeChild($img);
              context.drawImage($img, 0, 0, newWidth, newHeight);
        };
        $img.src = e.target.result;
    }
});