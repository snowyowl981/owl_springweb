<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${!empty param.returnUrl }">
		<!-- AuthCheckInterceptor에서 온 경우 (로그인이 필요한 화면에 접근한 경우) -->
		<c:set var="returnUrl" value="${param.returnUrl }" />
	</c:when>
	<c:when test="${!empty header.referer }">
		<!-- 메뉴에서 로그인 버튼을 눌렀을 경우 -->
		<c:set var="returnUrl" value="${header.referer }" />
	</c:when>
	<c:otherwise>
		<!-- 로그인 URL을 직접 쳤을 경우 -->
		<c:set var="returnUrl" value="/" />
	</c:otherwise>
</c:choose>
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
		<input type="text" name="returnUrl" value="${returnUrl }"
			style="width: 600px;" readonly />
	</form>
</body>
</html>