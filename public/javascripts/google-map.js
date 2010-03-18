$.fn.show_address = function(address)
    {
        if (GBrowserIsCompatible()) {
            // init the map within div element
            map = new GMap2(this.get(0));
            // init the geo coder to get the geo point
            geocoder = new GClientGeocoder();
            geocoder.getLatLng(
                'burwood, NSW',
                function(point) {
                    if (point) {
                        // must set the center first
                        map.setCenter(point, 15);
                    }
                });
            var ui = map.getDefaultUI();
            ui.controls.smallzoomcontrol3d = true;
            map.setUI(ui);

            // some more controllers
            //map.addControl(new GMapTypeControl());
            geocoder.getLatLng(
                address,
                function(point) {
                    if (point) {
                        var marker = new GMarker(point);
                        map.addOverlay(marker);
                    }
                });
        }
    }