<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("About") %>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>">
	<jsp:param value="about-page" name="header-class"/>
</jsp:include>

<div class="col-md-9">
	<h2>About Sky Snapper</h2>
</div>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
