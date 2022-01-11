<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(function() {
	

});
</script>
</head>
<body>


<section id="features">
		<div class="container" style="margin:0 auto;">
			<header>
												
<div class="container-fluid" style="margin:0 auto;">
	<div class="row">

	<div class="col-md-10" style="margin:0 auto;">
	<h3>데이드림 강사 정보 수정</h3>
	<p>강사번호는 변경이 불가능합니다.</p>
	</div><br><br>


	</div>
	<div class="row" >
		<div class="col-md-5" style="margin:0 auto;">
			<form role="form" action="/teacher/modify_run" 
				method="post">
				<div class="form-group" >
					<label for="tno">강사번호</label>
					<input type="text" class="form-control" 
						id="tno" name="tno" value="${sessionScope.teacherVo.tno}" readonly/>
				</div>
				<div class="form-group">
					<label for="class_name">클래스명</label>
					<input type="name" class="form-control" 
						id="class_name" name="class_name" />
				</div>
				<div class="form-group">
					<label for="price">가격</label>
					<input type="text" class="form-control" 
						id="price" name="price" />
				</div>
				<div class="form-group">
					<label for="personnel">인원</label>
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
					<input type="text" class="form-control" 
						id="introduce" name="introduce" />
				</div>				
				<br><br>
				
				<button type="submit" class="btn btn-primary">
					수정 완료
				</button>
			</form>
		</div>
	</div>
</div>
</header>
</div>
</section>

</body>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>