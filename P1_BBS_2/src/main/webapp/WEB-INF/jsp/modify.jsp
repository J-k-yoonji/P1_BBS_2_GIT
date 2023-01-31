<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jstl의 출력과 포맷 적용 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
	    <div class="page-header">
           <h2>             
             <c:if test="${view.sortSeq lt 1}">
                          글
             </c:if>
             <c:if test="${view.sortSeq gt 0}">
                          답글
             </c:if>
                          수정
           </h2>
        </div>
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
				<form method="post" enctype="multipart/form-data" action="/modify" name="upLoadFile">

					<!-- 바뀌면 안되는 정보는 label로 바로 출력한다. (번호) -->
					<div class="form-group">
                        <c:if test="${view.sortSeq gt 0}">
                            <label>답글</label>
                        </c:if>					
						<label>번호 </label> <input class="form-control" name="bno" value="${view.bno}" readonly="readonly" />
					</div>

					<div class="form-group">
                        <c:if test="${view.sortSeq gt 0}">
                            <label>답글</label>
                        </c:if>
						<label>제목 </label> <input id="title" class="form-control" type="text" name="title" value="${view.title}" />
					</div>

					<!-- 					<div class="form-group"> -->
					<!-- 						<label>작성자 </label> <input id="id" class="form-control" -->
					<%-- 							type="text" name="id" value="${view.id}" /><br /> --%>
					<!-- 					</div> -->

					<div class="form-group">
                        <c:if test="${view.sortSeq gt 0}">
                            <label>답글</label>
                        </c:if>					
						<label>내용&nbsp;</label>
						<textarea id="content" class="form-control" cols="50" rows="3" name="content">${view.content}</textarea>
					</div>

					<div class="form-group">
						<label>첨부파일</label>
<!-- 						<span style="font-size:13px; color:#FF28A7;">&nbsp;(*미첨부 시 첨부파일 없는 글로 수정됩니다)</span> -->



						<div class="uploadImg">
							<div class="filebox" style="width: auto; height: auto; line-height: 0.8;">
						 		<input class="upload-name" type="hidden" value="${view.imageFileName}" readonly="readonly"> 
							    <span style=" width: 100%; display: inline-block;"> 
							 		<input type="file" id="file1" class="upload-hidden FileNameLen" name="file1" value="${view.imageFileName}" style=" display: inline-block;" accept="image/*, video/*">

<!-- 	                                &nbsp;<button type="button" data-type="file" class="btn btn-danger btn-circle" style="display: inline-block;"><i class='fa fa-times' ></i></button> -->
<!-- 	                                &nbsp;<button type="button" data-type="file"  onclick="javascript:document.myForm3.submit();" class="btn btn-danger btn-circle" style="display: inline-block;"><i class='fa fa-times' ></i></button> -->
<!--                                         <button type="button" class="btn btn-danger btn-xs" style="margin: 0; padding: 3px 13px; display: inline-block;">파일 삭제</button> -->
<!--                                         <button type="button" class="btn btn-danger btn-xs" style="margin: 0; padding: 1.8px 10px; display: inline-block;">파일 삭제</button> -->
<!--                                         <button type="button" class="" style="margin: 0; padding: 4px 6px; display: inline-block; line-height: 0.8;">파일 삭제</button> -->
								</span>
							</div>
							<div style="position: absolute; z-index: 2; left: 25px; padding:5px;">
							  <button type="button" data-type="file"  onClick="return deleteFile();" class="btn btn-danger btn-circle" style="display: block;"><i class='fa fa-times' ></i></button>
							</div>
							
							<div style="position: relative; z-index: 1; padding:12px;">
							<img id="previewImg_m" src="/filepath/${view.newFileName}" style="margin:0px; display: none;" width=auto height=200 />
							<!-- 새로 업로드한 '영상파일' 미리보기 img태그 -->      
							<video id="previewVideo_m" controls autoPlay muted src="/filepath/${view.newFileName}" class="image-box" style="margin-top: 6px; width: auto; height: 200px; display: none;" ></video>

<%-- 			                <c:if test="${null ne view.imageFileName}"> --%>

	                            <!-- 기존에 업로드한 '사진파일' 미리보기 img태그 -->
								<img id="previewImg00" src="/filepath/${view.newFileName}" class="preFileImg" style="margin-top: 6px; display: block;" width=auto height=200 />
								<!-- 기존에 업로드한 '영상파일' 미리보기 img태그 -->						 
	                            <video  id="previewVideo00" controls autoPlay muted src="/filepath/${view.newFileName}" class="image-box" style="margin-top: 6px; width: auto; height: 200px; display: block;"></video>
	                        </div>
<%-- 							</c:if>  --%>
<!-- 							    코드로인해 변경된 기존 파일 이름 -->
							<input class="upload-name2" type="hidden" value="${view.newFileName}" name="preFileName" readonly="readonly">
						</div>
<!-- 						<button type="button" class="btn btn-danger btn-xs" style="margin-top: 6px; padding: 3px 13px;">파일 삭제</button> -->


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
						<button type="submit" class="btn btn-success" onClick="return validateForm()">수정 완료</button>
<!-- 						<button type="button" data-type="file" class="btn btn-danger btn-circle"><i class='fa fa-times' ></i></button> -->
					</p>

				</form>
<%--                 <form name="myForm3" action="/deleteFile?bno=${view.bno}" method="POST"></form> --%>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->

<%@include file="./includes/footer.jsp" %>
<!--  <h1>부트스트랩 이 위까지</h1> -->

<!-- 자바스크립트 선언 -->
<script type="text/javascript">
    //          자바스크립트 전역변수
    
// //  파일이름길이 측정해 input의 width값 설정. 
//     $(document).ready(function() {  
//          var inputed = $(".FileNameLen").val().length ; // class명이 "FileNameLen"인 input에 입력된 '파일이름 길이값' inputed
//          console.log(inputed);
//        //input칸이 너무 길어지진 않도록 식을 설정해줌.
//          if(inputed > 0) {
//            $(".FileNameLen").css( "width", (inputed*40)/((inputed/10)+1) ); 
//          } else {
//            $("#fileUpload").attr("style", "display: none;")
//          }
// //       $(".FileNameLen").css("width", (inputed * 40) / ((inputed / 10) + 1) ); //input
// //       $(".FileNameLen").css("width", ( (inputed * 40) / ((inputed / 10) + 1) ) ) ; 
      
//     });
    
    $(document).ready(function () {
        var filename2 = $("#file1")[0].value;
        var filename = $(".upload-name")[0].value ;
        
        console.log( filename );
        console.log( validFileType(filename) );
        console.log( filename2 );
        console.log( validFileType(filename2) );
        readImage($(".upload-name")[0]); //미리보기
        readVideo($(".upload-name")[0]); //미리보기
        
        //새 파일 선택 input에 아무것도 담지 않았을때, 첨부파일-취소 버튼 물렀을 경우. 미리보기와 x버튼 모두 안보이게 함.
        if ($("#file1")[0].value == '') {
//             $('#previewImg_m').css('display', 'none');
//             $('#previewVideo_m').css('display', 'none');
//             $(".btn-circle").css("display", "none"); // X 버튼
        }
        
        //파일첨부 이벤트
        $('.filebox .upload-hidden').on('change', function () {
            var fileExist = $(this)[0].files.length;
            if (fileExist == 0) {
            	//첨부파일-취소 버튼 물렀을 경우.
                $('#previewImg_m').css('display', 'none');
                $('#previewVideo_m').css('display', 'none');
                $(".btn-circle").css("display", "none"); // X 버튼
//                 $('#previewVideo_m').attr('src', '');
//                 $('#previewImg00').attr('src', '');
//                 $('#previewVideo00').attr('src', '');
//                 $('input#file1').val('');
//                 $('#file1').attr('value', '');
                return false;
            }
            //          else {
            //              $('#previewImg00').css('display', 'none');
            //          }

            //
            if (window.FileReader) {

                var filename = $("#file1")[0].files[0].name;
                console.log($("#file1")[0].files[0].name);

                if (validFileType(filename) == -1) {
                    $(this).val("");
                    console.log(this);
                    console.log($(this));
                    alert("확장자가 .jpg/.png/.mp4 인 파일만 업로드가 가능합니다.");
                    $("#previewImg_m").css("display", "none");
                    return false;
                } else if (!validFileSize($(this)[0].files[0])) {
                    $(this).val("");
                    alert("파일 사이즈가 10MB를 초과합니다.");
                    $("#previewImg_m").css("display", "none");
                    return false;
                } else if ( (validFileType(filename) == 0) || (validFileType(filename) == 1) ){
                    //사진 파일을 새로 선택했을경우엔 img태그의 미리보기만 보이도록! 
                    $('#previewImg_m').css('display', 'block');
                    $('#previewVideo_m').css('display', 'none');
                    readImage($('#previewImg_m'));    
                    readVideo($('#previewVideo_m')); 
                } else if ((validFileType(filename) == 2)){     
                    //영상 파일을 새로 선택했을경우엔 video태그의 미리보기만 보이도록! 
                    $('#previewVideo_m').css('display', 'block');
                    $('#previewImg_m').css('display', 'none');
// ??                    
                    readImage($('#previewImg_m'));    
                    readVideo($('#previewVideo_m')); 
                }

            } //end - if (window.FileReader) ??

            // change발생 했지만 window.FileReader 가 false일경우 실행. (파일) ??
            else {

                //pop 메서드 : 배열의 마지막 요소를 제거한 후, 제거한 요소를 반환
                //split 메서드: string.split( '분할기준', limit(분할최대개수(선택사항)) )
                var filename = $(this).val().split('/').pop().split('\\').pop();
                //input upload-name 에 파일명 설정해주기
                $(this).prev().val(filename);
                $(this).val(filename);
            }
            

            //아래 두 줄이 있어야 수정페이지에서 새로운 사진/영상 파일을 첨부했을 때 각각의 미리보기함수가 실행됨! 
            readImage($(this)[0]); //미리보기
            readVideo($(this)[0]); //미리보기
            $('#previewImg00').css('display', 'none'); //새로운 사진 파일이 첨부되면 기존 첨부파일의 미리보기는 사라짐!
            $('#previewVideo00').css('display', 'none'); //새로운 영상 파일이 첨부되면 기존 첨부파일의 미리보기는 사라짐!
        });
    });

    //코드숙지.
    function validFileType(filename) {
        const fileTypes = ["png", "jpg", "mp4"];
        return fileTypes.indexOf(filename.substring(filename.lastIndexOf(".") + 1, filename.length).toLowerCase()) ;
    }

    function validFileSize(file) {
        if (file.size > 590485760) { //10MB
            return false;
        } else {
            return true;
        }
    }


    //이미지파일 미리보기 띄우기
    function readImage(input) {
//     	var filename = $(".upload-name")[0].value; 
// filename을 위와같이 설정하면 기존에 첨부파일이 없는 글의 수정시, 미리보기가 제대로 실행되지 않았기에 아래와 같이 바꾸어주었다.
        var filename = $("#file1")[0].value; //새로 첨부할 파일 이름
//         var filename2 = $("#file1")[0].value;
        var filename2 = $(".upload-name")[0].value ; //기존 첨부 파일이름

        
        console.log( filename2 );
        console.log( '기존 첨부 파일확장자 : ',validFileType(filename2) );
        
        console.log( filename );
        console.log( '새로 첨부할 파일확장자 : ',validFileType(filename) );
//         readImage($(".upload-name")[0]); //미리보기
//         readVideo($(".upload-name")[0]); //미리보기
    	
//         if ( (input.files && input.files[0]) && (validFileType(filename) != 2) ) {
//         if ( (input.files && input.files[0]) && (validFileType(filename) >= 0) ) {
	// 기존에 첨부파일 없었던 글도 수정-첨부파일-첨부 시 미리보기가 잘 뜨도록 설정해줘야함.
        if ( (input.files && input.files[0]) && (validFileType(filename) >= 0) ) {
            $(".btn-circle").css("display", "block"); // X 버튼 ??
        	const reader = new FileReader();
            reader.onload = function (e) {
            	//아래줄 중요! 사진파일 수정시 새로 첨부한 사진파일의 이미지가 미리보기로 뜨도록 해줌!
                const previewImage = document.getElementById("previewImg_m");
                previewImage.src = e.target.result;
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0]);
//             $("#previewImg_m").attr("style", "display: ;");
            $('#previewImg00').css("display", "block");
        } else if ( (validFileType(filename) != -1) && (validFileType(filename) == 2 ) ) {
            $("#previewImg00").css("display", "none" );
            return false;
        } else if ( validFileType(filename2) == -1 ) {  // filename 이 아니라 filename2 인것에 주의! 기존에 아무파일도 없는 경우
	        $("#previewImg00").css("display", "none");
	        $("#previewVideo00").css("display", "none");
            $(".btn-circle").css("display", "none");
            return false;
        } else if ( validFileType(filename2) == 0 || validFileType(filename2) == 1 ) {
        	//글수정 클릭시 기존 사진 첨부파일 미리보기 안뜨게 함.
//         	$("#previewImg00").css("display", "none" );
//         	$("#previewVideo00").css("display", "none" );
            $("#previewImg00").css("display", "block" );
            $("#previewVideo00").css("display", "none");
        	return true;
        }
    }
    
    //영상파일 미리보기 띄우기 
    function readVideo(input) {
//         var filename = $(".upload-name")[0].value;
// filename을 위와같이 설정하면 기존에 첨부파일이 없는 글의 수정시, 미리보기가 제대로 실행되지 않았기에 아래와 같이 바꾸어주었다.
        var filename = $("#file1")[0].value;
//      var filename2 = $("#file1")[0].value;
        var filename2 = $(".upload-name")[0].value ; //기존 첨부 파일이름
        
        console.log( filename2 );
        console.log( '기존 첨부 파일확장자 : ',validFileType(filename2) );
        
        console.log( filename );
        console.log( '새로 첨부할 파일확장자 : ',validFileType(filename) );
        
//         if( (input.files && input.files[0]) && (validFileType(filename) == 2) ) {
        if ( (input.files && input.files[0]) && (validFileType(filename) >= 0) ) {
            $(".btn-circle").css("display", "block"); // X 버튼 ??
        	const reader = new FileReader();
            reader.onload = function(e){
            	//아래줄 중요! 영상파일 수정시 새로 첨부한 영상파일이 미리보기로 뜨도록 해줌!
                const previewImage = document.getElementById("previewVideo_m");
                previewImage.src = e.target.result;
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0]);
            // display= 이 아니라, display: 로 하는 것 주의! 
            $("#previewVideo00").css("display", "block" );
        } else if ( (validFileType(filename) != -1) && (validFileType(filename) != 2) ) {
//             $("#previewVideo00").css("display", "none" );
            $("#previewImg00").css("display", "none");
            return false;
        } else if ( validFileType(filename2) == -1 ) {  // filename 이 아니라 filename2 인것에 주의! 기존에 아무파일도 없는 경우
            $("#previewImg00").css("display", "none");
            $("#previewVideo00").css("display", "none");
            $(".btn-circle").css("display", "none");
            return false;
        } else if ( validFileType(filename2) == 2 ) {
            //글수정 클릭시 기존 영상 첨부파일 미리보기 안뜨게 함.
        	$("#previewVideo00").css("display", "block" );
        	$("#previewImg00").css("display", "none" );
//         	$("#previewVideo00").css("display", "none" );
        	return true;
        }
    }

    // 게시글 전체 업로드 함수
    function validateForm() {
        console.log($(".upload-name")[0].value);
        console.log($(".FileNameLen")[0].value);
        console.log($("#file1")[0].value);
        
        //        var file1 = document.upLoadFile.file1.value;

        if ($('#title').val() == "") {
            alert("제목을 입력해주십시오");
            $('#title').focus();
            //         document.forms[0].title.focus();
            //         document.getElementById( 'pw1' ).value;
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
            alert(" 글수정이 완료되었습니다! ");

            document.upLoadFile.method = "post";
            document.upLoadFile.action = "modify";
            document.upLoadFile.submit();

        }
    }
    
    // 첨부파일 삭제 함수
    function deleteFile() {

        var filename0 = $(".upload-name")[0].value ; //기존 첨부 파일이름
        var filename = $("#file1")[0].value;
//      var filename2 = $("#file1")[0].value;
        
//         console.log( filename0 );
        console.log( filename0, '기존 첨부 파일확장자0 : ', validFileType(filename0) );
        
//         console.log( filename );
        console.log( filename, '새로 첨부할 파일확장자1 : ', validFileType(filename) );
        console.log( filename, '새로 첨부할 파일이름: ', $("#file1").val());
        $("#file1").val(null);
        console.log( '새로 첨부할 파일이름null로: ', $("#file1").val());
        $('.upload-name2').val(null);
        console.log( 'preFileName값을 null로: ', $('.upload-name2').val());
        
        // X버튼 클릭시 모든 미리보기와 X버튼이 화면상에선 사라지도록함.
        $('#previewImg_m').css('display', 'none');
        $('#previewVideo_m').css('display', 'none');
        $('#previewImg00').css('display', 'none');
        $('#previewVideo00').css('display', 'none');
        $(".btn-circle").css("display", "none"); // X 버튼
    }
    
</script>

<%-- <%@include file="./includes/footer.jsp"%> --%>
<!-- <h1>부트스트랩 이 위까지</h1> -->
</body>

</html>