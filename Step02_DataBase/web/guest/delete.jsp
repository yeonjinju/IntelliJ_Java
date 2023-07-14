<%@ page import="guest.dto.GuestDto" %>
<%@ page import="guest.dao.GuestDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	//1. 삭제할 글의 정보를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String pwd=request.getParameter("pwd");
	//2. DB 에서 삭제 한다.
	GuestDto dto=new GuestDto();
	dto.setNum(num);
	dto.setPwd(pwd);
	boolean isSuccess= GuestDao.getInstance().delete(dto);
	//3. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/guest/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<%
			//삭제 성공이면 list.jsp 로 리다일렉트 이동시키기
			String cPath=request.getContextPath();
			response.sendRedirect(cPath+"/guest/list.jsp");
		%>
	<%}else{ %>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			location.href="${pageContext.request.contextPath }/guest/list.jsp";
		</script>
	<%} %>
</body>
</html>







