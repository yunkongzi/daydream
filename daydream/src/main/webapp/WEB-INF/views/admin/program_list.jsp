
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
// 	$(".a_file_image").click(function(e){
// 		e.preventDefault();
// 		var fileName = $(this).text();
// 		var class_no = $(this).attr("data-class_no");
// 		var href = $(this).attr("href");
// 		location.href = href + "?class_no=" + class_no;
		
// 	});
	$(".btnModify").click(function(e) {
		e.preventDefault();
		var class_no = $(this).attr("data-class_no");
		var href = $(this).attr("href");
		var form = document.getElementById("viewForm");
		form.submit();
		console.log("class_no: ", class_no);
		location.href = href + "?class_no=" + class_no;
	});
	
	$(".btnDelete").click(function() {
		var class_no = $(this).attr("data-class_no");
		location.href = "/admin/deleteProgram?class_no=" + class_no;
	});
	
});
</script>
<body>

			<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" style="background: #F9F7F5;">
				<h2 style="text-align:center;">개설된 프로그램 목록</h2>
				<a class="btn btn-secondary btn-sm btnNewPro" href="/admin/program_regist"
					style="background: #bfa071;">
										새로운 프로그램 등록</a>
									<a class="btn btn-secondary btn-sm btnNewPro" href="/admin/admin_main"
										style="background: #bfa071;">
										관리자 메인</a>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form id="viewForm" name="viewForm" >
					<table class="table table-bordered">
						<thead>
							<tr style="background: #bfa071;">
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
								<td><a href="/program_detail?class_no=${programVo.class_no}" title="${programVo.class_content}">${programVo.class_intro}</a></td>
								
								<td align="center">
								<c:if test="${not empty programVo.file_image}">
									<img class="img-thumbnail" src="/admin/displayImage?fileName=${programVo.file_image}" 
										style="height:150px"/>
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
								<td><a class="btn btnModify"
										href="/admin/program_modify" data-class_no="${programVo.class_no}" style="background: #bfa071;">수정</a></td>
								<td><a class="btn btnDelete"
										data-class_no="${programVo.class_no}" style="background: #bfa071;">삭제</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</form>
					
							<!-- <a class="btn btn-outline-warning btn-sm btnNewPro" href="/admin/program_regist">
									새로운 프로그램 등록</a> -->
									<input type='hidden' id='class_no' name='class_no' value='${programVo.class_no}' />
									
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>