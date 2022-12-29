<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    <!-- jstl의 출력과 포맷 적용 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">글 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
              <div id="nav">
                   <%@ include file="../jsp/nav2.jsp" %>
              </div>          
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">목록</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                          
<!--                             <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example"> -->
                            <table class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th style="width: 10%;" >번호</th>
                                        <th style="width: 60%;" >제목</th>
                                        <th style="width: 20%;" >작성자</th>
                                        <th style="width: 10%;" >작성시간</th>
<!--                                    <th>수정시간</th> -->
                                    </tr>
                                </thead>
                                
                                <tbody>

							<!-- TestController.java 컨트롤러 파일의 model.addAttribute("list", testService.selectList(testVo));   부분의  "list" 속성 -->
							        <c:forEach items="${list}" var="result">
							<!--            <tr  onclick=window.open("/view?bno=${result.bno}","_self") style='cursor:pointer; border:0; margin:0; '> -->
							            <tr class="trlink" onclick="location.href='/view?bno=${result.bno}';" style='cursor:pointer;  '>
							                <td>${result.bno}</td>
							                <td>${result.title}</td>
							<%--                <td><h4 class="hlink">${result.title}</h4></td> --%>
							                <td>${result.writer}</td> 
							                <td>${result.regDate}</td> 
							            </tr>
							        </c:forEach>

                                </tbody>

                                </table>
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


<!-- <div>
    <p><button type="button" class="btn" onclick="location.href='/write';">게시물 작성</button></p>
</div> -->




</body>
</html>
            