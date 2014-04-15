<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("About") %>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>">
	<jsp:param value="about-page" name="header-class"/>
</jsp:include>

<div class="col-md-8">
	<h2>About Sky Snapper</h2>
	<p>
		Sky Snapper was built as part of the 2014 Space Apps Challenge by a team of 4 people from <a href="http://www.paconsulting.com/" target="_blank">PA Consulting</a>.
		<br />
		The idea was to enable large scale collection and analysis of sky (or air) quality data from around the globe.<br />
		We have enabled this through developing an iOS application and a web service which people can submit their pictures to.<br />
		We can then perform analysis on those images to determine pollution and air quality information.
	</p>
	
	<h2>About Space Apps Challenge</h2>
	<p>
		The <a href="https://2014.spaceappschallenge.org/about/" target="_blank">Space Apps Challenge</a> is an international mass collaboration event focused on creating solutions to address global needs.<br />
		Projects are in the categories of Earth Watch, Technology in Space, Human Spaceflight, Robotics and Asteroids.<br />
		The challenge is based around the principles of transparency, participation and collaboration, by using openly available data supplied through NASA missions and technologies.
	</p>
</div>
<div class="col-md-4">
	<h2>About the team</h2>
	<p>The team who built Sky Snapper is from <a href="http://paconsulting.com/" target="_blank">PA Consulting</a>. There are 4 of us:
	<ul>
		<li><strong>Ben Noble</strong>, iOS development</li>
		<li><strong>David Stanton</strong>, iOS development</li>
		<li><strong>James Shepherd</strong>, Java & Google App Engine</li>
		<li><strong>George Buckingham</strong>, Web development</li>
	</ul>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
