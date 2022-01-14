<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		
<title>예약자 현황 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
<style>
	.btnAdMain{
		margin : auto;
		display : block;
	}
</style>
</head>
<body>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2 style="text-align:center;">예약자 현황</h2>
				<p style="text-align:center;">예약 정보를 정확하게 확인해주세요.</p>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>회원 아이디</th>
								<th>예약 날짜</th>
								<th>예약번호</th>
								<th>클래스 번호</th>
								<th>클래스 이름</th>
								<th>인원수</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="ReservationVo">
							<tr>
								<td>${ReservationVo.user_id}</td>
								<td>${ReservationVo.res_date}</td>
								<td>${ReservationVo.rno}</td>
								<td>${ReservationVo.class_sub_no}</td>
								<td>${ReservationVo.class_name}</td>
								<td>${ReservationVo.count}</td>
								<td>${ReservationVo.status}</td>
								<td>${ReservationVo.status_name}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-4">
						</div>
						<div class="col-md-4">
						<button type="button" class="btn btn-warning btn-sm btnAdMain">
								<a href="/admin/admin_main">관리자 메인</a>
							</button>
						</div>
						<div class="col-md-4">
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>