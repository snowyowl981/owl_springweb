<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!-- p.357 [리스트 13.7] 로그인 화면 수정 -->
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>로그인</title>
</head>
<body>
	<c:if test="${param.mode=='FAILURE' }">
		<p style="color: red;">이메일이 없거나 비밀번호가 틀립니다.</p>
	</c:if>
	<form action="./app/login" method="post">
		<p>
			<label>이메일 :</label><br /> <input type="email" name="email"
				value="${param.email }" required autofocus />
		</p>
		<p>
			<label>비밀번호 : </label><br /> <input type="password" name="password" required />
		</p>
		<p>
			<button type="submit">로그인</button>
		</p>
	</form>
</body>
</html>