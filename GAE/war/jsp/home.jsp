<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.entity.PhotoPost"%>
<%@page import="static net.skysnapper.util.StringUtils.*"%>
<%@page import="net.skysnapper.util.Constants"%>
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
      
      	$(function(){$('.carousel').carousel({
    	  interval: 2000
    	})});
</script>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>"></jsp:include>

<div class="col-md-7 edge">
		<h2>Sky Snaps Worldwide</h2>
		<div id="map-canvas" class=" homepage-map"></div>
		<h4 class="explore-snag">Want to see more? Explore our <a href="/jsp/explore.jsp" class="">interactive map</a>!</h4>
		
		<h3>What is SkySnapper?</h3>
		<p>Sky Snapper is on a mission to track air pollution around the world and to do that we need your help.</p>
		<p> You can get involved by -</p>
		<p>
			<dl class="what-to-do">
				<dt><a href="#">Tweeting your sky snaps</a> to us.</dt>
				<dt>Using <a href="#">our app</a> to snap a picture of the sky.</dt>
				<dt>Building your own Sky Snapper stations with our <a href="/jsp/developers.jsp">developer tools</a>.</dt>
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
	<div id="recentSnaps" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
		<%	
			boolean first = true;
			String active = "active";
			for (PhotoPost photo : (Iterable<PhotoPost>) request.getAttribute(Constants.Attributes.PHOTOS_LIST)) {
				if (first) {
					first = false;
				} else {
					active = "";
				}
		%>
			<div class="item <%= active %>" data-latitude="<%= escape(photo.getLat()) %>" data-longitude="<%= escape(photo.getLon()) %>">
				<img class="img-thumbnail" src="<%= escape(photo.getURL()) %>=s200-c"/>
				<!-- <div class="carousel-caption">
					at <span class="pre"><%= escape(photo.getLat()) %>, <%= escape(photo.getLon()) %></span>. Classification: Dark Blue (<%= escape(photo.getAverageR()) %>, <%= escape(photo.getAverageG()) %>, <%= escape(photo.getAverageB()) %>)
				</div>  -->
			</div>
		<% } %>
		</div>
	</div>
	
	<br /><br />
	<a class="twitter-timeline"  href="https://twitter.com/SkySnapper"  data-widget-id="455200384089194497">Tweets by @SkySnapper</a>
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
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
