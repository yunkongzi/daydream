
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
$(function() {
	$("#fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	
	$("fileDrop").on("drop", function(e){
		e.preventDefault();
		var file = e.origianlEvent.dataTransfer.files[0];
		console.log(file);
		// <form method="post" enctype="multipart/form-data">
		// get: 1KB 이내, multipart/form-data: 바이너리
		// processData : false - 데이터를 쿼리스트링(?a=b&c=d)으로 보내지 않겠다
		// -> post
		// contentType: false - 데이터를 텍스트 데이터가 아닌 바이너리로 설정
		// -> enctype="multipart/form-data"
		var formData = new FormData(); // <form>
		formData.append("file", file); // <input type="file" name="file">
		var url = "/upload/displayImage"; // Controller의 RequestMapping
		$.ajax({
			"processData"	: false,
			"contentType"	: false,
			"method"		: "post",
			"url"			: url,
			"data"			: formData,
			"success"		: function(rData) { 
				console.log(rData);
				if (rData == "fail") {
					alert("잘못된 형식의 파일입니다.");
					return;
				}
				
				var div = $("#uploadedList").prev().clone();
				div.attr("data-filename", rData);
				
				console.log(div);
				var underIndex = rData.indexOf("_");
				var fileName = rData.substring(underIndex + 1);
				div.find("span").text(fileName);
				var result = isImage(fileName); 
				if (result == true) {
					var img = div.find("img");
					img.attr("src", "/upload/displayImage?fileName=" + rData);
				}
				
				var a = div.find("a");
				a.attr("data-filename", rData);
				
				
				$("#uploadedList").append(div);
				div.show(1000);
			}
		});
	}); // $("#fileDrop").on("drop"
			
	$("#frmRegist").submit(function() {
		var divs = $("#uploadedList > .divUploaded");
		console.log("divs:", divs);
		divs.each(function(index) {
			var filename = $(this).attr("data-filename");
			var inputHtml = "<input type='hidden' name='files[" + index +"]' value='" + filename + "'>";
			$("#frmRegist").prepend(inputHtml);
		});
// 		return false;
	});		
	
	$("#uploadedList").on("click", ".a_times", function(e) {
		e.preventDefault();
		var that = $(this);
		var filename = that.attr("data-filename");
		console.log(filename);
		var url = "/upload/deleteFile?fileName=" + filename;
		$.get(url, function(rData) {
			console.log(rData);
			if (rData == "success") {
				that.parent().hide(1000, function() {
					that.parent().remove();
				});
				
			} else {
				alert("파일 삭제에 실패했습니다.");
			}
		});
	});
	
	$("#btnFile").click(function() {
		$("#file_image").trigger("click")
	});
	
	$("form").submit(function() {
		var file_image = $("input[name=file_image]").val();
		if (file_image == "") {
			file_image = $(this).attr("data-file_image");
			$("input[name=file_image]").remove();
			var input_file_image = "<input name='file_image' value='" + file_image + "'>";
			$(this).prepend(input_file_image);
		}
		console.log(file_image);
	});
}); // $(function)
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
						<form role="form" action="/admin/modify_run" method="post"
							data-file_image="${programVo.file_image}"  
							enctype="multipart/form-data"> 
								 <%-- <p>
									<input type="hidden" id="file_image" name="file_image" value="${programVo.file_image}">
								</p>  --%>
							
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
									><c:out value="${programVo.class_intro}"/></textarea>
								
							</div>
							<div class="form-group">

								<label for="class_content"> 상세 소개 </label><br>
								<textarea rows="10" cols="70" id="class_content" name="class_content"
									><c:out value="${programVo.class_content}"/></textarea>
								
							</div>
							
							<%-- <div class="form-group">
					            <label for="class_content">상세 소개</label>
					            <textarea class="form-control" id="class_content" rows="10" name="class_content">${programVo.class_content}</textarea>
        					</div> --%>

							
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
							
							<%-- <c:if test="${not empty programVo.file_image}">
									<img src="/admin/displayImage?fileName=${programVo.file_image}" height="250"/>
								</c:if> --%>
								
							<div class="form-group">
								<label for="file_image"> 사진 </label><br> 
								<input
									type="file" class="form-control" id="file_image" name="file_image"/>
									<c:if test="${not empty programVo.file_image}">
									<img src="/admin/displayImage?fileName=${programVo.file_image}" height="250"/>
								</c:if>
									</div>
									<!-- <input
									type="file" class="form-control" id="file_image" name="file_image" style="display:none"/>
									<button type="button" id="btnFile">파일 첨부</button> -->
								
							
							 <input type="hidden" name="class_no" value="${programVo.class_no}">

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