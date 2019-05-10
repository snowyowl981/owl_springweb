<html>
<body>
	<h2>Error</h2>
	<p>Status code : <%=request.getAttribute("javax.servlet.error.status_code")%></p>
	<p>Exception : <%= request.getAttribute("javax.servlet.error.exception") %></p>
</body>
</html>