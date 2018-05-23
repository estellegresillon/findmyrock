function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var bandAddress = document.getElementById('band_address');

    if (bandAddress) {
      var autocomplete = new google.maps.places.Autocomplete(bandAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(bandAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
