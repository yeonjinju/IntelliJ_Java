<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // 아이디
  String id=request.getParameter("id");
  // 비밓번호
  String pwd=request.getParameter("pwd");
  // 직업
  String job=request.getParameter("job");
  // 성별
  String gender=request.getParameter("gender");
  // 취미 (아무것도 체크하지 않았으면 null 이다)
  String[] hobby=request.getParameterValues("hobby");
  String hobbyResult="";
  if(hobby!=null){
    // 반복문 돌면서
    for (int i=0; i< hobby.length; i++){
      // i번째 방에 있는 선택된 취미를 불러온다.
      String tmp=hobby[i];
      hobbyResult=hobbyResult+tmp;
      if(i != hobby.length-1){
        hobbyResult+="/";
      }
    }
  }

  // 문자열에서 특정문자("/")로 구분해서 String[] 을 얻어내기
  String[] result=hobbyResult.split("/");

  // 문자열에 특정 문자가포함되어 있는지 여부
  boolean isContain = hobbyResult.contains("xxx");

  // null 이면 체크를 안한것이고 null이 아니면 체크를 한것이다.
  String allowEmail=request.getParameter("allowEmail");
  String allowMessage=request.getParameter("allowMessage");
  /*
      textarea 에 입력한 문자열은 개행, tab, 공백기호가 모두 포함되어 있다.
      해당 문자열을 DB에 저장했다가 다시 불러와서 textarea 에 출력하고 싶으면 textarea 의 innerText에 출력하면 된다.
   */
  String comment=request.getParameter("comment");
%>
<html>
<head>
    <title>/test/signup.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container">
    <h1>회원가입 결과</h1>
    <p>회원님의 정보를 성공적으로 저장했습니다.</p>
    <p><%=hobbyResult%></p>
    <form action="signup">
      <div class="form-floating mb-2">
        <%--@declare id="id"--%><input class="form-control" value="<%=id%>" type="text" name="id" id="text" placeholder="아이디 입력">
        <label class="form-label" for="id">아이디</label>
      </div>
      <div class="form-floating mb-2">
        <input class="form-control" type="password" value="<%=pwd%>" name="pwd" id="pwd" placeholder="비밀번호 입력">
        <label for="pwd">비밀번호</label>
      </div>
      <select class="form-select mb-2" id="job" name="job">
        <option value="">직업선택</option>
        <option value="programmer" <%=job.equals("programmer") ? "selected":"" %> >프로그래머</option>
        <option value="doctor" <%= job.equals("doctor") ? "selected":""%>>의사</option>
      </select>
      <fieldset>
        <legend>성별체크</legend>
        <div class="form-check mb-2">  <!-- 한줄로 표시하고 싶으면 "form-check form-check-inline 사용"  -->
          <input class="form-check-input" value="man" type="radio" name="gender" id="one" <%= gender.equals("man")?"checked":""%>>
          <label class="form-check-label" for="one">남자</label>
        </div>
        <div class="form-check mb-2">
          <input class="form-check-input" value="woman" type="radio" name="gender" id="two" <%= gender.equals("woman")?"checked":""%>>
          <label class="form-check-label" for="two">여자</label>
        </div>
      </fieldset>
      <fieldset>
        <legend>취미 체크</legend>
        <div class="form-check-inline mb-2">
          <input type="checkbox" value="piano" name="hobby" class="form-check-input" id="piano" <%= hobbyResult.contains("piano")?"checked":""%>>
          <label class="form-check-label" for="piano">피아노</label>
        </div>
        <div class="form-check-inline">
          <input type="checkbox" value="game" name="hobby" class="form-check-input" id="game" <%= hobbyResult.contains("game")?"checked":""%>>
          <label class="form-check-label" for="piano">게임</label>
        </div>
        <div class="form-check-inline">
          <input type="checkbox" value="etc" name="hobby" class="form-check-input" id="etc" <%= hobbyResult.contains("etc")?"checked":""%>>
          <label class="form-check-label" for="piano">기타</label>
        </div>
      </fieldset>
      <div>
        <label class="form-label" for="commemt">하고싶은말</label>
        <textarea class="form-control" name="comment" id="commemt" rows="10"><%="comment" %></textarea>
      </div>
      <fieldset>
        <legend>개인정보 활용 동의</legend>
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" id="allowAll">
          <label class="form-check-label" for="allowAll">전체 동의</label>
        </div>
        <div class="form-check form-switch mb-2">
          <input class="form-check-input allow" type="checkbox" value="yes" name="allowEmail" id="allowEmail"
            <%= allowEmail != null ? "checked":""%>>
          <label class="form-check-label" for="allowEmail">이메일 수신 여부</label>
        </div>
        <div class="form-check form-switch mb-2">
          <input class="form-check-input allow" type="checkbox" value="yes" name="allowMessage" id="allowMessage"
            <%= allowMessage != null ? "checked":""%>>
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




