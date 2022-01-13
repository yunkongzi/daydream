<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
}); // $(function)
		
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2 style=" text-align: center;">원데이 프로그램 등록</h2>
					<p></p>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form" action="/admin/regist_run" method="post"
								enctype="multipart/form-data">
								<p>
									<input type="hidden" id="class_no" name="class_no" value="${programVo.class_no}">
								</p>
								
							<div class="form-group">

								<label for="class_name"> 클래스명 </label><br> 
								<input
									type="text" class="form-control" name="class_name" />
							</div>
							<div class="form-group">

								<label for="price"> 가격 </label><br> 
								<input type="text"
									class="form-control" name="price" />
							</div>
							<div class="form-group">

								<label for="target"> 프로그램 대상 </label><br> 
								<input
									type="text" class="form-control" name="target" />
							</div>
							<div class="form-group">

								<label for="personnel"> 가능 인원 </label><br> 
								<input
									type="text" class="form-control" name="personnel" />
							</div>
							<div class="form-group">

								<label for="class_intro"> 프로그램 소개 </label><br>
								<textarea rows="5" cols="50" name="class_intro"></textarea>
							</div>
							
							<div class="form-group">

								<label for="time_no"> 개설 시간 </label><br>
								<c:forEach items="${timeList}" var="classTimeVo">
									<input type="checkbox" name="time_no" value="${classTimeVo.time_no}" checked>
									${classTimeVo.time_start} ~ ${classTimeVo.time_end}<br>
								</c:forEach>
							</div>
							<div class="form-group">
								<label for="file_image"> 사진 </label><br> 
								<input type="file" class="form-control" 
									id="file_image" name="file_image" style="display:none"/>
								<button type="button" id="btnFile">사진 업로드하기</button>
							</div>
							
							
							<button type="submit" class="btn btn-primary btnProgramReg">
								등록</button>
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