<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사등록</title>

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
				<h2>강사 등록 양식</h2>
				
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/member/regist_run" 
				method="post">
				<div class="form-group">
					<label for="tno">강사번호</label>
					<input type="text" class="form-control" 
						id="tno" name="tno" />
				</div>
				<div class="form-group">
					<label for="class_name">강의명</label>
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
					<label for="introduce">자기소개</label>
					<textarea class="form-control" placeholder="자기소개"
						id="introduce" name="introduce"></textarea>
				</div>
			
				<button type="submit" class="btn btn-primary">
					등록 완료
				</button>
				<button type="button" class="btn btn-warning"
						id="btnModify">수정</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>