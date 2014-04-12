<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>
<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Welcome") %>

<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV62aeCEjJHb6dqhaswm7dLEB3-r2Gsr0&sensor=false">
    </script>
    <script type="text/javascript">
    
    var overlay = null;
    window.map = null;
    window.marker_hover = null;
      function initialize() {
        var mapOptions = {
        		zoom: 1,
        	    center: new google.maps.LatLng(0, 0),
        	    disableDefaultUI: true,
        	    disableDoubleClickZoom:true,
        	    panControl:false,
        	    scrollwheel:false,
        	    draggable:false,
        };
        window.map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
        
        var coloursbase = "/images/colours/";
        
        
        google.maps.event.addListener(map, 'tilesloaded', function() {
        	var marker1Image = {
          		  url: coloursbase + "orange.png",
          		  size: new google.maps.Size(10, 10),
          			scaledSize: new google.maps.Size(10, 10)
          		};
        	var marker1 = new google.maps.Marker({
        		icon: marker1Image,
        		position: new google.maps.LatLng(31.423976, 115.839844),
        		map:map,
        	});
        	
        	var marker2Image = {
            		  url: coloursbase + "dark-blue.png",
            		  size: new google.maps.Size(10, 10),
            			scaledSize: new google.maps.Size(10, 10)
            		};
          	var marker2 = new google.maps.Marker({
          		icon: marker2Image,
          		position: new google.maps.LatLng(53.429174, -2.460937),
          		map:map,
          	});
        	var marker3 = new google.maps.Marker({
        		icon: marker1Image,
        		position: new google.maps.LatLng(39.972911, -76.782074),
        		map:map,
        	});
        	
        	var marker4Image = {
          		  url: coloursbase + "pale-blue.png",
          		  size: new google.maps.Size(10, 10),
          			scaledSize: new google.maps.Size(10, 10)
          		};
        	var marker4 = new google.maps.Marker({
        		icon: marker4Image,
        		position: new google.maps.LatLng(-10.40678, -52.207031),
        		map:map,
        	});
         });
      }
      google.maps.event.addDomListener(window, 'load', initialize);
      
      
</script>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>"></jsp:include>

<div class="col-md-7 edge">
		<h2>Sky colour worldwide snapshot</h2>
		<div id="map-canvas" class=" homepage-map"></div>
		<h4 class="explore-snag">Looks interesting? Why not go and <a href="/jsp/explore.jsp" class="btn btn-explore">explore</a>?</h4>
		
		<h3>What is SkySnapper? <small>Crowd-sourcing Climate Change</small></h3>
		<p>
			<dl class="what-to-do">
				<dt>Take a picture of the sky with our <a href="#">app</a></dt>
				<dt>We analyse the image for signs of air pollution</dt>
				<dt>Your snaps help us gather data to beat climate change</dt>
			</dl>
		</p>
		
		<h3>Get involved</h3>
		<p>
			<a href="#" class="appstore-link" target="itunes_store" style="display:inline-block;overflow:hidden;background:url(https://linkmaker.itunes.apple.com/htmlResources/assets/en_us//images/web/linkmaker/badge_appstore-lrg.png) no-repeat;width:135px;height:40px;@media only screen{background-image:url(https://linkmaker.itunes.apple.com/htmlResources/assets/en_us//images/web/linkmaker/badge_appstore-lrg.svg);}"></a>
			<a href="#" class="btn btn-default btn-skysnapper">Developer Guide</a>
		</p>
</div>

<div class="col-md-5">
	<h2>Recently snapped</h2>
	<div class="recently-snapped">
		<div class="recent-snap" data-latitude="49.435985" data-longitude="12.128906">
			<img class="img-thumbnail" src="/images/recentsnaps/recentsnap1.jpg "/>
			<div class="at">at <span class="pre">49.435985, 12.128906</span>. Classification: <a href="#">Dark Blue</a>
			</div>
		</div>
		
		<div class="recent-snap" data-latitude="36.945502" data-longitude="-93.691406">
			<img class="img-thumbnail" src="/images/recentsnaps/recentsnap1.jpg "/>
			<div class="at">at <span class="pre">36.945502, -93.691406</span>. Classification: <a href="#">Dark Blue</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(".recent-snap").hover(function(e) {
		if (null != window.map) {
			window.marker_hover = new google.maps.Marker({
				position: new google.maps.LatLng($(this).data("latitude"), $(this).data("longitude")),
				map:window.map,
			});
		}
	}, function(e) {
		if (null != window.marker_hover) {
			window.marker_hover.setMap(null);
		}
	});
</script>
<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
