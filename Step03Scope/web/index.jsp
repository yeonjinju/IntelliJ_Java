<%--
  Created by IntelliJ IDEA.
  User: gimmingyu
  Date: 2023/05/26
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>index</title>
</head>
<body>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="fortune">오늘의 운세</a></li>
		<li><a href="test/fortune.jsp">테스트</a></li>
		<li><a href="member">회원 한명의 정보 보기</a></li>
		<li><a href="friend/list">친구 이름 목록 보기</a></li>
		<li><a href="member/list">멤버 목록 보기</a></li>
		<li><a href="test/play.jsp">놀러가기(로그인된 클라이언트만 가능)</a></li>
	</ul>
	<form action="${pageContext.request.contextPath}/test/save.jsp" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력">
		<input type="submit" value="닉네임 기억 시키기">
	</form>
	<%
		String nick = (String) session.getAttribute("nick");
		if (nick != null) {
	%>
	<p> <strong><%= nick %></strong> 님 반갑습니다.</p>
	<a href="${pageContext.request.contextPath}/test/logout.jsp">로그아웃</a>
	<%
		}
	%>
</div>
</body>
</html>
