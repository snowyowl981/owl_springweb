<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>개인정보</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<h2>비밀번호 변경</h2>
	<c:if test="${mode=='FAILURE' }">
		<p style="color: red;">현재 비밀번호가 틀립니다.</p>
	</c:if>
	<form action="./app/member/changePwd" method="post">
		<p>
			<label>현재 비밀번호 :</label><br /> <input type="password" name="currentPassword"
				required autofocus />
		</p>
		<p>
			<label>새 비밀번호 :</label><br /> <input type="password" name="newPassword"
				required />
		</p>
		<p>
			<button type="submit">확인</button>
		</p>
	</form>
</body>
</html>