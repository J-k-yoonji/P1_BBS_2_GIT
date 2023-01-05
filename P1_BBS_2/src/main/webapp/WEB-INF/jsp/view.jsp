<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    <!-- jstl의 출력과 포맷 적용 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp" %>

<%-- <c:set  var="contextPath" value="${pageContext.request.contextPath}" /> --%>
<%
  request.setCharacterEncoding("utf-8");
%>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">글 조회</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
               <div id="nav">
                    <%@ include file="../jsp/nav.jsp" %>
               </div>                     
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading"><a href="/boardList" >목록</a> > 글 조회</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

<p>
<form method="post" enctype="multipart/form-data">

<!-- TestController.java 컨트롤러 파일의 model.addAttribute("view", testVo); 부분의  "view" 속성 -->
    <div class="form-group"> 
      <label>번호 </label>
       <input class="form-control"  name="bno" value="${view.bno}" readonly="readonly" ><br/>
    </div>

    <div class="form-group">
      <label>제목 </label>
       <input class="form-control"  name="title" value="${view.title}" readonly="readonly" ><br/>
    </div>

    <div class="form-group">
      <label>작성자 </label>
      <%--  <input class="form-control"  name="id" value="${view.id}" readonly="readonly" ><br/> --%>
       <input class="form-control"  name="id" value="${view.id}" readonly="readonly" ><br/>
             
    </div>

    <div class="form-group">
      <label>내용&nbsp;</label>
      <textarea class="form-control"  cols="50" rows="3" name="content" readonly="readonly" >${view.content}</textarea>
       <input class="form-control" type="hidden" name="content" value="${view.content}" readonly="readonly" > 
    </div><br/>    
    
    <div>${contextPath}</div>

    <div class="form-group">
       <label>첨부파일</label><br/>
       <input class="form-control" name="imageFileName" value="${view.imageFileName}" readonly="readonly" style="width: auto; height: auto; line-height: 0.8;" > 
<%--        <input class="form-control" type="hidden" name="imageFileName" value="${view.imageFileName}" readonly="readonly" style="display:inline-block" > --%>
<%--        <input class="form-control" type="hidden" name="imageFileName" value="${view.imageFileName}" readonly="readonly" > --%>
<%--        <img src= "${contextPath}/file?bno=${view.bno}&imageFileName=${view.imageFileName}"  width = 200 height = 200 id="preview" /> --%>
<%--        <img src= "${contextPath}/file?bno=${view.bno}&imageFileName=${view.imageFileName}"  width = 200 height = 200 id="preview" /> --%>
       <img src= "/filepath/${view.newFileName}" style="margin-top: 6px; width:200px; height:200px;" id="preview" />
<%--        <img src= "/filepath/${view.imageFileName}"  width = 200 height = 200 id="preview" /> --%>
<!--        <img src= "Sunflower.jpg"  width = 200 height = 200 id="preview" /> -->
    </div><br/>    
         
</form>
</p>

<!--     <div class="class1"></div>    -->
<!-- <div> -->
<%--     <button type="button" class="btn" onclick="location.href='/modify?bno=${view.bno}';">게시물 수정</button> --%>
<%--     <button type="button" class="btn" onclick="location.href='/delete?bno=${view.bno}';">게시물 삭제</button> --%>

<%--  위방식은 GET방식만 가능. 삭제버튼을 클릭했을때 "POST방식"으로 상대경로와 데이터를 전달해주기위해서 form태그를 새로 생성, 아래와같이 해야했음. --%>
<div>
     <form name="myForm" action="/delete?bno=${view.bno}" method="POST"></form>
<!-- 	본인이 작성한 게시물만 수정,삭제가 가능하도록 처리. 수정,삭제 버튼 : 'session의 id값(로그인한 정보)'과  '작성자'가 동일하면 수정,삭제버튼 활성화	 -->
  <c:if test="${sessionScope.id == view.id}" >	
	<button type="button" class="btn btn-info" onclick="location.href='/modify?bno=${view.bno}';">게시물 수정</button>
    <button type="button" class="btn btn-danger" onclick="javascript:document.myForm.submit();">게시물 삭제</button>
  </c:if>
</div>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            
            

<%@include file="./includes/footer.jsp" %>

<!-- <h1>부트스트랩 이까지</h1> -->


</body>
</html>