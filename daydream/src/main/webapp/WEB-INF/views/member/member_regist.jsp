<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>회원 가입 양식</h2>
				
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/member/regist_run" 
				method="post">
				<div class="form-group">
					<label for="user_id">아이디</label>
					<input type="text" class="form-control" 
						id="user_id" name="user_id" />
				</div>
				<div class="form-group">
					<label for="user_pw">패스워드</label>
					<input type="password" class="form-control" 
						id="user_pw" name="user_pw" />
				</div>
				<div class="form-group">
					<label for="user_name">이름</label>
					<input type="text" class="form-control" 
						id="user_name" name="user_name" />
				</div>
				<div class="form-group">
					<label for="user_phone">전화번호</label>
					<input type="text" class="form-control" 
						id="user_phone" name="user_phone" />
				</div>
				
				<button type="submit" class="btn btn-primary">
					가입 완료
				</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>