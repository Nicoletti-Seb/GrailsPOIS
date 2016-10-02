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

if (typeof jQuery !== 'undefined') {
	$(document).ready(function () {
		/* to completed */
	});
}


function initMap() {
	var mapCanvas = document.querySelector(".index-container > .map");
	var mapOptions = {
		center: new google.maps.LatLng(46.8, 2.8),
		zoom: 6
	}
	var map = new google.maps.Map(mapCanvas, mapOptions);
}