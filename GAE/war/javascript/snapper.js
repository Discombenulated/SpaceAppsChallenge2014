$(document).ready(function() {
	$('.dropdown-menu').on('click', function(e) {
	    if($(this).hasClass('dropdown-menu-form')) {
	        e.stopPropagation();
	    }
	});
	console.log($("#explore-maps-canvas").offset());
	$("#explore-maps-canvas").height($(document).height() - $("#explore-maps-canvas").offset().top - 5);
});