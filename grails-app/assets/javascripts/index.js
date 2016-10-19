$(document).ready(function () {
	/* to completed */
});

// MARKERS FUNCTIONS
function createContentInfoMarker(marker){
	var content = $('.panels .info-marker').clone();
    content.find('.info-header .title').text(marker.poi.name).end()
		    .find(".info-content .address").text(marker.poi.address).end()
            .find(".info-content .description").text(marker.poi.description);

    console.log(content.html());
	return content.html();
}

function onMarkerClickEvent(){
	if( !this.infowindow.getContent() ){
		this.infowindow.setContent(createContentInfoMarker(this));
	}

	this.infowindow.open(this.getMap(), this);
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
}
