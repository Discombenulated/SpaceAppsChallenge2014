function pollForPhotoData() {
	$('*[data-photoid]').each(function(index, ele){
		var div = $(ele);
		var photoid = div.attr('data-photoid');
		var analysis = $('.analysis');
		var averageColour = $('.averageColour');
		
		$.ajax({
			type: "POST",
			url: "/photodata",
			dataType: "json",
			async: false,
			data: {
				photoid: photoid,
			},
			success: function(data) {
				if (data.averageR + data.averageG + data.averageB > 0) {
					averageColour.css('background-color', "rgb("+ data.averageR + "," + data.averageG + "," + data.averageB + ")");
					div.hide();
					analysis.show();
				} else {
					setTimeout(pollForPhotoData, 2000);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				setTimeout(pollForPhotoData, 2000);
				console.log && console.log(errorThrown);
			},
		});
	});
}

function setupImages() {
	window.coloursbase = "/images/colours/";
	window.orangeImage = {
			  url: coloursbase + "orange.png",
	  	 	  size: new google.maps.Size(10, 10),
	  			scaledSize: new google.maps.Size(10, 10)
	  		};

	window.darkBlueImage = {
			  url: coloursbase + "dark-blue.png",
			  size: new google.maps.Size(10, 10),
				scaledSize: new google.maps.Size(10, 10)
			};

	window.paleBlueImage =  {
			  url: coloursbase + "pale-blue.png",
	  		  size: new google.maps.Size(10, 10),
	  			scaledSize: new google.maps.Size(10, 10)
	  		};
	
}

function zoom_changed(map) {
	
	for (var i = 0; i < window.markers.length; i++) {
		var m = window.markers.pop();
		m.removeMarker();
	}
	
	var numberToPlace = Math.floor(Math.random() * 10) + 1;
	
	for (var j = 0; j < numberToPlace; j++) {
		var m = new Marker(getRandomInRange(map.getBounds().getNorthEast().lat(), map.getBounds().getSouthWest().lat(), 5), getRandomInRange(map.getBounds().getNorthEast().lng(), map.getBounds().getSouthWest().lng(), 5), getRandomImage(), "");
		window.markers.push(m);
		m.setMap(map);
	}
}

function getRandomImage() {
	var rand = Math.floor(Math.random() * 3) + 1;
	if (rand == 1) {
		return window.orangeImage;
	} else if (rand == 2) {
		return window.darkBlueImage; 
	} else if (rand == 3) {
		return window.paleBlueImage;
	} else {
		return window.paleBlueImage;
	}
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

Marker.prototype.removeMarker = function() {
	this.marker_.setMap(null);
}

$(document).ready(function() {
	$('.dropdown-menu').on('click', function(e) {
	    if($(this).hasClass('dropdown-menu-form')) {
	        e.stopPropagation();
	    }
	});
	if ($("#explore-maps-canvas").length > 0) {
		$("#explore-maps-canvas").height($(window).height() - $("#explore-maps-canvas").offset().top - 5);
	}
	
	if ($(".snaps").length > 0) {
		$(".snaps").height($("#explore-maps-canvas").height() - 60);
	}
	
	window.markers = [];
	
	if(window.google) {
		setupImages();
	}
});

function getRandomInRange(from, to, fixed) {
    return (Math.random() * (to - from) + from).toFixed(fixed) * 1;
    // .toFixed() returns string, so ' * 1' is a trick to convert to number
}
