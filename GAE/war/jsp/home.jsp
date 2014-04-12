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
    SnapperOverlay.prototype = new google.maps.OverlayView();
    
    
      function initialize() {
        var mapOptions = {
        		zoom: 1,
        	    center: new google.maps.LatLng(0, 0),
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
        var srcImage = "http://localhost:8888/images/maps-overlay.png";
        
        
        google.maps.event.addListener(map, 'tilesloaded', function() {
        	var swBound = new google.maps.LatLng(-45.525592, -120.410156);
        	  var neBound = new google.maps.LatLng(75.361729, 171.210938);
        	  var bounds = new google.maps.LatLngBounds(swBound, neBound);
        	  bounds = map.getBounds();
        	  console.log(bounds);
        	  if (null == overlay) {
        		overlay = new SnapperOverlay(bounds, srcImage, map);
        		}
         });
      }
      google.maps.event.addDomListener(window, 'load', initialize);
      
      
      function SnapperOverlay(bounds, image, map) {
    	  this.bounds_ = bounds;
    	  this.image_ = image;
    	  this.map_ = map;
    	  
    	  this.div_ = null;
    	  this.setMap(map);
      }
      
      SnapperOverlay.prototype.onAdd = function() {
    	  if (null != this.div_) {
    	  	document.removeChild(this.div_);
    	  }
    	  var div = document.createElement('div');
    	  div.style.borderStyle = 'none';
    	  div.style.borderWidth = '0px';
    	  div.style.position = 'absolute';

    	  // Create the img element and attach it to the div.
    	  var img = document.createElement('img');
    	  img.src = this.image_;
    	  img.style.width = '100%';
    	  img.style.height = '100%';
    	  img.style.position = 'absolute';
    	  div.appendChild(img);

    	  this.div_ = div;

    	  // Add the element to the "overlayLayer" pane.
    	  var panes = this.getPanes();
    	  panes.overlayLayer.appendChild(div);
    	};
    	
    	SnapperOverlay.prototype.draw = function() {

    		  // We use the south-west and north-east
    		  // coordinates of the overlay to peg it to the correct position and size.
    		  // To do this, we need to retrieve the projection from the overlay.
    		  var overlayProjection = this.getProjection();

    		  // Retrieve the south-west and north-east coordinates of this overlay
    		  // in LatLngs and convert them to pixel coordinates.
    		  // We'll use these coordinates to resize the div.
    		  var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
    		  var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());

    		  // Resize the image's div to fit the indicated dimensions.
    		  var div = this.div_;
    		  div.style.left = sw.x + 'px';
    		  div.style.top = ne.y + 'px';
    		  div.style.width = (ne.x - sw.x) + 'px';
    		  div.style.height = (sw.y - ne.y) + 'px';
    		};
      
</script>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>"></jsp:include>

<div class="col-md-7 edge">
		<h2>Sky colour worldwide snapshot</h2>
		<div id="map-canvas" class=" homepage-map"></div>
		
		<h3>What is SkySnapper <small>Crowd-sourcing Climate Change</small></h3>
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
		<div class="recent-snap">
			<img class="img-thumbnail" />
		</div>
	</div>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
