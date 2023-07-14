<%--
  Created by IntelliJ IDEA.
  User: acorn
  Date: 2023-06-07
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<div class="container">
  <h1>비밀번호 수정 페이지</h1>
  <form action="pwd_update.jsp" method="post" id="myform">
    <div>
      <label for="pwd">기존 비밀번호</label>
      <input type="password" name="pwd" id="pwd">
    </div>
    <div>
      <label for="newPwd">새 비밀번호</label>
      <input type="password" name="newPwd" id="newPwd">
    </div>
    <div>
      <label for="pwd">새 비밀번호 확인</label>
      <input type="password" id="newPwd2">
    </div>
    <button type="submit">수정하기</button>
    <button type="reset">리셋</button>
  </form>
</div>
<script>
  // 폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고
  document.querySelector("#myForm").addEventListener("submit", (e)=>{
    // 입력한 새 비밀번호 2개를 읽어와서
    let pwd1=document.querySelector("#newPwd").value;
    let pwd2=document.querySelector("#newPwd2").value;
    // 만일 새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
    if(pwd1 != pwd2){
      alert("비밀번호를 확인하세요.");
      e.preventDefault();
    }
  });
</script>
</body>
</html>
