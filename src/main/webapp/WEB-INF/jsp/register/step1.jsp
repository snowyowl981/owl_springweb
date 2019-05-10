<!doctype html>
<!-- 
p.271 [리스트 11.6] 약관 동의 화면 
-->
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>회원가입</title>
</head>
<body>
	<h2>약관</h2>
	<p>약관 내용</p>
	<form action="./app/register/step2" method="post">
		<input type="checkbox" name="agree" value="true">약관 동의
		<button type="submit">다음 단계</button>
	</form>
</body>
</html>