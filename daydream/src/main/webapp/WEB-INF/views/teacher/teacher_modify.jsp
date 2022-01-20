<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
* {
	margin: 0 auto;
	text-align: center;
}
section.a {
	width: 700px;
	display: block;
	margin: 0 auto;
	text-align: center;
}
input, textarea {
	text-align:left;
}
</style>

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
										
	<section class="a">
	<div style="margin:0 auto; text-align:center;">
		<h3>데이드림 강사 정보 수정</h3>
		<p style="margin:0 auto; text-align:center;"></p>
		
	</div>
	</section>
	<hr/>
		
	<section class="a">
	<div>
		
		<form action="/teacher/modify_run" 
				method="post">
		<div style="margin:0 auto;">
			
				<div>
					<label for="tno">강사번호</label>
					<input type="text"  
						id="tno" name="tno" value="${teacherVo.tno}" readonly/>
				</div>
				<div class="form-group">
					<label for="class_name">클래스명</label>
					<input type="text" class="form-control" 
						id="class_name" name="class_name" value="${teacherVo.class_name}" />
				</div>
				<div class="form-group">
					<label for="price">가격</label>
					<input type="text" class="form-control" 
						id="price" name="price" value="${teacherVo.price}"/>
				</div>
				<div class="form-group">
					<label for="personnel">인원</label>
					<input type="text" class="form-control" 
						id="personnel" name="personnel" value="${teacherVo.personnel}"/>
				</div>
				
				<div class="form-group">
					<label for="target">참가대상</label>
					<input type="text" class="form-control" 
						id="target" name="target" value="${teacherVo.target}"/>
				</div>
				<c:if test="${not empty teacherVo.certificate}">
				<img src="/teacher/displayImage?fileName=${teacherVo.certificate}"/>
				</c:if>	
						
				<div class="form-group">
					<label for="certificate">자격증 파일 첨부</label>
					<input type="file" class="form-control" 
						id="certificate" name="certificate" style="display:none"/>
					<button type="button" id="btnFile">파일 첨부</button>
				</div>
				
				<div class="form-group">
					<label for="introduce">자기소개</label>
					<textarea class="form-control" id="introduce" name="introduce">${teacherVo.introduce}</textarea> 
				</div>				
				<br><br>				
				<button type="submit" class="btn btn-primary">
					수정 완료
				</button>			
		</div>
		</form>		
		</div>
	</section>
</body>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>