<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 조회</title>

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


<div id="nav">
     <%@ include file="../jsp/nav.jsp" %>
</div>

<!-- <div>
    <p><button type="button" class="btn" onclick="location.href='/testList';">목록으로</button></p>
</div> -->

<%-- <p>
 <form style="border:0; margin:0; " method="post">
      
  <table id= "tab" style="border:1px solid; ">
	<thead>
		<tr>
		    <th class="th01" >번호</th>
		    <th class="th02" >제목</th>
		    <th class="th03" >내용</th>
		    <th class="th04" >작성자</th>
		    <th class="th05" >작성시간</th>
		</tr>
	</thead>
	
	<tbody>

			<tr>
 				<td class="td01" >${view.bno}</td>
 				<td class="td02" >${view.title}</td>
 				<td class="td03" >${view.content}</td>
				<td class="td04" >${view.writer}</td> 
				<td class="td05" >${view.regDate}</td> 
			</tr>

	</tbody>
  </table>
      
 </form>
</p> --%>

<p>
<form method="post">

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
          
</form>
</p>

<div>
    <button type="button" class="btn" onclick="location.href='/modify?bno=${view.bno}';">게시물 수정</button>
    <button type="button" class="btn" onclick="location.href='/delete?bno=${view.bno}';">게시물 삭제</button>
</div>

</body>

</html>