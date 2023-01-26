<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jstl의 출력과 포맷 적용 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h2 class="page-header">글 목록4</h2>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div id="nav">
	<%@ include file="../jsp/nav2.jsp"%>
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">목록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<!--  <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example"> -->
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th style="width: 10%;">번호</th>
							<th style="width: 60%;">제목</th>
							<th style="width: 20%;">작성자</th>
							<th style="width: 10%;">작성시간</th>
							<!--  <th>수정시간</th> -->
						</tr>
					</thead>

					<tbody>

						<!-- TestController.java 컨트롤러 파일의 model.addAttribute("list", testService.selectList(testVo));   부분의  "list" 속성 -->
						<c:forEach items="${boardList}" var="i">
							<!--            <tr  onclick=window.open("/view?bno=${result.bno}","_self") style='cursor:pointer; border:0; margin:0; '> -->
							<tr class="trlink" onclick="location.href='/view?bno=${i.bno}';" style='cursor: pointer;'>
								<td>${i.bno}</td>
								<td>
									<!-- dispatcher-servlet 에 정적 자원 매핑을 location="/resources/" 로 해주었기 떄문에, -->
									<!-- img src에  src="/resources/image/arr.jpg" 이렇게 넣어줘야 파일이 꺠지지 않고 화면에 출력된다! -->
									<c:if test="${i.sortSeq gt 0}">
										<!-- <img width="${i.sortSeq*10}px"/> -->
										<img width="10px" />
										<span><img src="/resources/image/arr.jpg" alt="" width="20px" /></span>
										<!-- <span><img src="/resources/image/arr.jpg" alt="" width="20px" />ㄴ[답글]</span> -->
									</c:if>
									${i.title}
									<!--  댓글이 있으면 게시글 이름 옆에 출력하기! -->
									<c:if test="${i.recnt > 0 }">
										<span style="color: red;">&nbsp;(${i.recnt}) </span>
									</c:if>

								</td>
								<td>${i.id}</td>
								<td>${i.regDate}</td>
							</tr>
						</c:forEach>

					</tbody>

				</table>

			</div>

			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination">
						<!-- 이전prev -->
						<c:if test="${pm.prev }">
							<%-- <li><a href="listPage?page=${pm.startPage-1}">&laquo;</a></li> --%>
							<li><a href="boardList?page=${pm.startPage-1}">&laquo;</a></li>
						</c:if>
						<!-- 페이지블럭 -->
						<c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
							<!-- 삼항연산자를 사용해서 class로 스타일적용  -->
							<li ${pm.cri.page == idx? 'class=active':''}><a href="boardList?page=${idx }">${idx}</a></li>
						</c:forEach>
						<!-- 다음next -->
						<c:if test="${pm.next && pm.endPage > 0}">
							<li><a href="boardList?page=${pm.endPage+1}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>

<!-- 로그아웃 버튼 여기에서 옮겨서 header.jsp로 넣어줌 -->

<!-- /.row -->

<%@include file="./includes/footer.jsp"%>

<!-- <h1>부트스트랩 이까지</h1> -->


<!-- <div>
    <p><button type="button" class="btn" onclick="location.href='/write';">게시물 작성</button></p>
</div> -->


</body>
</html>
