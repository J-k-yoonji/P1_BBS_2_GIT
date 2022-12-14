<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
  function fn_validate() {
      var upLoadFile = document.upLoadFile;
      var file1Origin = upLoadFile.file1;
      var file1 = upLoadFile.file1.value;
      var fileName = file1.substr(-3);
      
      var file1Size = document.upLoadFile.file1.files[0].size ; 
/*    var file1Size = file1Origin.size; */
/*    var file1Size = returnFileSize(file1Origin.size); */
      
      
/*    참고 : console.log(document.upLoadFile.file1.files); 로 먼저 files 리스트에 들어있는  값을 확인해보자. key: size / value:  3120396 (파일사이즈byte )*/    
      console.log(document.upLoadFile.file1.files[0].size);
/*       console.log(file1Size); */
      console.log(file1);
/*         if (file1 == 동영상. ) */
      /* alert(fileName); */ 
      
      var file1SizeMB = file1Size / 1024 / 1024 ;
      console.log(file1SizeMB);
      
       if ( (file1SizeMB < 1 )
              && (fileName == "mp4" || fileName == "jpg" || fileName == "png") ) {
          upLoadFile.method = "post";
          upLoadFile.action = "write";
          upLoadFile.submit();  
          alert(" 글 작성완료! ");          

      } else if (file1SizeMB >= 1) {
          alert(" 1 MB 미만의 파일만 업로드가 가능합니다.");
      } else {
          alert(".mp4 또는 .jpg 또는 .png 파일형식만 업로드가 가능합니다.");
      }
  }
  
</script>

<title>게시물 작성</title>
</head>

<body>

<h1>게시물 작성</h1>

<div id="nav">
     <%@ include file="../jsp/nav.jsp" %>
</div>

<form name="upLoadFile" method="post" enctype="multipart/form-data" action="/write" >

      <label>제목 :</label>
      <input type="text" name="title" /><br/><br/>

      <label>작성자 :</label>
      <input type="text" name="writer" /><br/><br/>

    <div style="display:flex;">
        <label>내용&nbsp;</label>
        <textarea cols="50" rows="5" name="content"></textarea>
    </div>
    
      파일1: <input type="file" name="file1" id="file1" ><br>
      
      <p><input type="button" class="input_btn" onClick="fn_validate()" value="작성 완료"/></p>

</form>

<!-- 서블릿에 요청해 파일업로드 -->
<!-- 중요 : 서블릿 파일인 FileUpload.java에서 생성한 "/서블릿매핑이름"을 form의 action에 써준다. 참고 : @WebServlet("/upload") -->
<!-- <form action="upload" method="post" enctype="multipart/form-data" >
  파일1: <input type="file" name="file1" ><br>
  파일2: <input type="file" name="file2" ><br>
  매개변수1: <input type="text" name="param1" ><br>
  매개변수2: <input type="text" name="param2" ><br>
  매개변수3: <input type="text" name="param3" ><br>
  <input type="submit" value="업로드" ><br>
</form>
 -->
</body>

</html>