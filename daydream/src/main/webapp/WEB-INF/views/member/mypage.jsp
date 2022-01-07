<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
<script>

$(function() {
	


});
</script>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" style="background-color:olive !important;">
				<h2>
					마이페이지
				</h2>
			</div>
			
			<div class="jumbotron">
				<h5>【내 정보】</h5>
				아이디: ${sessionScope.memberVo.user_id} <br>
				이름: ${sessionScope.memberVo.user_name}
			</div>
			
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

</body>
</html>