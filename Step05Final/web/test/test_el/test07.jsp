<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>/test/test_el/test07.jsp</title>
</head>
<body>
  <p>savedId 라는 키값으로 저장된 값 : ${cookie.savedId.value }</p>
  <p>savedId 라는 키값으로 저장된 값이 있는지 여부 : ${ not empty cookie.savedId}</p>
</body>
</html>
