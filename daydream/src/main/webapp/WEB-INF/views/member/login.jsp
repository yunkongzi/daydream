<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

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
				<h2>DAYDREAM LOGIN PAGE</h2>
				
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/member/login_run" 
				method="post">
				<div class="form-group">
					<label for="user_id">아이디</label>
					<input type="text" class="form-control" 
						id="user_id" name="user_id" />
						
						<div class="checkbox">
						<label>
							<input type="checkbox" 
								name="saveId"/> 아이디 기억하기
						</label>
						</div> 
				</div>
				<div class="form-group">
					<label for="user_pw">패스워드</label>
					<input type="password" class="form-control" 
						id="user_pw" name="user_pw" />
				</div>
				
				<button type="button" class="btn btn-outline-primary" 
				onclick="location.href='/member/member_regist'">회원가입하기</button><br><br>

				<button type="submit" class="btn btn-outline-success">
					 로그인
				</button>
				
			</form>
		</div>
	</div>
</div>

</body>
</html>