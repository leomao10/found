jQuery(function($){
    // *** search box ***
    $('label.slider_required').each(function(){
        var _this = this, opts = {};
        opts.min = parseInt($(_this).attr('min'));
        opts.max = parseInt($(_this).attr('max'));
        opts.range = true;
        opts.slide = function(event, ui) {
            $('span.value', _this).text(ui.values[0] + ' - ' + ui.values[1]);
        }
        if ($(_this).attr('step')) opts.step = parseInt($(_this).attr('step'));
        opts.values = [$('input.min', _this).val(), $('input.max', _this).val()];
        $('span.bar', _this).slider(opts);
        $('span.value', _this).text($('input.min', _this).val() + ' - ' + $('input.max', _this).val());
    });
    $('a.more').each(function(e){
        var _this = this, $more = $('div.more_options');
        var show = function(){
            $(_this).text($(_this).attr('hide'));
            $('div.more_options').slideDown();
        };
        var hide = function(){
            $(_this).text($(_this).attr('show'));
            $more.slideUp();
        };
        if ($(_this).attr('show') == $(_this).text())
            $(_this).toggle(show, hide);
        else
            $(_this).toggle(hide, show);
        return false;
    });
    // *** google map ***

    function showAddresses(addresses) {
        if (GBrowserIsCompatible()) {
            // init the map within div element
            map = new GMap2($('#googlemap').get(0));
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
            $(addresses).each(function(index, address) {
                geocoder.getLatLng(
                    address,
                    function(point) {
                        if (point) {
                            var marker = new GMarker(point);
                            map.addOverlay(marker);
                        }
                    });
            });
        }
    }
    showAddresses(['13-17 Oxford St, Burwood, NSW', 'Hornsey St, Burwood, NSW']);
});
