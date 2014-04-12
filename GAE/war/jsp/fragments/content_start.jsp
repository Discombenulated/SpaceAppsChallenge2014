<%@page language="java" pageEncoding="ISO-8859-1" %>

<%
String headerClass = "";
if (request.getParameter("header-class") != null) {
	headerClass += " " + request.getParameter("header-class");
}
%>

<body>
<div class="header-section<%= headerClass %>">
	<div class="container">
		<div class="col-md-12">
			<h1><a href="/">SkySnapper</a></h1>
		</div>
		<div class="clearfix"></div>
	<div class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="<%= (request.getServletPath().contains("/home")) ? "active" : "" %>"><a href="/">Home</a></li>
            
            <li class="<%= (request.getServletPath().contains("/colours")) ? "active" : "" %>"><a href="/colours">Colours of the sky</a>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            
          </ul>
          <ul class="nav navbar-nav navbar-right">
          <li class="action-button"><a href="/jsp/explore.jsp">Explore!</a></li>
          <li class="call-to-action"><a href="/jsp/developers.jsp">For Developers</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    </div>
</div>

<div class="container">
