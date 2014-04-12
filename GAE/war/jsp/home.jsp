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
		<div id="map-canvas" class=" homepage-map"></div>
</div>

<div class="col-md-5">
	<h2></h2>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
