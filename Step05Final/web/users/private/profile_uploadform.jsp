
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>/users/private.profile_uploadform.jsp</title>
</head>
<body>
  <form action="upload.jsp" method="post" enctype="multipart/form-data">
    <label for="image">이미지</label>
    <input type="file" name="image" id="image" accept=".jpg, .jpng, .png, .gif, .JPG, .JPEG"/>
    <button type="submit">업로드</button>
  </form>
</body>
</html>
