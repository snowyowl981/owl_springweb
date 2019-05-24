<%@ page isErrorPage="true"%>
<!doctype html>
<!-- 에러 페이지 -->
<html>
<body>
	<h2>Error</h2>
	<p>
		Status code :
		<%=request.getAttribute("javax.servlet.error.status_code")%></p>
	<p>
		Exception :
		<%=exception.getCause()%></p>
</body>
</html>