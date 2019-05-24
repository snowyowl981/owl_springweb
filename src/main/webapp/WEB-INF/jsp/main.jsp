<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!-- p.291 [리스트 11.18] main 화면 -->
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>메인</title>
</head>
<body>
	<h2>Welcome to Springweb!</h2>
	<!-- 로그인 여부에 따라 분기 -->
	<c:choose>
		<c:when test="${!empty sessionScope.MEMBER }">
			<!-- 로그인 했을 경우 -->
			<p>memberId: ${MEMBER.memberId }, email: ${MEMBER.email }, name:
				${MEMBER.name }</p>
			<p>
				<a href="./app/logout">[로그아웃]</a>
			</p>
		</c:when>
		<c:otherwise>
			<!-- 로그인 하지 않았을 경우 -->
			<p>
				<a href="./app/loginForm">[로그인]</a>
			</p>
			<p>
				<a href="./app/register/step1">[회원 가입]</a>
			</p>
		</c:otherwise>
	</c:choose>
	<p>
		<a href="./app/members">[회원 목록]</a>
	</p>
	<p>
		<a href="./app/article/list">[게시판]</a>
	</p>
</body>
</head>
</html>