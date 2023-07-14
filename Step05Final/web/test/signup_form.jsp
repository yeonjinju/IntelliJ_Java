<%--
  Created by IntelliJ IDEA.
  User: acorn
  Date: 2023-06-08
  Time: 오후 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>/test/signup_form.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
  <h1>다양한 form 디자인</h1>
  <form action="signup">
    <div class="form-floating mb-2">
      <%--@declare id="id"--%><input class="form-control" type="text" name="id" id="text" placeholder="아이디 입력">
      <label class="form-label" for="id">아이디</label>
    </div>
    <div class="form-floating mb-2">
      <input class="form-control" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
      <label for="pwd">비밀번호</label>
    </div>
    <select class="form-select mb-2" id="job" name="job">
      <option value="">직업선택</option>
      <option value="programmer">프로그래머</option>
      <option value="doctor">의사</option>
    </select>
    <fieldset>
      <legend>성별체크</legend>
      <div class="form-check mb-2">  <!-- 한줄로 표시하고 싶으면 "form-check form-check-inline 사용"  -->
        <input class="form-check-input" value="man" type="radio" name="gender" id="one">
        <label class="form-check-label" for="one">남자</label>
      </div>
      <div class="form-check mb-2">
        <input class="form-check-input" value="woman" type="radio" name="gender" id="two">
        <label class="form-check-label" for="two">여자</label>
      </div>
    </fieldset>
    <fieldset>
      <legend>취미</legend>
      <div class="form-check-inline mb-2">
        <input type="checkbox" value="piano" name="hobby" class="form-check-input" id="piano">
        <label class="form-check-label" for="piano">피아노</label>
      </div>
      <div class="form-check-inline">
        <input type="checkbox" value="game" name="hobby" class="form-check-input" id="game">
        <label class="form-check-label" for="piano">게임</label>
      </div>
      <div class="form-check-inline">
        <input type="checkbox" value="etc" name="hobby" class="form-check-input" id="etc">
        <label class="form-check-label" for="piano">기타</label>
      </div>
    </fieldset>
    <fieldset>
      <legend>개인정보 활용 동의</legend>
      <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" id="allowAll">
        <label class="form-check-label" for="allowAll">전체 동의</label>
      </div>
      <div class="form-check form-switch mb-2">
        <input class="form-check-input allow" type="checkbox" value="yes" name="allowEmail" id="allowEmail">
        <label class="form-check-label" for="allowEmail">이메일 수신 여부</label>
      </div>
      <div class="form-check form-switch mb-2">
        <input class="form-check-input allow" type="checkbox" value="yes" name="allowMessage" id="allowMessage">
        <label class="form-check-label" for="allowMessage">광고성 문자 수신 여부</label>
      </div>
    </fieldset>
    <script>
      document.querySelector("#allowAll").addEventListener("change", (e)=>{
        // 모두 동의 체크 여부를 알아낸다.
        const isChecked=e.target.checked;
        // const allowEmail = document.querySelector("#allowEmail");
        // const allowMessage=document.querySelector("#allowMessage");
        // 클래스가 allow 인 모든 요소으 ㅣ참조값을 배열로 얻어내기
        const allows = document.querySelectorAll(".allow");
        // 반복문 돌면서
        // for(let i=0; i<allows.length; i++){
        //     // 모든 checkbox의 check상태를 바꿔주기
        //     allows[i].checked=isChecked;
        // }
        allows.forEach((item) => {
          item.checked=isChecked;
        });

        // if문을 활용하여
        // if(e.target.checked){
        //     allowEmail.checked=true;
        //     allowMessage.checked=true;
        // }else{
        //     allowEmail.checked=false;
        //     allowMessage.checked=false;
        // }
      });
    </script>
    <button class="btn btn-outline-primary" type="submit">가입</button>
  </form>
</div>
</body>
</html>
