<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Colours of the sky") %>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>">
	<jsp:param value="colours-page" name="header-class"/>
</jsp:include>

<div class="col-md-12">
		<h2>Colours of the sky</h2>
		
		<div class="media">
			<a class="pull-left" href="#">
				<div class="media-object colourbox" id="deepblue">&nbsp;</div>
			</a>
			<div class="media-body">
				<div class="col-md-8">
				<h4 class="media-heading">Deep Blue</h4>
				<p>A very clean sky. A deep blue sky can occur when a cold front brings in clean, unpolluted air from the north. A deep blue sky can also occur when clean air from over the ocean is pushed over the land.
				</p>
				</div>
				<div class="col-md-4">
					Hi
				</div>
			</div>
		</div>
		
		<div class="media">
			<a class="pull-left" href="#">
				<div class="media-object colourbox" id="clearblue">&nbsp;</div>
			</a>
			<div class="media-body">
				<div class="col-md-8">
				<h4 class="media-heading">Clear Blue</h4>
				<p>A very clean sky. A deep blue sky can occur when a cold front brings in clean, unpolluted air from the north. A deep blue sky can also occur when clean air from over the ocean is pushed over the land.
				</p>
				</div>
				<div class="col-md-4">
					Hi
				</div>
			</div>
		</div>
		
		<div class="media">
			<a class="pull-left" href="#">
				<div class="media-object colourbox" id="lightblue">&nbsp;</div>
			</a>
			<div class="media-body">
				<div class="col-md-8">
				<h4 class="media-heading">Light Blue</h4>
				<p>A very clean sky. A deep blue sky can occur when a cold front brings in clean, unpolluted air from the north. A deep blue sky can also occur when clean air from over the ocean is pushed over the land.
				</p>
				</div>
				<div class="col-md-4">
					Hi
				</div>
			</div>
		</div>
		
		<div class="media">
			<a class="pull-left" href="#">
				<div class="media-object colourbox" id="paleblue">&nbsp;</div>
			</a>
			<div class="media-body">
				<div class="col-md-8">
				<h4 class="media-heading">Pale Blue</h4>
				<p>A very clean sky. A deep blue sky can occur when a cold front brings in clean, unpolluted air from the north. A deep blue sky can also occur when clean air from over the ocean is pushed over the land.
				</p>
				</div>
				<div class="col-md-4">
					Hi
				</div>
			</div>
		</div>
		
		<div class="media">
			<a class="pull-left" href="#">
				<div class="media-object colourbox" id="milky">&nbsp;</div>
			</a>
			<div class="media-body">
				<div class="col-md-8">
				<h4 class="media-heading">Milky</h4>
				<p>A very clean sky. A deep blue sky can occur when a cold front brings in clean, unpolluted air from the north. A deep blue sky can also occur when clean air from over the ocean is pushed over the land.
				</p>
				</div>
				<div class="col-md-4">
					Hi
				</div>
			</div>
		</div>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
