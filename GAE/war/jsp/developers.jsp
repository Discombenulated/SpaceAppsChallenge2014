<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Developers") %>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>">
	<jsp:param value="dev-page" name="header-class"/>
</jsp:include>

<div class="row">
<br />
</div>

<div class="col-md-3 panel panel-default">
<div class="panel-body">
	<h4>Getting started</h4>
	<ul>
		<li>Downloads</li>
		<li>Installation</li>
		<li></li>
	</ul>
	<h4>API Endpoints</h4>
	<ul>
		<li>API Structure</li>
		<li>Queries</li>
		<li>Responses</li>
		<li>Submitting a snap</li>
	</ul>
	</div>
</div>
<div class="col-md-9">
	<h2 class="pull-up">Sky Snapper for Developers (Coming soon)</h2>
</div>



<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
