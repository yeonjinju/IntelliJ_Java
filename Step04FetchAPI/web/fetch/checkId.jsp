<%--
  Created by IntelliJ IDEA.
  User: acorn
  Date: 2023-05-31
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json; charset=UTF-8" language="java" %>
<%
  // 1. GET 방식 파라미터로 전달되는 아이디 읽어내기
  String inputId=request.getParameter("inputId");
  // 2. DB 에 이미 존재하는 아이디 인지 알아내서 사용가능 여부를 판정한다.
  boolean canUse=false;
  if(inputId.equals("gura")|| inputId.equals("monkey")){
    canUse=false;
  }
  // 3. JSON 으로 사용가능 여부를 응답한다.

%>
{"canUse":<%=canUse%>}