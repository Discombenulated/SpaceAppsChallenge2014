<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@page import="net.skysnapper.entity.PhotoPost"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>
<%@page import="net.skysnapper.services.SnapperService"%>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("SkySnapper Upload") %>
<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>"></jsp:include>

<%
	SnapperService snapperService = SnapperService
			.getInstance();

	String uploadUrl = snapperService.getMobileUploadURL();
%>
<div class="row">
	<div class="col-md-12">
	<h2>All photos (most recent first)</h2>

	<div class="photoList">
			<%
				SimpleDateFormat sdf = new SimpleDateFormat(
						"EEE, d MMM yyyy HH:mm:ss Z");
				Iterable<PhotoPost> photos = snapperService.getAllImages();
				int x = 1;
				for (PhotoPost post : photos) {
					
					if (x == 1 || (x-1)%4 == 0) { %>
					<div class="row">
					<%} %>
					
						<div class="col-md-3">
							<h3><%= sdf.format(post.getUploadTimestamp()) %></h3>
							<h4><%= post.getId() %></h4>
							<h5><%= post.getAverageR() %>,<%= post.getAverageG() %>,<%= post.getAverageB() %></h5>
							<img class="thumbnail" src="<%= post.getURL() %>=s100" />
						</div>
					<%if (x%4 == 0) {%>
					</div> <!-- end row -->
					<%} 
					x++;%>
				<% } %>
				<%if ((x-1)%4 != 0) {%>
				</div> <!-- end row -->
				<%} %>
				<p>Total photos: <%=x %></p>
	</div>

</div>
</div>
</body>
</html>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>