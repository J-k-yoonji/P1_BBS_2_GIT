<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<% 
 List dataList = new ArrayList();
 dataList.add("hello");
 dataList.add("world");
 dataList.add("안녕하세요");
%>

<c:set var="list00" value="<%=dataList %>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>테스트 메인 화면</h1>

<%-- <table style="border:1px solid;">
	<thead>
		<tr>
		    <th>ID</th>
		    <th>이름</th>
		    <th>이메일</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach var="result" items="${list00}">
			<tr>
				<td>${result}</td>
				<td>${result}</td>
				<td>${result}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
 --%>

</body>
</html>