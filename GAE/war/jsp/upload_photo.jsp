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
		<form action="<%=uploadUrl%>" method="post"
			enctype="multipart/form-data">
			<input type="file" name="fileName" required> <input
				class="active btn" type="submit" value="Upload">
		</form>
	</div>
</div>
<div class="photoList">
		<%
			SimpleDateFormat sdf = new SimpleDateFormat(
					"EEE, d MMM yyyy HH:mm:ss Z");
			for (PhotoPost post : snapperService.getAllImages()) {
				%>
				<div class="row">
					<div class="col-md-12">
						<h3><%= sdf.format(post.getUploadTimestamp()) %></h3>
						<h4><%= post.getId() %></h4>
						<img class="thumbnail" src="<%= post.getURL() %>=s100" />
					</div>
				</div>
			<% } %>
</div>
</body>
</html>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>