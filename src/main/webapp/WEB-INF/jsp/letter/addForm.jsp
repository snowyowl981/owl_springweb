<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>편지쓰기</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
    <h1>편지쓰기</h1>
    <form action="./app/letter/add" method="post">
            편지제목:<br> <input type="text" name="title" value="${param.title }">

        <p>
            편지내용:<br><textarea name="content"></textarea>
        </p>
        <button type="submit">편지보내기</button>
        <input type="hidden" name="receiverId" value="${param.receiverId}" />
       <input type="hidden" name="receiverName" value="${param.receiverName}" />
    </form>
</body>
</html>