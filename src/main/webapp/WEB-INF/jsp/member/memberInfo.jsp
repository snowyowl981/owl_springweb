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
	<h2>개인정보</h2>
	<p>${sessionScope.MEMBER.memberId }</p>
	<p>${sessionScope.MEMBER.email }</p>
	<p>${sessionScope.MEMBER.name }</p>
	<p>
		<a href="./app/member/changePwdForm">비밀번호 변경</a>
	</p>
</body>
</html>