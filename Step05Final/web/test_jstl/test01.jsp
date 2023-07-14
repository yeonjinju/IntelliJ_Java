<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>/test_jstl/test01.jsp</title>
</head>
<body>
  <h1>JSTL 반복문</h1>
  <c:forEach var="i" begin="1" end="10">
    <p>안녕 <strong>${i }</strong></p>
  </c:forEach>
</body>
</html>
