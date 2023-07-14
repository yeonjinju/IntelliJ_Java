<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>/promise/test05.jsp</title>
</head>
<body>
<h1>Promise 테스트</h1>
<script>
    new Promise(function(resolve){
        resolve();
    }).then(function(result){
        console.log("첫번째 then() 안에 있는 함수 호출됨");
        //여기에서 다시 Promise 객체를 리턴하게 되면 뒤에 다시 .then() 을 호출할수 있다.
        return new Promise(function(resolve){
            resolve();
        });
    }).then(function(){
        console.log("두번째 then() 안에 있는 함수 호출됨")
    });
</script>
</body>
</html>








