<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    //폼전송되는 title, content 읽어내기
    String title=request.getParameter("title");
    String content=request.getParameter("content");
    //글작성자 얻어내기
    String writer=(String)session.getAttribute("id");
    //CafeDto 에 담기
    CafeDto dto=new CafeDto();
    dto.setWriter(writer);
    dto.setTitle(title);
    dto.setContent(content);
    //DB 에 저장하기
    boolean isSuccess=CafeDao.getInstance().insert(dto);
    //응답하기
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>/cafe/private/insert.jsp</title>
</head>
<body>
<div class="container">
    <%if(isSuccess){ %>
    <p>
        새글을 저장했습니다.
        <a href="${pageContext.request.contextPath }/cafe/list.jsp">확인</a>
    </p>
    <%}else{ %>
    <p>
        글 저장 실패
        <a href="insertform.jsp">다시 작성하러 가기</a>
    </p>
    <%} %>
</div>
</body>
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
    var oEditors = [];

    //추가 글꼴 목록
    //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "content",
        sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",
        htParams : {
            bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function(){
                //alert("완료!");
            }
        }, //boolean
        fOnAppLoad : function(){
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
        },
        fCreator: "createSEditor2"
    });

    function pasteHTML() {
        var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
        oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
    }

    function showHTML() {
        var sHTML = oEditors.getById["content"].getIR();
        alert(sHTML);
    }

    function submitContents(elClickedObj) {
        //SmartEditor 에 의해 만들어진(작성한글) 내용이 textarea 의 value 가 되도록 한다.
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.

        // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.

        try {
            //폼 제출하기
            elClickedObj.form.submit();
        } catch(e) {}
    }

    function setDefaultFont() {
        var sDefaultFont = '궁서';
        var nFontSize = 24;
        oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
    }
</script>
</html>