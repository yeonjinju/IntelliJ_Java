<%@ page import="member.dto.MemberDto" %>
<%@ page import="member.dao.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. post 방식으로 전송되는 회원의 이름, 주소를 추출한다.
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//추가할 회원 정보를 MemberDto 객체에 담는다.
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	//2. DB 에 저장한다.
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.insert(dto); //작업의 성공여부가 리턴된다.
	//3. 응답한다.
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p class="alert alert-success">
				<strong><%=name %></strong> 님의 정보가 저장되었습니다.
				<a class="alert-link" href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p class="alert alert-warning">
				회원정보 저장 실패! 
				<a class="alert-link" href="insertform.jsp">다시 작성</a>
			</p>
		<%} %>
	</div>
</body>
</html>













