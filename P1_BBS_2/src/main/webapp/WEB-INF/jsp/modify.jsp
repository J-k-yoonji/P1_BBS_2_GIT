<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl의 출력과 포맷 적용 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div id="nav">
	<%@ include file="../jsp/nav.jsp"%>
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">
				<a href="/boardList">목록</a> > 글 수정
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<!--                                            <h1>게시물 작성3</h1> -->
				<!--중요 : action 필요 / 여기 수정폼에선 form name="upLoadFile" 라고 적으면 안되는 이유를 생각해보자. ? -->
				<form method="post" enctype="multipart/form-data" action="/modify"
					name="upLoadFile">

					<!-- 바뀌면 안되는 정보는 label로 바로 출력한다. (번호) -->
					<div class="form-group">
						<label>번호 </label> <input class="form-control" name="bno"
							value="${view.bno}" readonly="readonly" /><br />
					</div>

					<div class="form-group">
						<label>제목 </label> <input id="title" class="form-control"
							type="text" name="title" value="${view.title}" /><br />
					</div>

<!-- 					<div class="form-group"> -->
<!-- 						<label>작성자 </label> <input id="id" class="form-control" -->
<%-- 							type="text" name="id" value="${view.id}" /><br /> --%>
<!-- 					</div> -->

					<div class="form-group">
						<label>내용&nbsp;</label>
						<textarea id="content" class="form-control" cols="50" rows="3"
							name="content">${view.content}</textarea>
					</div>
					<br />

					<div class="form-group">
						<label>첨부파일</label>

						<div class="uploadImg">
							<div class="filebox"
								style="width: auto; height: auto; line-height: 0.8;">
								<input class="upload-name" type="hidden"
									value="${view.imageFileName}" readonly="readonly"> <input
									type="file" id="file1" class="upload-hidden" name="file1"
									value="${view.imageFileName}" accept=" image/*" /> <br />
							</div>
							<img id="previewImg" src="/filepath/${view.newFileName}"
								style="display: none;" width=200 height=200 /> <img
								id="previewImg2" src="/filepath/${view.newFileName}"
								class="preFileImg" style="display: block;" width=200 height=200 />
							<input class="upload-name" type="hidden"
								value="${view.newFileName}" name="preFileName"
								readonly="readonly">
						</div>


						<!--      <div class="uploadImg"> -->
						<!--        <div class="filebox" style="width: auto; height: auto; line-height: 0.8;" > -->
						<%--           <input  type="hidden" class="upload-name" value="${view.imageFileName}" readonly= "readonly" > --%>
						<%--           <input type="file" id="file1" class="upload-hidden" name="file1" value="${view.imageFileName}" accept=" image/*" /> <br/> --%>
						<!--        </div>   -->
						<%--            <img id="previewImg" src= "/filepath/${view.newFileName}" style= "display:  ; " width = 200 height = 200 /> --%>
						<%--           <input type="hidden" class="upload-name" value="${view.newFileName}" name="preFileName"  readonly= "readonly" > --%>
						<!--      </div>    -->




					</div>
					<br />
					<!--       window.open -> 새창 넘어옴 location.href 를 쓰는게 나을듯 -->
					<p>
						<button type="submit" class="btn btn-success"
							onClick="return validateForm()">수정 완료</button>
					</p>

				</form>


			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->

<%@include file="./includes/footer.jsp"%>
<!--  <h1>부트스트랩 이 위까지</h1> -->

<script type="text/javascript">
//          자바스크립트 전역변수

    $(document).ready(function(){
        //파일첨부 이벤트
        $('.filebox .upload-hidden').on('change', function(){ 
        	var fileExist = $(this)[0].files.length;
        	if(fileExist == 0) {
        		$('#previewImg').css('display', 'none');
        		$('#previewImg2').css('display', '');
        		return false;
        	} 
//         	else {
//         		$('#previewImg2').css('display', 'none');
//         	}
        	  
            //
            if(window.FileReader){
             
                var filename = $(this)[0].files[0].name;
                
                if(!validFileType(filename)){
                    $(this).val("");
                    console.log(this);
                    console.log($(this));
                    alert("확장자가 .jpg 또는 .png 인 파일만 업로드가 가능합니다.");
                    $("#previewImg").attr("style", "display: none ; " );
                    return false;
                }else if(!validFileSize($(this)[0].files[0])){
                    $(this).val("");
                    alert("파일 사이즈가 10MB를 초과합니다.");                    
                    $("#previewImg").attr("style", "display: none ; " );
                    return false;
                }              
                
            } 
            
            else {
            	//pop 메서드 : 배열의 마지막 요소를 제거한 후, 제거한 요소를 반환
            	//split 메서드: string.split( '분할기준', limit(분할최대개수(선택사항)) )
                var filename = $(this).val().split('/').pop().split('\\').pop();
                //input upload-name 에 파일명 설정해주기
                $(this).prev().val(filename); 
                $(this).val(filename); 
            } 

            readImage($(this)[0]); //미리보기
        });
    });

//코드숙지.
    function validFileType(filename) {
        const fileTypes = ["png", "jpg"];
        return fileTypes.indexOf(filename.substring(filename.lastIndexOf(".")+1, filename.length).toLowerCase()) >= 0;
    }
    
    function validFileSize(file){
        if(file.size > 10485760){ //10MB
            return false;
        }else{
            return true;
        }
    }


    //이미지 띄우기
    function readImage(input) {
        if(input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e){
                const previewImage = document.getElementById("previewImg");
                previewImage.src = e.target.result;
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0]);
            $("#previewImg").attr("style", "display : block ;" );
            $('#previewImg2').css('display', 'none');
//             $("#previewImg2").attr("style", "display : none ; " );
        } else {
            return true;
        }
    }
    
    // 게시글 전체 업로드 함수
    function validateForm() {
      
//        var file1 = document.upLoadFile.file1.value;
        
       if( $('#title').val() == "" ){
           alert("제목을 입력해주십시오"); 
           $('#title').focus();
//         document.forms[0].title.focus();
//         document.getElementById( 'pw1' ).value;
           return false;
       }else if( $('#id').val() == "" ){
           alert("작성자를 입력해주십시오");
           $('#id').focus();
           return false;
       }else if( $('#content').val() == "" ){
           alert("내용을 입력해주십시오");
           $('#content').focus();
           return false;
       }else {
           alert(" 글수정이 완료되었습니다! "); 
           
           document.upLoadFile.method = "post";
           document.upLoadFile.action = "modify";
           document.upLoadFile.submit();  

       }
    }   
</script>

<%-- <%@include file="./includes/footer.jsp"%> --%>
<!-- <h1>부트스트랩 이 위까지</h1> -->
</body>

</html>