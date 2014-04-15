<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@page import="net.skysnapper.util.Constants"%>
<%@page import="net.skysnapper.entity.PhotoPost"%>

	<form class="photoList" method="POST" action="/admin/moderate">
			<%
				SimpleDateFormat sdf = new SimpleDateFormat(
						"EEE, d MMM yyyy HH:mm:ss Z");
				Iterable<PhotoPost> photos = (Iterable<PhotoPost>) request.getAttribute(Constants.Attributes.PHOTOS_LIST);
				Integer columnsInt = (Integer)request.getAttribute(Constants.Attributes.PHOTO_LIST_COLUMNS);
				int columns = columnsInt.intValue();
				String colClass = "col-md-" + (12/columns);
				int x = 0;
				for (PhotoPost post : photos) {
					if (x % columns == 0) { %>
					<div class="row">
					<%} 
					x++;
					%>
					
						<div class="<%=colClass %>">
							<h3><%= sdf.format(post.getUploadTimestamp()) %></h3>
							<h4><%= post.getId() %></h4>
							<h5><%= post.getAverageR() %>,<%= post.getAverageG() %>,<%= post.getAverageB() %></h5>
							<img class="thumbnail" src="<%= post.getURL() %>=s100" />
							<input type="hidden" name="id" value="<%= post.getId() %>" />
							<div class="checkbox"><label>Approved?<input type="checkbox" name="isModeratorApproved$<%=post.getId() %>" <%= null != post.getIsModeratorApproved() && post.getIsModeratorApproved() ? "checked" : "" %> /></label></div>
						</div>
					<%if (x % columns == 0) {%>
					</div> <!-- end row -->
					<%} %>
				<% } %>
				
				<%if (x % columns != 0) {%>
				</div> <!-- end row -->
				<%} %>

				<p>Photos displayed: <%=x %></p>
				
				<input class="btn btn-primary" type="submit" />	
	</form>
	
	
					<%
				Integer pagesInt = (Integer)request.getAttribute(Constants.Paging.NUM_PAGES);
				Integer currentPageInt = (Integer)request.getAttribute(Constants.Paging.CURRENT_PAGE);
				String reqUrl = request.getContextPath();
				%>
				
				<% if (pagesInt.intValue() > 1) { %>
				<ul class="pager">
					<% if (currentPageInt.intValue() <= 1) { %>
					<li class="disabled"><a>Previous</a></li>
					<% } else { %>
					<li><a href="<%=reqUrl +"?" + Constants.Paging.CURRENT_PAGE +"=" + (currentPageInt -1) %>">Previous</a></li>
					<% } %>
					
					<li>Page <%=currentPageInt.toString() %> of <%=pagesInt.toString() %></li> 
					
					<% if (currentPageInt.intValue() >= pagesInt.intValue()) { %>
					<li class="disabled"><a>Next</a></li>
					<% } else { %>
					<li><a href="<%=reqUrl +"?" + Constants.Paging.CURRENT_PAGE +"=" + (currentPageInt +1) %>">Next</a></li>
					<% } %>
				</ul>
				
				<%} %>