<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>게시판[mariaDB 연동 확인]</h1>

<p><button type="button" onclick="window.open('/write');">게시물 작성</button></p>

<table style="border:1px solid;">
	<thead>
		<tr>
		    <th>글번호</th>
		    <th>제목</th>
		    <th>작성자</th>
		    <th>작성일</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${list}" var="result">
			<tr>
 				<td>${result.bno}</td>
				<td>${result.title}</td>
				<td>${result.writer}</td> 
				<td>${result.regDate}</td> 
			</tr>
		</c:forEach>
	</tbody>
</table>


</body>
</html>