<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 리스트</title>
<style>
	p {
		
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>			
</head>
<body>
	<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2 style=" text-align: center;">등록된 프로그램</h2>
					<p></p>
					
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>클래스명</th>
							<th>가격</th>
							<th>프로그램 대상</th>
							<th>가능 인원</th>
							<th>프로그램 소개</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="programVo">
							<tr>
								<td>${programVo.class_name}</td>
								<td>${programVo.price}</td>
								<td>${programVo.target}</td>
								<td>${programVo.personnel}</td>
								<td>${programVo.class_intro}</td>
  								<td><button type="button"
										class="btn btn-outline-info btnModify"
										href="/admin/program_modify" data-class_name="${programVo.class_name}">수정</button></td>
								<td><button type="button"
										class="btn btn-outline-danger btnDelete"
										data-class_name="${programVo.class_name}">삭제</button></td>
								<td>

							</tr>
						</c:forEach>
						<a class="btn btn-success btn-md btn-block active btn-outline-warning" href="/admin/program_regist">
						새로운 프로그램 등록</a>
					</tbody>
					
				</table>
			</div>
		</div>
</body>
</html>