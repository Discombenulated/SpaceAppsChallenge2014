<%@page language="java" pageEncoding="ISO-8859-1" %>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>
<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("Welcome") %>
<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>"></jsp:include>


<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>
