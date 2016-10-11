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

$(document).ready(function () {
	/* to completed */
});

function initMap() {
	var mapCanvas = document.querySelector(".index-container > .map");
	var map = new Map(mapCanvas);


	$.get('http://localhost:8080/ProjetPOIS/pois.json', null,
			function onGetPois(data){
				for(var i in data){
					map.addMarker(data[i]);
				}
			}, 'json');
}
