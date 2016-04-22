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

function geo_success(position) {
  console.log(position);
  $('#vendor_lat').val(position.coords.latitude);
  $('#vendor_lng').val(position.coords.longitude);
  $('#vendor_accuracy').val(position.coords.accuracy);
}

function geo_error() {
  console.log("Sorry, no position available.");
}

var geo_options = {
  enableHighAccuracy: true, 
  maximumAge        : 30000, 
  timeout           : 27000
};

var wpid = navigator.geolocation.watchPosition(geo_success, geo_error, geo_options);


navigator.geolocation.getCurrentPosition(function(position) {
  updateVendorDropdown(position.coords.latitude, position.coords.longitude);
});