
<%@page import="java.util.List"%>
<%@ page import="main.java.test.member.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request scope 에 "list" 라는 키값으로 담긴 List<MemberDto> 객체의 참조값 얻어내기 
	List<MemberDto> list=(List<MemberDto>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
</head>
<body>
	<h3>회원 목록 입니다.</h3>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>	
			<%for(MemberDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
				</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>





