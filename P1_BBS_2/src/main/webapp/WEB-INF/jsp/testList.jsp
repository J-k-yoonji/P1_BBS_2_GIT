<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardHome</title>

    <style>
      table {
        width: 600px;
        height: 400px;
      }
      
      .trlink:hover {
          color: #FF1E9D;
      }
    </style>

</head>
<body>

<h1>게시판 목록</h1>

<div id="nav">
     <%@ include file="../jsp/nav.jsp" %>
</div>

<!-- <div>
    <p><button type="button" class="btn" onclick="location.href='/write';">게시물 작성</button></p>
</div> -->

<table style="border:1px solid; text-align: center;">
	<thead>
		<tr>
		    <th>번호</th>
		    <th>제목</th>
		    <th>작성자</th>
		    <th>작성시간</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${list}" var="result">
<!-- 			<tr  onclick=window.open("/view?bno=${result.bno}","_self") style='cursor:pointer; border:0; margin:0; '> -->
			<tr class="trlink" onclick="location.href='/view?bno=${result.bno}';" style='cursor:pointer;  '>
 				<td>${result.bno}</td>
				<td>${result.title}</td>
<%-- 				<td><h4 class="hlink">${result.title}</h4></td> --%>
				<td>${result.writer}</td> 
				<td>${result.regDate}</td> 
			</tr>
		</c:forEach>
	</tbody>
</table>


</body>
</html>