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
		<h2>Send us your snaps!</h2>
		<p>Simply browse for your photo and click "Upload". Your Sky Snap will be displayed alongside other submissions.</p>
		<form action="<%=uploadUrl%>" method="post" enctype="multipart/form-data" class="form-group row">
			<div class="col-md-8">
				<input type="file" name="fileName" required class="form-control" />
			</div>
			<div class="col-md-4"> 
				<input class="btn btn-primary" type="submit" value="Upload">
			</div>
		</form>
		<p>Tips for Sky Snappers</p>
		<ul>
			<li>Try to choose an area of clear sky and <b>centre this</b> in your image.</li>
			<li>If the sky is totally clear, why not get a bit of the horizon in your photo as well?</li>
			<li>Try to take the photograph facing away from the sun.</li>
		</ul>
		
	</div>
</div>
</body>
</html>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>