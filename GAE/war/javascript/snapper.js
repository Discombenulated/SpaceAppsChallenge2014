$(document).ready(function() {
	$('.dropdown-menu').on('click', function(e) {
	    if($(this).hasClass('dropdown-menu-form')) {
	        e.stopPropagation();
	    }
	});
	if ($("#explore-maps-canvas").length > 0) {
		$("#explore-maps-canvas").height($(document).height() - $("#explore-maps-canvas").offset().top - 5);
	}
});