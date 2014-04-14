<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@page import="net.skysnapper.util.Page"%>
<%@page import="net.skysnapper.util.JSPs"%>

<jsp:include page="<%= JSPs.START %>"></jsp:include>
<%= Page.title("SkySnapper Upload") %>
<jsp:include page="<%= JSPs.END %>"></jsp:include>
<jsp:include page="<%= JSPs.CONTENT_START %>"></jsp:include>

<jsp:include page="<%= JSPs.Admin.Fragments.NAVBAR %>"></jsp:include>

<div class="row">
	<div class="col-md-12">
	<h2>All photos (most recent first)</h2>

	<jsp:include page="<%= JSPs.Admin.Fragments.LIST %>"></jsp:include>

</div>
</div>
</body>
</html>

<jsp:include page="<%= JSPs.FOOTER %>"></jsp:include>