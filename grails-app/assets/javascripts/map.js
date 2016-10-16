/**
 * Created by 53js-Seb on 10/10/2016.
 */

/**
 * Options
 * {
 *      markerClickEvent: callback
 *      markerStartDragEvent: callback
 *      markerEndDragEvent: callback
 * }
 */

var Map = (function ClassMap(){
    var el = null; // map container
    var opt = null;
    var markers = [];
    var map = null;

    var MapObject = function MapObject(element, options){
        el = element;
        opt = options;
        map = new google.maps.Map(el, getMapOptions());
    }

    function getMapOptions(){
        return {
            center: new google.maps.LatLng(46.8, 2.8),
            zoom: 6
        }
    }

    function addMarker(poi){
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(poi.y, poi.x),
            map: map,
            title: poi.name,
            draggable:true,
            infowindow: new google.maps.InfoWindow({
                maxWidth: 350
            })
        });

        // Event Listener
        if(opt.markerClickEvent) google.maps.event.addListener(marker, 'click', opt.markerClickEvent);
        if(opt.markerStartDragEvent) google.maps.event.addListener(marker, 'dragstart', opt.markerStartDragEvent);
        if(opt.markerEndDragEvent) google.maps.event.addListener(marker, 'dragend', opt.markerEndDragEvent);

        marker.poi = poi;
        markers.push(marker);

        return marker;
    }

    function getMarker(idPoi){
        for( var i in markers ){
            var marker = markers[i];

            if(marker.poi.id === idPoi){
                return marker;
            }
        }
        return null;
    }

    function removeMarker(idPoi){
        var marker = getMarker(idPoi);

        if(!marker){
            return false;
        }

        marker.setMap(null);
        return true;
    }

    MapObject.prototype = {
        el: el,
        map: map,
        options: opt,
        getMarker: getMarker,
        addMarker: addMarker,
        removeMarker: removeMarker
    };

    return MapObject;
})();
