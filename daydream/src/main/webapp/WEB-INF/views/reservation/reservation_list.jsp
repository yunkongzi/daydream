<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation_list.jsp</title>

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
				<h2>
					 예약 조회
				</h2>
				
		
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>클래스명</th>
								<th>아이디</th>
								<th>회원이름</th>
								<th>전화번호</th>
								<th>예약시간</th>
							
								<th>예약날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="reservationVo">
							<tr>
								<td>${reservationVo.class_name}</td>
								<td>${reservationVo.user_id}</td>
								<td>${reservationVo.user_name}</td>
								<td>${reservationVo.user_phone}</td>
								
								<td>${reservationVo.res_time}</td>
								<td>${reservationVo.res_date}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>
