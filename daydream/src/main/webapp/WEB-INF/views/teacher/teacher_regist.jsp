<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<title>강사등록</title>
<script src="/js/myscript.js"></script>

<script>
$(function() {
			
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
		
	$("#btnFile").click(function() {
		$("#certificate").trigger("click");
	});
}); // $(function)
		
</script>



<style>
.container-fluid {
  background-color: #fffee5;
  width: 600px;
  border: 15px solid #5e7e9b;
  padding: 50px;
  margin: 20px;
}

.btn-primary {
  width: 200px;
  height: 80px;
  background-color: red;
  animation-name: example;
  animation-duration: 4s;
}

@keyframes example {
  from {background-color: red;}
  to {background-color: yellow;}
}
h2 {
  color: white;
  text-shadow: 2px 2px 4px #000000;
}
</style>
</head>
<body>
<div>						
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
					<button type="button" id="btnFile" style="background: #bfa071;">파일 첨부</button>
				</div>
												
				<div class="form-group">
					<label for="introduce">자기소개</label>
					<textarea class="form-control" placeholder="50자 내외로 글을 작성해주세요."
						id="introduce" name="introduce"></textarea>
				</div>				
				<button type="submit" class="btn btn-primary" style="background: #bfa071;">등록완료</button>				
			</form><br>		
		   <div align="center">
			<i class="fas fa-cloud"></i>
			<i class="fas fa-heart"></i>
			<i class="fas fa-car"></i>
			<i class="fas fa-file"></i>
			<i class="fas fa-bars"></i>
		</div>
		</div>		
	</div>
</div>
</div>	

<%@ include file="/WEB-INF/views/include/footer.jsp"%>