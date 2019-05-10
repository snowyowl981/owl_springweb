<!doctype html>
<!-- 
p.277 [리스트 11.9] 회원가입 화면
 -->
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>회원가입</title>
</head>
<body>
	<h2>회원 정보 입력</h2>
	<form action="./app/register/step3" method="post">
		<p>
			이메일:<br> <input type="email" name="email" value="${param.email }">
		</p>
		<p>
			이름:<br> <input type="text" name="name" value="${param.name }">
		</p>
		<p>
			비밀번호:<br> <input type="password" name="password">
		</p>
		<p>
			비밀번호 확인:<br> <input type="password" name="confirmPassword">
		</p>
		<button type="submit">가입 완료</button>
	</form>
</body>
</html>