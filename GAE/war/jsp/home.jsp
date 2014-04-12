<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>
<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Welcome") %>

<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV62aeCEjJHb6dqhaswm7dLEB3-r2Gsr0&sensor=false">
    </script>
    <script type="text/javascript">
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(0, 0),
          zoom: 1
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
      }
      google.maps.event.addDomListener(window, 'load', initialize);
</script>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>"></jsp:include>

<div class="col-md-7 edge">
		<h2>Snaps from around the world</h2>
		<div id="map-canvas" class=" homepage-map"></div>
		
		<h3>What is SkySnapper</h3>
		<p>
			<h3><small>Crowd-sourcing Climate Change</small></h3>
			Take a picture of the sky with our app (coming soon) and our service will analyse the image for signs of air pollution. Use our API to build your own apps or even build a Sky Snapper base station with a Raspberry Pi. With your snaps of the sky, we can gather the data needed to beat climate change!
		</p>
		
		<h2>Get involved</h2>
		<p>
			<a href="#" class="appstore-link" target="itunes_store" style="display:inline-block;overflow:hidden;background:url(https://linkmaker.itunes.apple.com/htmlResources/assets/en_us//images/web/linkmaker/badge_appstore-lrg.png) no-repeat;width:135px;height:40px;@media only screen{background-image:url(https://linkmaker.itunes.apple.com/htmlResources/assets/en_us//images/web/linkmaker/badge_appstore-lrg.svg);}"></a>
			<a href="#" class="btn btn-default btn-skysnapper">Developer Guide</a>
		</p>
</div>

<div class="col-md-5">
	<h2>Recently snapped</h2>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
