<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>보낸편지함</title>
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
	<%@ include file="/WEB-INF/jsp/letterHeader.jsp"%>
	<h2>보낸편지함</h2>
	<p>
		<a href="./app/letter/addForm">편지쓰기</a>
	</p>
	<p>전체 ${totalCount }건</p>
	<form action="./app/letter/listSent">
		<input type="number" name="page" value="${param.page }" placeholder="페이지"
			min="1" max="${totalCount / 100 + 1 }" step="1" style="width: 75px;">
		<button type="submit">조회</button>
	</form>
	<table>
		<thead>
			<tr>
				<td>제목</td>
				<td>받는 사람</td>
				<td>등록일시</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="letter" items="${letters}">
				<tr>
					<td><a href="./app/letter/view?letterId=${letter.letterId}&memberId=${letter.receiverId}&mode=">${letter.title }</a></td>
					<td>${letter.receiverName }</td>
					<td>${letter.cdate }</td>
				</tr>
            </c:forEach>
		</tbody>
	</table>
</body>
</head>
</html>