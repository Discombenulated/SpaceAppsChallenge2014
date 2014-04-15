<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Welcome Admin") %>
<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>"></jsp:include>

<jsp:include page="<%= JSPs.Admin.Fragments.NAVBAR %>"></jsp:include>

<div class="row">
<div class="col-md-7">

	<h2>Latest submissions</h2>

	<jsp:include page="<%= JSPs.Admin.Fragments.LIST %>"></jsp:include>

</div>

<div class="col-md-5">
	<a class="twitter-timeline" href="https://twitter.com/search?q=%40skysnapper" data-widget-id="455762383839842304">Tweets about "@skysnapper"</a>
	<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
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
