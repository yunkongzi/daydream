<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>프로그램 리스트</title>
<style>
	.btnNewPro {
		margin : auto;
		display : block;
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<script>
$(function() {
	$(".a_file_image").click(function(e){
		e.preventDefault();
		var fileName = $(this).text();
		var class_no = $(this).attr("data-class_no");
		$("#imgClass").attr("src", "/admin/displayImage?fileName=" + fileName);
		$("#modalModify").attr("data-class_no", class_no);
		$("#modalDelete").attr("data-class_no", class_no);
		$("#modal-511270").trigger("click");
	});
	$(".btnModify").click(function(e) {
		e.preventDefault();
		var class_no = $(this).attr("data-class_no");
		var href = $(this).attr("href");
		console.log("class_no: ", class_no);
		location.href = href + "?class_no=" + class_no;
	});
	
	$(".btnDelete").click(function() {
		var class_no = $(this).attr("data-class_no");
		location.href = "/admin/deleteProgram?class_no=" + class_no;
	});
});
</script>
<div class="row">
	<div class="col-md-12">
		<a id="modal-511270" href="#modal-container-511270" role="button"
			class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>

		<div class="modal fade" id="modal-container-511270" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">사진 보기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body"><img id="imgClass" src="" width="450"></div>
					<div class="modal-footer">
					
						<button type="button" class="btn btn-warning btnModify"
							id="modalModify">수정</button>
						<button type="button" class="btn btn-info btnDelete"
							id="modalDelete">삭제</button>				
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<body>


			<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2 style="text-align:center;">등록된 프로그램 </h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>클래스명</th>
								<th>가격</th>
								<th>클래스 대상</th>
								<th>가능 인원</th>
								<th>클래스 소개</th>
								<th>이미지</th>
								<th>클래스 번호</th>
								<th>클래스 시간</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${programList}" var="programVo" >
							<tr>
								<td>${programVo.class_name}</td>
								<td>${programVo.price}</td>
								<td>${programVo.target}</td>
								<td>${programVo.personnel}</td>
								<td>${programVo.class_intro}</td>
								<td>
								<c:if test="${not empty programVo.file_image}">
									<a href="#" class="a_file_image" data-class_no="${programVo.class_no}">${programVo.file_image}</a>
								</c:if>
								
								
								</td>
								<td>${programVo.class_no}</td>
								<td>
								<c:forEach items="${timeList}" var="time">
									<c:forEach items="${programVo.time_no}" var="no">
										<c:if test="${time.time_no == no}">
											${time.time_start }:00 ~ ${time.time_end }:00<br>
										</c:if>
									</c:forEach>
								
								</c:forEach>
								
								</td>
								<td><a class="btn btn-outline-info btnModify"
										href="/admin/program_modify" data-class_no="${programVo.class_no}">수정</a></td>
								<td><a class="btn btn-outline-danger btnDelete"
										data-class_no="${programVo.class_no}">삭제</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
							<!-- <a class="btn btn-outline-warning btn-sm btnNewPro" href="/admin/program_regist">
									새로운 프로그램 등록</a> -->
									<a class="btn btn-secondary btn-sm btnNewPro" href="/admin/program_regist">
										새로운 프로그램 등록</a>
									<a class="btn btn-secondary btn-sm btnNewPro" href="/admin/admin_main">
										관리자 메인</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
