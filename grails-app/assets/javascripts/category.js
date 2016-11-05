/**
 * Created by MBDS on 05/11/2016.
 */

function initMap() {
    var mapCanvas = document.querySelector('.index-container > .map');
    var map = new Map(mapCanvas, {
        markerClickEvent: onMarkerClickEvent
    });

    var monelement = document.getElementById('carte-pois');
    var categoryId = monelement.getAttribute('data-categoryId');

    //Init marker
    $.get('http://localhost:8080/ProjetPOIS/category/' + categoryId + '/show.json', null,
        function onGetPois(data) {
            var listPois = data.pois;
            for (var i in listPois) {
                var idPoi = listPois[i].id;

                $.get('http://localhost:8080/ProjetPOIS/poi/' + idPoi + '/show.json', null,
                    function onGetPoi(data) {
                        map.addMarker(data);
                    }, 'json');
            }
        }, 'json');
}


// MARKERS FUNCTIONS
function createContentInfoMarker(marker){
    console.log("ici:",marker.poi);
    var content = $('.panels .info-marker').clone();
    content.find('.info-header .title').text(marker.poi.name).end()
        .find('.info-content .address').text(marker.poi.address).end()
        .find('.info-content .description').text(marker.poi.description);

    return content.html();
}

function onMarkerClickEvent(){
    //check if the window is already open
    if(this.infoWindow.getMap()){
        this.infoWindow.close();
        return;
    }

    if( !this.infoWindow.getContent() ){
        this.infoWindow.setContent(createContentInfoMarker(this));
    }

    this.infoWindow.open(this.getMap(), this);
}