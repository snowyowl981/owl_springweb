<!doctype html>
<!-- p.358 [리스트 13.8] 로그인 성공 화면 수정 -->
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>로그인</title>
</head>
<body>
	<p>${sessionScope.MEMBER.name }님, 로그인에 성공했습니다.</p>
	<p>
		<a href="./">메인으로 가기</a>
	</p>
</body>
<body>