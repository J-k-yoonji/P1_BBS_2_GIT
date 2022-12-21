<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<%-- <c:set  var="contextPath" value="${pageContext.request.contextPath}" /> --%>
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- <c:set  var="file1" value="${pageContext.request.contextPath}" /> --%>

<title>게시물 조회_jQuery</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//   $(document).ready(function () {
// 	  alert($("#unique2").html());
//   });
  
//   window.onload = function(){
// 	  alert($("#unique2").html());
// // 	  $(".class1").html("<img src='../image/Sunflower.jpg'>");
// 	  $(".class1").html("<img src='/filepath/Sunflower.jpg'>");
// // 	  $(".class1").html("<img src='C:\file_repo\Sunflower.jpg'>");
//   };

</script>

<style>
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}

table {
	width: 600px;
	height: 400px;
}

th, td {
	vertical-align: top;
}

.th03, .td03 { width: 250px; }

.th02, .td02 { width: 100px; }

</style>

</head>

<body>

<h1>게시물 조회</h1>

<!-- <div id="unique2">제이쿼리입니다!!!!33</div> -->

<div id="nav">
     <%@ include file="../jsp/nav.jsp" %>
</div>

<!-- <div>
    <p><button type="button" class="btn" onclick="location.href='/testList';">목록으로</button></p>
</div> -->


<p>
<form method="post">

<!-- TestController.java 컨트롤러 파일의 model.addAttribute("view", testVo); 부분의  "view" 속성 -->
      <label>번호 :</label>
      <label class="lbl" >${view.bno}</label><br/>
       <input type="hidden" name="bno" value="${view.bno}"/><br/>

      <label>제목 :</label>
      <label class="lbl" >${view.title}</label><br/>
       <input type="hidden" name="title" value="${view.title}"/><br/>

      <label>작성자 :</label>
      <label class="lbl" >${view.writer}</label><br/>
       <input type="hidden" name="writer" value="${view.writer}"/><br/>

    <div style="display:flex;">
      <label>내용&nbsp;</label>
      <textarea disabled="disabled" cols="50" rows="5" name="content" >${view.content}</textarea>
       <input type="hidden" name="content" value="${view.content}"/><br/>  
    </div>   
    
    <div>${contextPath}</div>

    <div style="display:flex;" class="result-images" >
       <input type="hidden" name="imageFileName" value="${view.imageFileName}" />
<%--        <img src= "${contextPath}/file?bno=${view.bno}&imageFileName=${view.imageFileName}"  width = 200 height = 200 id="preview" /> --%>
<%--        <img src= "${contextPath}/file?bno=${view.bno}&imageFileName=${view.imageFileName}"  width = 200 height = 200 id="preview" /> --%>
       <img src= "/filepath/${view.imageFileName}"  width = 200 height = 200 id="preview" />
       <img src= "/filepath/${view.imageFileName}"  width = 200 height = 200 id="preview" />
<!--        <img src= "Sunflower.jpg"  width = 200 height = 200 id="preview" /> -->
    </div>    
         
</form>
</p>

<!--     <div class="class1"></div>    -->
<div>
    <button type="button" class="btn" onclick="location.href='/modify?bno=${view.bno}';">게시물 수정</button>
    <button type="button" class="btn" onclick="location.href='/delete?bno=${view.bno}';">게시물 삭제</button>
</div>

</body>

</html>