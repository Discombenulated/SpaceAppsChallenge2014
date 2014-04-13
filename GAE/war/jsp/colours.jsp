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
				<p>
					A very clean sky. A deep blue sky can occur when a cold front brings in clean, unpolluted air from the north. A deep blue sky can also occur when clean air from over the ocean is pushed over the land.
				</p>
				</div>
				<div class="col-md-4">
					<img src="/images/recentsnaps/recentsnap1.jpg" class="img-thumbnail colour-example" />
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
				<p>
					Suggests plenty of water vapor in the sky. It can also suggest the presence of sulfur from coal burning power plants. In some regions a medium blue or even pale blue sky can be caused by emissions from plants and trees. The Smoky Mountains of North Carolina and Tennessee are famous for their bluish haze caused by tiny particles in the air formed by terpenes, a chemical emitted by some trees and plants.
				</p>
				</div>
				<div class="col-md-4">
					<img src="/images/recentsnaps/recentsnap1.jpg" class="img-thumbnail colour-example" />
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
					<img src="/images/recentsnaps/recentsnap1.jpg" class="img-thumbnail colour-example" />
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
					<img src="/images/recentsnaps/recentsnap1.jpg" class="img-thumbnail colour-example" />
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
				<p>
					Suggests the possibility of considerable air pollution in the form of sulfur from coal-burning power plants or certain chemical plants. In some areas this condition occurs mainly in summer when the air is still and pollution accumulates. There are also natural sources of sulfur dioxide, including volcanoes and ocean plankton. Large portions of the island of Hawaii have often been blanketed by a thick layer of hazy sulfur dioxide from the Kilauea Volcano.
				</p>
				</div>
				<div class="col-md-4">
					<img src="/images/recentsnaps/recentsnap1.jpg" class="img-thumbnail colour-example" />
				</div>
			</div>
		</div>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
