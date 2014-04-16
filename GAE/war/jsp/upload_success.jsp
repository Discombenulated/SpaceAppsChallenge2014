<%@page import="net.skysnapper.util.Constants"%>
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
<%= Page.title("SkySnapper Upload Success") %>
<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>">
	<jsp:param value="upload-success" name="header-class"/>
</jsp:include>

<%
	PhotoPost photo = (PhotoPost) request.getAttribute(Constants.Attributes.PHOTO);
%>
<div class="row">
	<div class="col-md-12 centred">
		<h2>Thank you SkySnapper for uploading your snap!</h2>
		
		<p><img src="<%= photo.getURL() %>=s400" /></p>
		
		<div data-photoid="<%= photo.getId() %>">
			<p>We are now analysing your photograph.</p>
			<img src="/images/ajax-loader.gif" />
		</div>
		<div class="analysis">
			<h2>Your sky colour is given below</h2>
			<div class="averageColour"></div>
		</div> 
		
	</div>
</div>
<script type="text/javascript">
	$(".analysis").hide();
	$(function(){
		setTimeout(pollForPhotoData, 2000);
	});
</script>
</body>
</html>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>