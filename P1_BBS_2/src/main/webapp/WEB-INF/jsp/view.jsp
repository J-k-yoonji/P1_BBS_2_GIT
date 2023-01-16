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
            <h2 class="page-header">글 조회</h2>
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
<!-- float:right;  -->

<%--     <button type="button" class="btn" onclick="location.href='/modify?bno=${view.bno}';">게시물 수정</button> --%>
<%--     <button type="button" class="btn" onclick="location.href='/delete?bno=${view.bno}';">게시물 삭제</button> --%>

<%--  위방식은 GET방식만 가능. 삭제버튼을 클릭했을때 "POST방식"으로 상대경로와 데이터를 전달해주기위해서 form태그를 새로 생성, 아래와같이 해야했음. --%>
<div align="right" style="float:right; margin:0px;" >
     <form name="myForm" action="/delete?bno=${view.bno}" method="POST"></form>
     <form name="myForm2" action="/deleteReWrite?bno=${view.bno}" method="POST"></form>
<!--    본인이 작성한 게시물만 수정,삭제가 가능하도록 처리. 수정,삭제 버튼 : 'session의 id값(로그인한 정보)'과  '작성자'가 동일하면 수정,삭제버튼 활성화   -->
  <c:if test="${sessionScope.id == view.id}" >  
    <button type="button" class="btn btn-info btn-sm" onclick="location.href='/modify?bno=${view.bno}';">글수정</button>
        <c:if test="${view.sortSeq lt 1}">
      <button type="button" class="btn btn-danger btn-sm" onclick="javascript:document.myForm.submit();">글삭제</button>
        </c:if>
        <c:if test="${view.sortSeq gt 0}">
      <button type="button" class="btn btn-danger btn-sm" onclick="javascript:document.myForm2.submit();">답글 삭제</button>
        </c:if>
  </c:if>
  <c:if test="${view.sortSeq lt 1}">
  <button type="button" class="btn btn-secondary btn-sm" onclick="javascript:goBoardReply();">답글쓰기</button>
  </c:if>
</div>


<p>
<form method="post" enctype="multipart/form-data">

<!-- TestController.java 컨트롤러 파일의 model.addAttribute("view", testVo); 부분의  "view" 속성 -->
<!--     <div class="form-group"> -->
<%--          <input class="form-control" name="groupNo"  placeholder="원글번호:${view.groupNo}/ sortSeq순서:${view.sortSeq}" readonly="readonly" /> --%>
<!--     </div>      -->
    <br/>
<!--     <div class="form-group" style="float:left;">   -->
    <div class="form-group">  
      <c:if test="${view.sortSeq gt 0}">
       <label>답글</label>
      </c:if>    
      <label>번호 </label>
       <input  class="form-control"  name="bno" id="bno" value="${view.bno}" readonly="readonly" >
<%--        <input style="width: 100px;display: block;" class="form-control"  name="recnt" id="bno" value="${view.recnt}" readonly="readonly" > --%>
<%--        <input class="form-control"  name="bno" value="${view.bno}" type="hidden" readonly="readonly" > --%>
    </div>

    <div class="form-group">
      <c:if test="${view.sortSeq gt 0}">
       <label>답글</label>
      </c:if>
      <label>제목 </label>      
       <input  class="form-control"  name="title" value="${view.title}" readonly="readonly" >
<%--        <input style="width: auto;" class="form-control"  name="title" value="${view.title}" readonly="readonly" > --%>
<%--        <input style="display: inline-block;" class="form-control"  name="title" value="${view.title}" readonly="readonly" > --%>
    </div>
    
    <div class="form-group">
      <c:if test="${view.sortSeq gt 0}">
       <label>답글</label>
      </c:if>    
      <label>작성자 </label>
       <input  class="form-control"  name="id" value="${view.id}" readonly="readonly" >
    </div>
<!--     float:left 사용시 마지막에 아래태그 꼭 써주기! -->
    <p style=clear:both;></p>


    <div class="form-group">
      <span>
      <c:if test="${view.sortSeq gt 0}">
       <label>답글</label>
      </c:if>    
      <label>내용&nbsp;</label>
      <textarea class="form-control"  cols="50" rows="3" name="content" readonly="readonly" >${view.content}</textarea>
       <input class="form-control" type="hidden" name="content" value="${view.content}" readonly="readonly" > 
      </span>
    </div><br/>    
    
    <div>${contextPath}</div>
    
<%--   <c:if test="${null ne view.imageFileName}"> --%>
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
    </div>    
<%--   </c:if>        --%>
<!-- </form> -->
<!-- <p/> -->
<!--     <div class="class1"></div>    -->
<!-- <div> -->
<hr>
</form>
<p/>
<div>
	
	<fieldset>
	<label>댓글</label>
<!--       댓글이 있으면 게시글 이름 옆에 출력하기! -->
      <c:if test="${view.recnt > 0 }">
       <span style="color: blue;">(${view.recnt})
       </span>
      </c:if>
	<textarea class="form-control" id="replytext" cols="50" rows="3" name="reply" placeholder="댓글을 남겨주세요" style="padding: 0.5em 0.7em;"></textarea><br>
	  <input type="submit" id="btnReply" class="btn btn-secondary btn-sm" value="댓글등록" />
<!-- 	  onclick="return goReply();" -->
	</fieldset>
	<br/>
	
</div>

<!-- 댓글목록 출력할 위치 -->
<div id="listReply"></div>

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
<script type="text/javascript">
/** 게시판 - 답글 페이지 이동 */
//  view.jsp파일의 여기에서 'reWrite?bno=${view.bno}' 라고  적어줌으로써, controller의  getReWrite 메서드에서 @RequestParam("bno") 로 bno를 가져와서 여러가지로 활용할 수 있는 것!

  $(document).ready(function(){
	  
     listReply("1"); // 댓글 목록 불러오기. Controller방식. 페이징 추가 후 "1"도 여기 추가!
     //listReply(); // 댓글 목록 json 리턴방식
	 
     //댓글등록 버튼 클릭 이벤트 (ajax로 처리)
     $("#btnReply").click(function(){
    	var replytext=$("#replytext").val();
    	var bno="${view.bno}"
    	var param="replytext="+replytext+"&bno="+bno;
    	$.ajax({
    		type: "post",
    		url: "/reply/insert",
    		data: param,
    		success: function(){
    			document.getElementById("replytext").value=''; //댓글 작성후 댓글창 초기화!
    			alert("댓글이 등록되었습니다.");
    		    listReply("1"); //페이징 추가 후 "1"도 여기 추가!
    		    location.reload(); //댓글작성 후 새로고침해서 댓글(댓글수) 최신화해주기!
    		    
    		}
        });
    });
  });   
	  
		
	function goBoardReply()
    {
        location.href = 'reWrite?bno=${view.bno}';
    }

//     function goReply()
//     {
//     	if ($('#reply').val() == "") {
//             alert("댓글을 작성해주십시오");
//             $('#reply').focus();
//             return false;
//         } else {
// //             alert(" 댓글작성이 완료되었습니다! ");
//             document.upLoadReply.method = "post";
//             document.upLoadReply.action = "insert";
//             document.upLoadReply.submit();

//         }
//     }

    //댓글 쓰기 (json방식) (/insertRest이용)
//     function replyJson(){
//     	var replytext=$("#replytext").val();
//     	var bno="${view.bno}"
// //     	// 비밀댓글 체크여부
// //     	var secretReply = "n";
// //     	//태그.is(":속성") 체크여부 true/false
// //     	if($("#secretReply").is(":checked") ) {
// //     		secretReply = "y";
// //     	}
//     	$.ajax({
//     		type: "post",
//     		url: "/reply/insertRest",
//     		headers: {
//     			"Content-Type" : "application/json"
//     		},
//     		dataType: "text",
//     		//param형식보다 편하다고 함.
//     		data: JSON.stringyfy({
//     			bno : bno,
//     			replytext : replytext
// //     		  , secretReply : secretReply
//     		}),
//     		success: function() {
//     			alert("댓글이 등록되었습니다.");
//     			//댓글 입력 완료 후 댓글 목록 불러오기 함수 호출
//     			//listReply("1"); //전통적인 Controller방식
//     			//listReply2(); //json리턴 방식
//     			listReply("1"); //REST방식
//     		}
//     	});
    	
//     }
    
    //Controller방식
    //게시글 하단에 댓글들이 나타나게 구현. 댓글들 불러오는 방식: ajax를 이용하여 해당 게시물의 bno를 가지고 있는 댓글들을 모두 가져오는 방식을 이용.
    //댓글 목록1
    function listReply(num){
    	$.ajax({
    		type: "get",
    		url: "/reply/list?bno=${view.bno}&curPage=" +num,
    		success: function(result){
    			//responseText가 result에 저장됨.
    			$("#listReply").html(result);
    			
    		}		
    	});
    }
    
</script>

</body>
</html>