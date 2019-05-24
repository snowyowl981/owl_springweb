<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<p>
		<span><a href="./">홈</a></span> | <span><a href="./app/members">회원목록</a></span>
		| <span><a href="./app/article/list">게시판</a></span> |
		<!-- 로그인 여부에 따라 분기 -->
		<c:choose>
			<c:when test="${!empty sessionScope.MEMBER }">
				<!-- 로그인 했을 경우 -->
				<span><a href="./app/member/memberInfo">${MEMBER.name }</a></span> | 
			<span><a href="./app/logout">로그아웃</a></span>
			</c:when>
			<c:otherwise>
				<!-- 로그인 하지 않았을 경우 -->
				<span><a href="./app/loginForm">로그인</a></span> |
				<span><a href="./app/register/step1">회원가입</a></span>
			</c:otherwise>
		</c:choose>
	</p>
</header>