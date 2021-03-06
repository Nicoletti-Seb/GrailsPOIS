
// MARKERS FUNCTIONS
function createContentInfoMarker(marker){
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

function onMarkerStartDragEvent(ev){
	this.prevLatLng = ev.latLng;
}

function onMarkerEndDragEvent(ev){
	$.ajax({
		url: 'http://localhost:8080/ProjetPOIS/poi/' + this.poi.id + '/update.json',
		method: 'PUT',
		contentType: 'application/json',
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

// LISTENER

function onClickTargetMarker(ev){
	var map = ev.data.map;
	var idPoi = $(ev.currentTarget).parent().data('poi');
	var markeur = map.getMarker(idPoi);

	//Zoom on marker
	map.mapApi.setZoom(8);
	map.mapApi.setCenter(markeur.getPosition());

	//Open infoWindowé
	if(!markeur.infoWindow.getMap()){
		map.trigger(markeur, 'click');
	}
}

function onDragStart(ev){
    var $el = $(ev.target);
    if(!$el.hasClass('poi')){
        return false;// stop propagation
    }
    ev.originalEvent.dataTransfer.setData('idPoi', $el.data('poi'));
}

function onDragOver(ev){
    ev.preventDefault();
}

function onDrop(ev){
    ev.preventDefault();

    var $target = $(ev.target);

    // Identify the destination
    var $listDest = null;
    if($target.hasClass('poi')){
        $listDest = $(ev.target).parent();
    }
    else if($target.hasClass('title-category')){
        $listDest = $(ev.target).parent().find('.list-pois');
    }
    else{
        return;
    }

    //Hide the old element and add the new element
    var idPoi = ev.originalEvent.dataTransfer.getData('idPoi');
    var $elPoi = $('.nav_category .poi[data-poi=' + idPoi + ']');
    var idNewCategory = $listDest.parent().data('category');
    var $newElPoi = $elPoi.clone()
    $listDest.append($newElPoi);
    $elPoi.addClass('hide');

    $.ajax({
        url: 'http://localhost:8080/ProjetPOIS/poi/' + idPoi + '/update.json',
        method: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify({category:{id:idNewCategory}}),
        success: function onSuccessUpdateCategoryPoi(){
            $elPoi.remove();
        },
        error: function onErrorUpdateMarker(err){
            console.error(err);
            $newElPoi.remove();
            $elPoi.removeClass('hide');
        }
    });
}


//END LISTENER

function initMap() {
	var mapCanvas = document.querySelector('.index-container > .map');
	var map = new Map(mapCanvas, {
		markerClickEvent: onMarkerClickEvent,
		markerStartDragEvent: onMarkerStartDragEvent,
		markerEndDragEvent: onMarkerEndDragEvent,
		markerDraggable: true
	});

	//Init marker
	$.get('http://localhost:8080/ProjetPOIS/poi/list.json', null,
			function onGetPois(data){
				for(var i in data){
					map.addMarker(data[i]);
				}
			}, 'json');

	//Init listener
	$('.nav_category').on( 'click.target_marker',
		'.target_marker',  {map: map}, onClickTargetMarker);

	$('.nav_category').on({
			'dragstart': onDragStart,
			'dragover': onDragOver,
			'drop':onDrop
		});
}
