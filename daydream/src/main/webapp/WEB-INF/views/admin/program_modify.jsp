<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 프로그램 수정 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
<script>
/* $(function() { 
	$("input[name=time_no]").change(function() {
		
		var isChecked = $(this).prop("checked");
		var q = "";
		if (isChecked == true) {
			q = "insert";
		} else {
			q = "delete";
		}
		console.log(isChecked);
		var time_no = $(this).val();
		console.log(time_no);
		var class_no = "${programVo.class_no}";
		var sendData = {
				"time_no" : time_no,
				"class_no" : class_no,
				"q" : q
		};
		var url = "/admin/changeProgramTime";
		$.post(url, sendData, function(rData) {
			if (rData == "success") {
				alert("시간 변경 완료");
			}
		});
		
	});
}); */
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2 style="text-align: center;">원데이 프로그램 수정</h2>
					<p></p>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form" action="/admin/modify_run" method="post">
							<div class="form-group">
								<label for="class_no"> 클래스 번호 </label><br> 
								<input
									type="text" class="form-control"  id="class_no" name="class_no"
										value="${programVo.class_no}" readonly />
							</div>
							
							<div class="form-group">
								<label for="class_name"> 클래스명 </label><br> 
								<input
									type="text" class="form-control" id="class_name" name="class_name"
										value="${programVo.class_name}" />
							</div>
							<div class="form-group">

								<label for="price"> 가격 </label><br> 
								<input type="text"
									class="form-control" id="price" name="price" 
										value="${programVo.price}"/>
							</div>
							<div class="form-group">

								<label for="target"> 프로그램 대상 </label><br> 
								<input
									type="text" class="form-control" id="target" name="target" 
										value="${programVo.target}"/>
							</div>
							<div class="form-group">

								<label for="personnel"> 가능 인원 </label><br> 
								<input
									type="text" class="form-control" id="personnel" name="personnel" 
									value="${programVo.personnel}"/>
							</div>
							<div class="form-group">

								<label for="class_intro"> 프로그램 소개 </label><br>
								<textarea rows="5" cols="50" id="class_intro" name="class_intro"
									><c:out value="${programVo.class_intro}" /></textarea>
								
							</div>
							
							 <div class="form-group">

								<label for="time_no"> 개설 시간 </label><br>
								<c:forEach items="${timeList}" var="classTimeVo">
									<input type="checkbox" name="time_no" value="${classTimeVo.time_no}" disabled
									 <c:forEach items="${programVo.time_no}" var="no">
										<c:if test="${no == classTimeVo.time_no}">
										checked
										</c:if>
									</c:forEach> 
									> ${classTimeVo.time_start} ~ ${classTimeVo.time_end}<br>
								</c:forEach>
							</div> 
							
							<div class="form-group">

								<label for="file_image"> 사진 </label><br> 
								<input
									type="file" class="form-control" id="file_image" name="file_image" 
									value="${programVo.file_image}"/>
							</div>
							
							<button type="submit" class="btn btn-primary btnProgramReg">
								수정</button>
							<a class="btn btn-success btnAdminMain" href="/admin/admin_main">
								관리자 메인 화면
							</a>
							<a class="btn btn-secondary btnProList" href="/admin/program_list">
								프로그램 목록보기
							</a>
						</form>
					</div> 
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>