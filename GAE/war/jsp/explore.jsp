<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Explore the sky") %>
<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV62aeCEjJHb6dqhaswm7dLEB3-r2Gsr0&sensor=false">
    </script>
    <script type="text/javascript">
    
    window.map = null;
    window.marker_hover = null;
      function initialize() {
        var mapOptions = {
        		zoom: 1,
        	    center: new google.maps.LatLng(0, 0),
        };
        window.map = new google.maps.Map(document.getElementById("explore-maps-canvas"),
            mapOptions);
        
        
        google.maps.event.addListener(map, 'tilesloaded', function() {
        	
         });
        google.maps.event.addListener(map, 'zoom_changed', function() {
            zoom_changed(map);
          });
      }
      google.maps.event.addDomListener(window, 'load', initialize);
      
</script>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>">
	<jsp:param value="explore-page" name="header-class"/>
</jsp:include>

<div class="col-md-12">
	<h2 class="sky-beautiful">Interactive Map <small>The sky is beautiful. Explore it.</small></h2>
</div>

<div class="col-md-7">
	<div id="explore-maps-canvas">
		
	</div>
</div>

<div class="col-md-5">
	<div class="filter">
		<div class="dropdown filter-item">
    <a class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#">
        Colour
        <b class="caret"></b>
    </a>
    <ul class="dropdown-menu dropdown-menu-form" role="menu">
        <li>
            <label class="checkbox">
                <input type="checkbox">
                Dark blue
            </label>
        </li>
        <li>
            <label class="checkbox">
                <input type="checkbox">
                Light blue
            </label>
        </li>
        <li>
            <label class="checkbox">
                <input type="checkbox">
                Pale blue
            </label>
        </li>
        <li>
            <label class="checkbox">
                <input type="checkbox">
                Milky
            </label>
        </li>
    </ul>
    
	</div>
	
	<div class="filter-item range">
		<input type="text" class="form-control" placeholder="When" />
	</div>
	
	<div class="filter-item button">
		<button class="btn btn-primary">Filter</button>
	</div>
	
	<div class="clearfix"></div>
	</div>
	
	<div class="snaps">

		<div class="snap col-md-4" id="snap1">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
		
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification orange">orange</span>
			</div>
			</div>
		</div>
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
		<div class="snap col-md-4">
			<div class="row">
			<img class="img-thumbnail" src="http://placehold.it/200x200">
			</div>
			<div class="row">
			<div class="about">
				<span class="classification dark-blue">dark blue</span>
			</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
