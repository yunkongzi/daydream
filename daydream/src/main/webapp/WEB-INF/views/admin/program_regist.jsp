<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원데이 프로그램 등록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<style>
	* {
	
	}
</style>

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
					<h2 style=" text-align: center;">원데이 프로그램 등록</h2>
					<p></p>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form">
							<div class="form-group">

								<label for="class_name"> 클래스명 </label><br> <input
									type="text" class="form-control" id="class_name" />
							</div>
							<div class="form-group">

								<label for="price"> 가격 </label><br> <input type="number"
									class="form-control" id="price" />
							</div>
							<div class="form-group">

								<label for="target"> 프로그램 대상 </label><br> <input
									type="text" class="form-control" id="target" />
							</div>
							<div class="form-group">

								<label for="personnel"> 가능 인원 </label><br> <input
									type="number" class="form-control" id="personnel" />
							</div>
							<div class="form-group">

								<label for="class_intro"> 프로그램 소개 </label><br>
								<textarea rows="5" cols="50" id="class_intro"></textarea>
							</div>
							<button type="submit" class="btn btn-primary btnProgramReg">
								등록</button>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>