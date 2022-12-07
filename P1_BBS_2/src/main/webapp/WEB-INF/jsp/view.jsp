<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 조회</title>
</head>

<body>

<h1>게시물 조회</h1>

<form method="post">

      <label>제목</label>
      <input type="text" name="title" /><br/>

      <label>작성자</label>
      <input type="text" name="writer" /><br/>

      <label>내용</label>
      <textarea cols="50" rows="5" name="content"></textarea>
      
</form>

</body>

</html>