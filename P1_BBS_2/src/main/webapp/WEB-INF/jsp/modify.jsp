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

<h1>게시물 수정</h1>

<div id="nav">
     <%@ include file="../jsp/nav.jsp" %>
</div>

<!-- <div>
    <p><button type="button" class="btn" onclick="location.href='/testList';">목록으로</button></p>
</div> -->

<!--중요 : action 필요 -->
<form method="post" action="/modify" >

<!-- 바뀌면 안되는 정보는 label로 바로 출력한다. (번호) -->
      <label>번호 :</label>
      <label class="lbl" >${view.bno}</label><br/><br/>
		<input type="hidden" name="bno" value="${view.bno}"/>

      <label>제목 :</label>
      <input type="text" name="title" value="${view.title}" /><br/><br/>

      <label>작성자 :</label>
      <input type="text" name="writer" value="${view.writer}" /><br/><br/>
		
    <div style="display:flex;">
      <label>내용&nbsp;</label>
      <textarea cols="50" rows="5" name="content">${view.content}</textarea><br/>
    </div>  
<!--       window.open -> 새창 넘어옴 location.href 를 쓰는게 나을듯 -->
      <p><button type="submit" class="btn" >수정 완료</button></p>

</form>

</body>

</html>