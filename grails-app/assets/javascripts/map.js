/**
 * Created by 53js-Seb on 10/10/2016.
 */

var Map = (function ClassMap(){
    var el = null; // map container
    var markers = [];
    var map = null;

    var MapObject = function MapObject(element){
        el = element;
        pois = {};
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
            draggable:true
        });

        marker.poi = poi;
        markers.push(marker);
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

    MapObject.prototype ={
        el: el,
        getMarker: getMarker,
        addMarker: addMarker,
        removeMarker: removeMarker
    }

    return MapObject;
})();
