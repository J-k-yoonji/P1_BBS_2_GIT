<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 작성</title>
</head>

<body>

<h1>게시물 작성</h1>

<div id="nav">
     <%@ include file="../jsp/nav.jsp" %>
</div>

<form method="post" >

      <label>제목 :</label>
      <input type="text" name="title" /><br/><br/>

      <label>작성자 :</label>
      <input type="text" name="writer" /><br/><br/>

    <div style="display:flex;">
    	<label>내용&nbsp;</label>
        <textarea cols="50" rows="5" name="content"></textarea>
    </div>
      
      <p><button type="submit" class="btn" >작성 완료</button></p>

</form>

<!-- 서블릿에 요청해 파일업로드 -->
<!-- 중요 : 서블릿 파일인 FileUpload.java에서 생성한 "/서블릿매핑이름"을 form의 action에 써준다. 참고 : @WebServlet("/upload") -->
<form action="view" method="post" enctype="multipart/form-data" >
  파일1: <input type="file" name="file1" ><br>
  파일2: <input type="file" name="file2" ><br>
  매개변수1: <input type="text" name="param1" ><br>
  매개변수2: <input type="text" name="param2" ><br>
  매개변수3: <input type="text" name="param3" ><br>
  <input type="submit" value="업로드" ><br>
</form>

</body>

</html>