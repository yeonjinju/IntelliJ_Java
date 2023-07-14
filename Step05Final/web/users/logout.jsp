<%--
  Created by IntelliJ IDEA.
  User: acorn
  Date: 2023-05-31
  Time: 오후 4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>/users/logout.jsp</title>
</head>
<body>
  <%
    //session scope 에 id라는 키값으로 저장된 값 삭제하기
    session.removeAttribute("id");
  %>
  <script>
    alert("로그아웃 되었습니다.");
    // javascript 를 이용해서 페이지 이동
    location.href="../index.jsp";
  </script>
</body>
</html>
