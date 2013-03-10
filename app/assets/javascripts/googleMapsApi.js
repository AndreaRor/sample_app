      $(document).ready(function(){

        $('#mapContainer').onload(initialize());

        function initialize() {
          var latitude = $('#mapContainer').data('latitude');
          var longitude = $('#mapContainer').data('longitude');
          var mapOptions = {
            center: new google.maps.LatLng(latitude, longitude),
            zoom: 12,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          //setTimeout(function(){
          $('#mapContainer').click(function() {
            var elmtImg = $(this).children('img');
            elmtImg.fadeOut();
            elmtImg.remove();
            var map = new google.maps.Map(document.getElementById('mapContainer'), mapOptions);
            new google.maps.Marker({
                  position: new google.maps.LatLng(latitude, longitude),
                  map: map,
                  title: "test"
            });
            $(this).off();
          });//, 2000);
        }
      });