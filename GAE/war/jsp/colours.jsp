<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Sky Zone") %>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>">
	<jsp:param value="colours-page" name="header-class"/>
</jsp:include>

<div class="col-md-12">
		<h2>The Sky Zone</h2>
		<p>When you want to know what the weather is like, where do you look? At <b>the sky</b> of course!</p>
		<p>Looking up at the sky can answer a lot of questions, from "what time is it?" to "do I need my coat?" and plenty of others<p>
		<p>But did you know we can also use the sky to tell us about the levels of pollution in the atmosphere? <b>Read on to find out more.</b></p>  
		
		<h2>Sky Colour</h2>
		<div class="media">
			<a class="pull-left" name="deepBlue">
				<div class="media-object colourbox" id="deepblue">&nbsp;</div>
			</a>
			<div class="media-body">
				<div class="col-md-8">
				<h4 class="media-heading">Deep Blue</h4>
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
				<div class="media-object colourbox" id="clearblue">&nbsp;</div>
			</a>
			<div class="media-body">
				<div class="col-md-8">
				<h4 class="media-heading">Medium Blue</h4>
				<p>A medium blue sky suggests that there is a lotof water vapour in the air, but it can also be causes by coal burning power plants.
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
				<p>A pale blue or milky sky can suggest that there is a lot of air pollution, possibly from coal burning power plants, or it may have accumulated on a particularly still day.
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
				<p>A very clean sky. A deep blue sky can occur when a cold front brings in clean, unpolluted air from the north. A deep blue sky can also occur when clean air from over the ocean is pushed over the land.
				</p>
				</div>
				<div class="col-md-4">
					<img src="/images/recentsnaps/recentsnap1.jpg" class="img-thumbnail colour-example" />
				</div>
			</div>
		</div>
		
		<p>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
