<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
	<%
		//세션 영역에 "nick" 이라는 키값으로 저장된값 삭제하기
		session.removeAttribute("nick");
	%>
	<p>로그 아웃 되었습니다.</p>
	<a href="${pageContext.request.contextPath }/">인덱스로 가기</a>
</body>
</html>