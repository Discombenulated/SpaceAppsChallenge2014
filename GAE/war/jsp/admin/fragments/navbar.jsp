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
          		<!--  <%=request.getServletPath()%> -->
            	<li class="<%= (request.getServletPath().endsWith("/admin/home.jsp")) ? "active" : "" %>"><a href="/admin">Home</a></li>
				<li class="<%= (request.getServletPath().contains("/moderate")) ? "active" : "" %>"><a href="/admin/moderate">Moderate</a></li>        
         	</ul>
        </div><!--/.nav-collapse -->
    </div>
</div>