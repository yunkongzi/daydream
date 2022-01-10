<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
		<div class="col-md-12" style="margin:0 auto;">
			<div class="jumbotron" >
				<h2>
					마이페이지
				</h2>
			</div>
			
			<div class="jumbotron">
				<h5>【내 정보】</h5>
				아이디: ${sessionScope.memberVo.user_id} <br>
				이름: ${sessionScope.memberVo.user_name} <br>
				전화번호: ${sessionScope.memberVo.user_phone} <br>
				
				<button type="button" class="btn btn-outline-primary" 
				onclick="location.href='/member/member_modify'">정보수정</button><br><br>
				
			</div><br><br><br>
			
			<div class="jumbotron">
				<h5>【예약 현황】</h5>
				예약한 수업 리스트 ...
				
			</div>
			
			<div class="jumbotron">
				<h5>【나의 후기】</h5>
				후기후기후기후기
				
			</div>
			
			
		</div>
	</div>
</div>

				
				
			</header>
		</div>
	</section>




</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>