<%@ page import="test.file.dao.FileDao" %>
<%@ page import="test.file.dto.FileDto" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 1. 삭제할 파일의 번호를 이용해서
    int num=Integer.parseInt(request.getParameter("num"));
    // 2. 삭제할 파일의 정보를 DB 에서 읽어오기(얻어온다)
    FileDto dto=FileDao.getInstance().getData(num);

    // 로그인된 아이디와 글의 작성자가 일치하는지 확인하기
    String id=(String)session.getAttribute("id");
    if(!dto.getWriter().equals(id)){
        // 에러 응답하기
        response.sendError(HttpServletResponse.SC_FORBIDDEN,"님의 파일을 지우면 호온나");
        // 메소드를 여기서 끝내기
        return;
    }

    // 3. 파일 시스템에서 삭제한다. (webapp/upload 폴더에서 해당 파일을 삭제)
    String path=application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
    File f = new File(path);
    f.delete();
    // 4. DB 에서 삭제한다.
    FileDao.getInstance().delete(num);
    // 5. 응답하기
    String cPath=request.getContextPath();
    response.sendRedirect(cPath+"/file/list.jsp"); // 파일 목록보기로 다시 리다일렉스 이동시킨다.
%>
