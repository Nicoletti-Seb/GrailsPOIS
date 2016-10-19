// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self
//= require bootstrap
//= require map

// MARKERS FUNCTIONS
function createContentInfoMarker(marker){
	var content = $('.panels .info-marker').clone();
    content.find('.info-header .title').text(marker.poi.name).end()
		    .find(".info-content .address").text(marker.poi.address).end()
            .find(".info-content .description").text(marker.poi.description);

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

function onMarkerStartDragEvent(ev){
	this.prevLatLng = ev.latLng;
}

function onMarkerEndDragEvent(ev){
	$.ajax({
		url: " http://localhost:8080/ProjetPOIS/pois/" + this.poi.id + ".json",
		method: "PUT",
		contentType: "application/json",
		data: JSON.stringify({x: ev.latLng.lng(), y: ev.latLng.lat()}),
		success: function onSuccessUpdateMarker(data){
			this.poi = data;
		}.bind(this),
		error: function onErrorUpdateMarker(err){
			console.error(err);
			this.setPosition(this.prevLatLng);
		}.bind(this)
	});
}
// END MARKERS FUNCTIONS

function initMap() {
	var mapCanvas = document.querySelector(".index-container > .map");
	var map = new Map(mapCanvas, {
		markerClickEvent: onMarkerClickEvent,
		markerStartDragEvent: onMarkerStartDragEvent,
		markerEndDragEvent: onMarkerEndDragEvent
	});

	//Init marker
	$.get('http://localhost:8080/ProjetPOIS/pois.json', null,
			function onGetPois(data){
				for(var i in data){
					map.addMarker(data[i]);
				}
			}, 'json');

	//Init listener
	$('.target_marker').click(function onClickTargetMarker(ev){
		var idPoi = $(ev.currentTarget).data('poi');
		var markeur = map.getMarker(idPoi);

		//Zoom on marker
		map.mapApi.setZoom(8);
		map.mapApi.setCenter(markeur.getPosition());

		//Open infoWindow
		if(!markeur.infoWindow.getMap()){
			map.trigger(markeur, 'click');
		}
	});
}
