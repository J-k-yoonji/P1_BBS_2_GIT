<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl의 출력과 포맷 적용 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 작성</h1>
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
				<a href="/testList">목록</a> > 글 작성
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<!-- 		 <h1>게시물 작성3</h1>        -->
				<form name="upLoadFile" method="post" enctype="multipart/form-data"
					action="/write">
					<div class="form-group">
						<label>제목 </label> <input id="title" class="form-control"
							type="text" name="title" /><br />
					</div>

					<div class="form-group">
						<label>작성자 </label> <input id="writer" class="form-control"
							type="text" name="writer" /><br />
					</div>

					<div class="form-group">
						<label>내용&nbsp;</label>
						<textarea id="content" class="form-control" cols="50" rows="3"
							name="content"></textarea>
					</div>
					<br />

					<div class="form-group">
						<label>첨부파일</label>
						<!-- 							        <input type="file" name="file1" id="file1" onchange="  readURL(this); fn_validate(); "  accept="video/*, image/*" /><br/> -->
						<!-- 							        <img id="preview1"  src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width = 200 height = 200 /> -->
						<!-- 							        <img id="previewImg"  src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width = 200 height = 200 /> -->

						<div class="uploadImg">
							<div class="filebox"
								style="width: auto; height: auto; line-height: 0.8;">
								<input class="upload-name" value="선택된 파일 없음" readonly="readonly"
									type="hidden"> <input type="file" id="file1"
									class="upload-hidden" name="file1" accept="image/*"> <br />
							</div>
							<img id="previewImg" width=200 height=200 style="display: none;" />
							<!--            <video  controls={true} autoPlay={true} src="#" class="image-box" width = 200 height = 200></video> -->

						</div>

					</div>
					<br />

					<p>
						<input type="submit" class="btn btn-success"
							onClick="return validateForm()" value="작성 완료" />
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

<%-- <%@include file="./includes/footer.jsp" %> --%>
<!--  <h1>부트스트랩 이 위까지</h1> -->


<script type="text/javascript">
// 			자바스크립트 전역변수

    $(document).ready(function(){
        //파일첨부 change 이벤트 발생시마다, 미리보기에 변화를 주어야 한다!
        $('.filebox .upload-hidden').on('change', function(){           
        	var fileExist = $(this)[0].files.length;
        	if(fileExist == 0) {
        	    $('#previewImg').css('display', 'none');
        	    return false;
        	}
        	
        	//
            if (window.FileReader){
                
            	// $(this)[0].files[0].name 이 있으면  (파일이 있으면) 유효한 파일인지 확인 후, true일 경우 파일명저장 & 미리보기사진 띄어줌.
            	var filename = $(this)[0].files[0].name;
                
                if(!validFileType(filename)){
                    $(this).val("");
                    alert("확장자가 .jpg 또는 .png 인 파일만 업로드가 가능합니다.");
//                     $("#previewImg").attr("src", "https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" );
//                     $("#previewImg").style.display="none";
                    $("#previewImg").attr("style", "display: none ; " );
                    return false;
                }else if(!validFileSize($(this)[0].files[0])){
                    $(this).val("");
                    alert("파일 사이즈가 10MB를 초과합니다.");
                    $("#previewImg").attr("style", "display: none ; " );
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
        });
    });

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


    //이미지 띄우기 p.716
    function readImage(input) {
        if(input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e){
                const previewImage = document.getElementById("previewImg");
                previewImage.src = e.target.result;
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0]);
            $("#previewImg").attr("style", "display= ;" );
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
		} else if ($('#writer').val() == "") {
			alert("작성자를 입력해주십시오");
			$('#writer').focus();
			return false;
		} else if ($('#content').val() == "") {
			alert("내용을 입력해주십시오");
			$('#content').focus();
			return false;
		} else if ($('#file1').val() == "") {
            alert("파일을 첨부해주십시오");
            $('#file1').focus();
            return false;
        } else {
			alert(" 글작성이 완료되었습니다! ");

			document.upLoadFile.method = "post";
			document.upLoadFile.action = "write";
			document.upLoadFile.submit();

		}
	}
</script>

<%@include file="./includes/footer.jsp"%>
<!-- <h1>부트스트랩 이 위까지</h1> -->
</body>
</html>
