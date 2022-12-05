<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>mariaDB 연동 확인</h1>

<table style="border:1px solid;">
	<thead>
		<tr>
		    <th>ID</th>
		    <th>이름</th>
		    <th>이메일</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${list}" var="result">
			<tr>
				<td>${result.userID}</td>
				<td>${result.userName}</td>
				<td>${result.userEmail}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


</body>
</html>