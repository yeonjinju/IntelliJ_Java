<%@ page import="test.cafe.dao.CafeDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 1. GET 방식 파라미터로 전달되는 삭제할 파일의 글번호 읽어오기
    int num=Integer.parseInt(request.getParameter("num"));
    // 2. DB 에서 삭제하기
    boolean isSuccess= CafeDao.getInstance().delete(num);
    // 3. 응답하기 (리다일렉트)
    String cPath=request.getContextPath();
    response.sendRedirect(cPath+"/cafe/list.jsp");
%>

