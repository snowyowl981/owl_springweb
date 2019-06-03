<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>받은편지함</title>
<style type="text/css">
table {
	margin-top: 10px;
	border-collapse: collapse;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	width: 100%;
}
th, td {
	padding: 5px 0;
}
th {
	border-bottom: 1px solid gray;
}
</style>
</head>
<body>
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
	
	<%@ include file="/WEB-INF/jsp/letterHeader.jsp"%>
	<h2>받은편지함</h2>
	<p>
		<a href="./app/letter/addForm">편지쓰기</a>
	</p>
	<p>전체 ${totalCount }건</p>
	<form action="./app/letter/listReceived">
		<input type="number" name="page" value="${param.page }" placeholder="페이지"
			min="1" max="${totalCount / 100 + 1 }" step="1" style="width: 75px;">
		<button type="submit">조회</button>
	</form>
	<table>
		<thead>
			<tr>
				<td>제목</td>
				<td>보낸 사람</td>
				<td>등록일시</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="letter" items="${letters}">
				<tr>
					<td><a href="./app/letter/view?letterId=${letter.letterId}&memberId=${letter.senderId}&mode=">${letter.title }</a></td>
					<td>${letter.senderName }</td>
					<td>${letter.cdate }</td>
				</tr>
            </c:forEach>
		</tbody>
	</table>
</body>
</head>
</html>