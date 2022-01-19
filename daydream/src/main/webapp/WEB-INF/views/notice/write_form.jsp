<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 쓰기</title>
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
						<h2>공지사항 쓰기양식</h2>
						<p><a class="btn btn-primary btn-large" href="/notice/list_all">공지사항 목록</a></p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form role="form" action="/notice/notice_run" method="post">
				
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" class="form-control" 
						id="title" name="title"/>
				</div>
				
				<div class="form-group">
					<label for="content">공지 내용</label>
					<textarea class="form-control" 
						id="content" name="content"></textarea>
				</div>
				
						<button type="submit" class="btn btn-primary">등록 완료</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>