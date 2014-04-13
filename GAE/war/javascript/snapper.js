$(document).ready(function() {
	$('.dropdown-menu').on('click', function(e) {
	    if($(this).hasClass('dropdown-menu-form')) {
	        e.stopPropagation();
	    }
	});
	if ($("#explore-maps-canvas").length > 0) {
		$("#explore-maps-canvas").height($(document).height() - $("#explore-maps-canvas").offset().top - 5);
	}
	
	window.markers = [];
	
});

function zoom_changed(map) {
	
	console.log(map.zoomLevel());
	
}

function Marker(lat, lng, icon, img) {
	this.lat_ = lat;
	this.lng_ = lng;
	this.icon_ = icon;
	this.img_ = img;
	this.marker_ = null;
}

Marker.prototype.setMap = function(map) {
	this.marker_ = new google.maps.Marker({
		position: new google.maps.LatLng(this.lat_, this.lng_),
		icon: this.icon_,
		map: map,
	});
}

Marker.prototype.remove = function() {
	tihs.marker_.setMap(null);
}
var coloursbase = "/images/colours/";
var orangeImage = {
		  url: coloursbase + "orange.png",
  		  size: new google.maps.Size(10, 10),
  			scaledSize: new google.maps.Size(10, 10)
  		};

var darkBlueImage = {
		  url: coloursbase + "dark-blue.png",
		  size: new google.maps.Size(10, 10),
			scaledSize: new google.maps.Size(10, 10)
		};

var paleBlueImage =  {
		  url: coloursbase + "pale-blue.png",
  		  size: new google.maps.Size(10, 10),
  			scaledSize: new google.maps.Size(10, 10)
  		};