<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<script src="./js/jquery.js"></script>
<script type="text/javascript">
// var fileSize = 600;
// $(document).ready(function(){
function fn_validate() {	
      var upLoadFile = document.upLoadFile;
      console.log(upLoadFile);
      var file1Origin = upLoadFile.file1;
      console.log(file1Origin);
      var file1 = upLoadFile.file1.value;
      console.log(file1);
      var fileNameExt = file1.substr(-3);
      console.log(fileNameExt);
      var file1Size = document.upLoadFile.file1.files[0].size ; 
      console.log(file1Size);
//       console.log(file1);
      var file1SizeMB = file1Size/1024/1024 ;
      var limitSize = 2 ;

//   function fn_validate() {
	  
      console.log(file1);

      if (file1SizeMB >= limitSize ) {
    	  alert( limitSize + " MB 미만의 파일만 업로드가 가능합니다.");
          
      } else if ( (fileNameExt != "mp4" && fileNameExt != "jpg" && fileNameExt != "png") ) {
          alert("확장자가 .mp4 또는 .jpg 또는 .png 인 파일만 업로드가 가능합니다.");     
      }  else {
      } 
   
  
// 첨부파일 업로드  함수
  function fn_upload() {

       if ( (file1SizeMB < limitSize )
              && (fileNameExt == "mp4" || fileNameExt == "jpg" || fileNameExt == "png") ) {
          upLoadFile.method = "post";
          upLoadFile.action = "write";
                   
          alert(" 첨부파일 등록이 완료되었습니다! "); 

      }            
  } 

//게시글 전체 업로드 함수
  function fn_upload2() {
      
       if ( (file1SizeMB < limitSize )
              && (fileNameExt == "mp4" || fileNameExt == "jpg" || fileNameExt == "png") ) {
          upLoadFile.method = "post";
          upLoadFile.action = "write";
          upLoadFile.submit();  
                   
          alert(" 글작성이 완료되었습니다! "); 

      }            
  } 
  
// $(document).ready(function(){
// window.onload = function(){
function read(){
   $("#preview1").hide();    
  var domEleArray = [$('#file1').clone()];  
  
  function readURL(input)  {
	  
//       if( file1Size === undefined ) {
//           alert("첨부된 파일이 없습니다");
//           $("#preview1").hide();
//       } else {
//     	  var file1Size = document.upLoadFile.file1.files[0].size ; 
//       }
      
      if ( (input.files && input.files[0])  ) {
       var reader = new FileReader();
       reader.onload = function (e) {
    	   console.log(e);
    	   if(fileNameExt == 'mp4'){
//     		   $("#preview2").show();  
               $('#preview2').attr('src', e.target.result);
    	   } else {
    		   $("#preview1").show();  
	           $('#preview1').attr('src', e.target.result);    		   
    	   }
//            $('#preview2').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
       readURL(this);
    } 
      else {
        alert("첨부된 파일이 없습니다"); 
    }
 }
//readURL()--

  //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
  $("#file1").change(function(){ // 이미지 선택했을때
     alert("change");
     readURL(this);
  
//   if( input.files === undefined ) {
//   alert("첨부된 파일이 없습니다");
//   }
  
// !!!여기서 미리보기에 표시가 됨!!!  

  
//      if( input.files === undefined ) {
//     	 alert("첨부된 파일이 없습니다");
//     	 $("#preview1").hide();
//      }else {
//       readURL(this);
//      } 
  });
  
      $("#preview1").hide();
  
 }; 
}; 
  

</script>

<title>게시물 작성</title>
</head>

<body>

<h1>게시물 작성3</h1>

<div id="nav">
     <%@ include file="../jsp/nav.jsp" %>
</div>

<form name="upLoadFile" method="post" enctype="multipart/form-data" action="/write" >

      <label>제목 :</label>
      <input type="text" name="title" /><br/><br/>

      <label>작성자 :</label>
      <input type="text" name="writer" /><br/><br/>

    <div style="display:flex;">
        <label>내용&nbsp;</label>
        <textarea cols="50" rows="5" name="content"></textarea>
    </div><br/>
    
<!--       파일1: <input type="file" name="file1" id="file1" ><br> -->
<!-- onchange 안에 적힌 함수의 순서대로 함수가 실행된다!     -->
      파일1: <input type="file" name="file1" id="file1" onchange=" fn_validate(); fn_upload(); readURL(this);  "  accept="video/*, image/*" />
<!--       파일1: <input type="file" name="file1" id="file1" onchange="readURL(this); fn_validate(); fn_upload();"  accept="video/*, image/*" /> -->
<!--       파일1: <input type="file" name="file1" id="file1" onchange="readURL(this); fn_validate(); fn_upload();"  accept="video/*, image/*" /> -->
<!-- 파일취소 버튼 -->
<!--          <input type="button" value="취소" id="filecancle" /></td> -->
      <br/>
      
    
<%-- <c:if test=$   --%>  
        <img id="preview1"  src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width = 200 height = 200 /><br/>
  
 
  
<!--         <video id="preview2"  src="#" width = 200 height = 200 controls autoplay ></video><br/> -->
<!--       파일1: <input type="file" name="file1" id="file1"  accept="video/*, image/*" ><br> -->
      
 <p><input type="submit" class="input_btn" onClick="fn_upload2()" value="작성 완료"/></p>
<!--  <p><input type="button" class="input_btn" onClick="fn_validate()" value="작성 완료"/></p> -->

</form>



</body>

</html>