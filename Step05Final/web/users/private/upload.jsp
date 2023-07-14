<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="test.users.dto.UsersDto" %>
<%@ page import="test.users.dao.UsersDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // 로그인된 아이디
  String id=(String)session.getAttribute("id");
  // 1. 파일을 저장할 서버에서의 실제 경로 구성하기
  String realPath= application.getRealPath("/upload");
  // 2. 아래의 MultipartRequest 객체가 예외없이 잘 생성되면 webapp/upload 폴더에 파일이 자동으로 저장된다.
  MultipartRequest mr=new MultipartRequest(request,
          realPath,     // 업로드된 파일을 저장할 경로
          1024*1024*50, // 최대 업로드 사이즈
          "utf-8",      // 한글 파일명 깨지지 않도록
          new DefaultFileRenamePolicy());

  // 3. MultipartRequest 객체의 메소드를 이용해서 폼 전송된 내용을 추출해야 한다/
  String saveFileName=mr.getFilesystemName("image"); // 저장된 파일명

  // DB에 저장할 이미지 경로 구성하기
  String imagePath="/upload/"+saveFileName;
  // DB에 수정 반영하고
  UsersDto dto=new UsersDto();
  dto.setId(id);
  dto.setProfile(imagePath);
  UsersDao.getInstance().updateProfile(dto);
  // 리다일렉트 응답하기
  String cPath=request.getContextPath();
  response.sendRedirect(cPath+"/users/private/info.jsp");
%>
