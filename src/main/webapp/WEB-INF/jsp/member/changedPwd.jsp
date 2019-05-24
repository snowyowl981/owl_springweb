<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!-- p.367 [리스트 13.18] 비밀번호 변경 화면 -->
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>개인정보</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<h2>비밀번호 변경 완료</h2>
	<p>비밀번호가 변경되었습니다.</p>
	<p>
		<a href="./">메인으로 가기</a>
	</p>
</body>
</html>