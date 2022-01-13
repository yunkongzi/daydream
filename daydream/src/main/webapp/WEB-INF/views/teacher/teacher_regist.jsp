<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<title>강사등록</title>

<script src="/js/myscript.js"></script>

<script>
$(function() {
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
// 		console.log("엔터, 오버");
	});
	$("#fileDrop").on("drop", function(e) {
		e.preventDefault();
		var file = e.originalEvent.dataTransfer.files[0];
		console.log(file);
		// <form method="post" enctype="multipart/form-data">
		// get: 1KB 이내, multipart/form-data: 바이너리
		// processData : false - 데이터를 쿼리스트링(?a=b&c=d)으로 보내지 않겠다
		// -> post
		// contentType: false - 데이터를 텍스트 데이터가 아닌 바이너리로 설정
		// -> enctype="multipart/form-data"
		var formData = new FormData(); // <form>
		formData.append("file", file); // <input type="file" name="file">
		var url = "/upload/uploadAjax"; // Controller의 RequestMapping
		
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
		$("#certificate").trigger("click")
	});
}); // $(function)
</script>
</head>

<body>
							
<div class="container-fluid" style="margin:0 auto;">
	<div class="row">
		<div class="col-md-12" style="margin:0 auto;">
			<div class="jumbotron" style="margin:0 auto;">
				<h2>강사 등록</h2>	
						
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12" style="margin:0 auto;">
			<form role="form" action="/teacher/regist_run" 
				method="post" enctype="multipart/form-data">
				<div class="form-group">
				    <p>로그인 후 등록해주세요</p>	
					<label for="tno">강사번호</label>
					<input type="text" class="form-control" 
						id="tno" name="tno" />
				</div>
				<div class="form-group">
					<label for="class_name">강좌명</label>
					<input type="text" class="form-control" 
						id="class_name" name="class_name" />
				</div>
				<div class="form-group">
					<label for="price">금액</label>
					<input type="text" class="form-control" 
						id="price" name="price" />
				</div>
				<div class="form-group">
					<label for="personnel">참가인원</label>
					<input type="text" class="form-control" 
						id="personnel" name="personnel" />
				</div>
				
				<div class="form-group">
					<label for="target">참가대상</label>
					<input type="text" class="form-control" 
						id="target" name="target" />
				</div>
				
				<div class="form-group">
					<label for="certificate">자격증 파일 첨부</label>
					<input type="file" class="form-control" 
						id="certificate" name="certificate" style="display:none"/>
					<button type="button" id="btnFile">파일 첨부</button>
				</div>
												
				<div class="form-group">
					<label for="introduce">자기소개</label>
					<textarea class="form-control" placeholder="50자 내외로 글을 작성해주세요."
						id="introduce" name="introduce"></textarea>
				</div>
				
				<button type="submit" class="btn btn-primary">등록완료</button>				
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>