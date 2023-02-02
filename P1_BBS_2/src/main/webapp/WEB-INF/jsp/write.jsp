<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl의 출력과 포맷 적용 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h2 class="page-header">글 작성</h2>
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
				<a href="/boardList">목록</a> > 글 작성
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<!-- 		 <h1>게시물 작성3</h1>        -->
				<form name="upLoadFile" method="post" enctype="multipart/form-data" action="/write">
					
<!-- 					<div class="form-group"> -->
<%--                         <label>번호 </label> <input id="bno" class="form-control" name="bno" type="text" value="${view.bno}" readonly="readonly" /> --%>
<!--                     </div> -->
					
					<div class="form-group">
						<label>제목 </label> <input id="title" class="form-control" type="text" name="title" />
					</div>

<!-- 					<div class="form-group"> -->
<!-- 						<label>작성자 </label>  -->
<!-- <!-- 						 <input id="id" class="form-control" type="text" name="id" /><br /> -->
<%-- <%-- 						 <input class="form-control"  name="id" value="${view.id}" readonly="readonly" ><br/> --%>
<!-- 					</div> -->

					<div class="form-group wrap">
						<label>내용&nbsp;</label>
						<textarea id="content" class="form-control" cols="50" rows="3" name="content"></textarea>
					</div>


					<div class="form-group">
						<label>첨부파일</label>
<!-- 						        <input type="file" name="file1" id="file1" onchange="  readURL(this); fn_validate(); "  accept="video/*, image/*" /><br/> -->
<!-- 						        <img id="preview1"  src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width = 200 height = 200 /> -->
<!-- 						        <img id="previewImg"  src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width = 200 height = 200 /> -->

						<div class="uploadImg">
							<div class="filebox" style="width: auto; height: auto; line-height: 0.8;">
								<input class="upload-name" value="선택된 파일 없음" readonly="readonly" type="hidden">
							    <input type="file" id="file1" class="upload-hidden" name="file1" accept="image/*, video/*">
							</div>
							<img id="previewImg" width=auto height=200 style="display: none;" />
							<video  id="previewVideo" controls autoPlay muted src="#" class="image-box" width=auto height=200 style="display: none;"></video>

						</div>

					</div>
					<br />

					<p>
						<input type="submit" class="btn btn-success" onClick="return validateForm()" value="작성 완료" />
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

//파일사이즈 설정. 55 MB = 57671680 Bytes / 1048576
var fileSizeLimitMB = 550 ;  

    $(document).ready(function(){
        //파일첨부 change 이벤트 발생시마다, 미리보기에 변화를 주어야 한다!
        $('.filebox .upload-hidden').on('change', function(){           
        	var fileExist = $(this)[0].files.length;
        	var filename = $(this)[0].files[0].name;   //
        	//&& ( validFileType(filename) == 0 || validFileType(filename) == 1
        	if(fileExist == 0 ) {
        	    $('#previewImg').css('display', 'none');
        	    return false;
        	}
        	
        	//
            if (window.FileReader){
                
            	// $(this)[0].files[0].name 이 있으면  (파일이 있으면) 유효한 파일인지 확인 후, true일 경우 파일명저장 & 미리보기사진 띄어줌.
            	// $("#file1")[0].files[0].name  == $("#file1").val().split('/').pop().split('\\').pop() == pink.jpg
            	// jpg = console.log($("#file1")[0].files[0].name.substring($("#file1")[0].files[0].name.lastIndexOf(".")+1, $("#file1")[0].files[0].name.length).toLowerCase())
            	var filename = $(this)[0].files[0].name;
            	console.log($("#file1")[0].files[0].name);
                
              //if(!validFileType(filename)){
                if(validFileType(filename) == -1){	
                    $(this).val("");
                    alert("확장자가 .jpg .png .mp4 인 파일만 업로드가 가능합니다.");
//                     $("#previewImg").attr("src", "https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" );
//                     $("#previewImg").style.display="none";
                    $("#previewImg").attr("style", "display: none;" );
                    return false;
                }else if(!validFileSize($(this)[0].files[0])){
                    $(this).val("");
                    alert("파일 사이즈가 "+ fileSizeLimitMB +"MB를 초과합니다.");  //$("#file1")[0].files[0].size
                    $("#previewImg").attr("style", "display: none;" );
                    return false;
                }
                
            } //end - if (window.FileReader)
            
            // change발생 했지만 window.FileReader 가 false일경우 실행. (파일)
            else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
              //input upload-name 에 파일명 설정해주기
                $(this).prev().val(filename); 
                $(this).val(filename); 
//                 $("#previewImg").style.display="";
//                 $("#previewImg").attr("style", "display= ;" );
            }

            readImage($(this)[0]); //미리보기
            readVideo($(this)[0]); //미리보기
        });
        	
        $('.wrap').on( 'keyup', 'textarea', function (e){
            $(this).css('height', 'auto' );
            $(this).height( this.scrollHeight );
        });
        
        $('.wrap').find( 'textarea' ).keyup();        
        
    });

    //파일 확장자 설정    
    function validFileType(filename) {
        const fileTypes = ["png", "jpg", "mp4"];
        //indexOf 함수는, 문자열(string)에서 특정 문자열(searchvalue)을 찾고, 검색된 문자열이 '첫번째'로 나타나는 위치 index를 리턴함. 찾는 문자열이 없으면 -1을 리턴.
        return fileTypes.indexOf(filename.substring(filename.lastIndexOf(".")+1, filename.length).toLowerCase()) ;
//         return fileTypes.indexOf(filename.substring(filename.lastIndexOf(".")+1, filename.length).toLowerCase()) >= 0;
    }
    

    //파일 크기 설정
    function validFileSize(file){
//        var fileSizeLimitMB = 25 ;  //55 MB = 57671680 Bytes / 1048576
    	if(file.size > (fileSizeLimitMB * 1048576) ){
            return false;
        }else{
            return true;
        }
    }
    

    //이미지파일 미리보기 띄우기 p.716
    function readImage(input) {
    	var filename = $("#file1")[0].files[0].name; 
    	
        if( (input.files && input.files[0]) && (validFileType(filename) != 2) ) {
            const reader = new FileReader();
            reader.onload = function(e){
                const previewImage = document.getElementById("previewImg");
                previewImage.src = e.target.result;
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0]);
            // display= 이 아니라, display: 로 하는 것 주의! 
            $("#previewImg").attr("style", "display: ;" );
        } else if( validFileType(filename) == 2 ) {
        	$("#previewImg").attr("style", "display: none;" );
        	return false;
        } else {
            return true;
        }
    }
    
    //영상파일 미리보기 띄우기 
    function readVideo(input) {
    	var filename = $("#file1")[0].files[0].name; 
    	
        if( (input.files && input.files[0]) && (validFileType(filename) == 2) ) {
            const reader = new FileReader();
            reader.onload = function(e){
                const previewImage = document.getElementById("previewVideo");
                previewImage.src = e.target.result;
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0]);
            // display= 이 아니라, display: 로 하는 것 주의! 
            $("#previewVideo").attr("style", "display: ;" );
        } else if( validFileType(filename) != 2 ) {
        	$("#previewVideo").attr("style", "display: none;" );
        	return false;
        } else {
            return true;
        }
    }
    
    //파일 취소 or 유효하지 않은 파일일 경우 미리보기 숨기는 함수.

// 	function fn_preimgDisplay(file) {
// 		$('#previewImg').val(tab);
// 		if (tab == "1") {
// 			fn_search();
// 			jQuery('#svyYrs').css("display", "block");
// 			jQuery('#svyYrs2').css("display", "none");
// 		} else {
// 			fn_selectMList('C010', '1');
// 			jQuery('#svyYrs2').css("display", "block");
// 			jQuery('#svyYrs').css("display", "none");
// 		}
// 	}

	// 게시글 전체 업로드 함수
	function validateForm() {

		//        var file1 = document.upLoadFile.file1.value;

		if ($('#title').val() == "") {
			alert("제목을 입력해주십시오");
			$('#title').focus();
			//     	   document.forms[0].title.focus();
			//     	   document.getElementById( 'pw1' ).value;
			return false;
		} else if ($('#id').val() == "") {
			alert("작성자를 입력해주십시오");
			$('#id').focus();
			return false;
		} else if ($('#content').val() == "") {
			alert("내용을 입력해주십시오");
			$('#content').focus();
			return false;
		} else {
			alert(" 글작성이 완료되었습니다! ");

			document.upLoadFile.method = "post";
			document.upLoadFile.action = "write";
			document.upLoadFile.submit();

		}
	}
	
	
</script>

<%-- <%@include file="./includes/footer.jsp"%> --%>
<!-- <h1>부트스트랩 이 위까지</h1> -->
</body>
</html>
