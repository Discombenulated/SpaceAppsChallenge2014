<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Colours of the sky") %>

<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>">
	<jsp:param value="explore-page" name="header-class"/>
</jsp:include>


<div class="col-md-9">
	<h2 class="pull-up">SkySnapper for Developers</h2>
</div>



<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
