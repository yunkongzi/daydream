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
<script>
$(function(){
	//예약 수정
$(".btnModify").click(function() {
		var rno = $(this).attr("data-rno");
		location.href = "/reservation/res_modify?rno=" + rno;
	});
	
	//예약 삭제
	$(".btnDelete").click(function() {
		var rno = $(this).attr("data-rno");
		console.log(rno);
		location.href = "/reservation/deleteReservation?rno=" + rno;
		alert("취소가 완료되었습니다.");
	});
	
	//예약확인 버튼 누를시 상태 예약완료,수업완료로 변경
	$(".btnOk").click(function(){
		var rno = $(this).attr("data-rno");
		console.log(rno);
		var status_code = $(this).parent().prev().find(".select_status").val();
		console.log("status_code:" + status_code);
		var url ="/reservation/change_status";
		var sendData = {
				"rno" : rno,
				"status_code" : status_code
		};
		$.get(url, sendData, function(receivedData) {
			console.log(receivedData);
				alert("예약상태가 변경되었습니다.");
		});
		
	});
	
});	
</script>
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
								<th>예약 번호</th>
								<th>회원 아이디</th>
								<th>회원이름</th>	
								<th>회원 전화번호</th>
								<th>클래스 이름</th>
								<th>예약 날짜</th>
								<th>예약 시간</th>
								<th>예약 인원수</th>
								<th>상태</th>
								<th>예약확인</th>
								<th>수정</th>
								<th>삭제</th>
						</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${list}" var="reservationListVo" >
							<tr>

								<td>${reservationListVo.rno}</td>
								<td>${reservationListVo.user_id}</td>
								<td>${reservationListVo.user_name}</td>
								<td>${reservationListVo.user_phone}</td>
								<td>${reservationListVo.class_name}</td>
								<td>${reservationListVo.res_date}</td>
								<td>${reservationListVo.time_no}(${reservationListVo.time_start}~${ReservationListVo.time_end}시)</td>
								<td>${reservationListVo.count}명</td>
								<td>
									<select class="select_status">
										<c:forEach items="${statusList}" var="statusVo">
											<option value="${statusVo.status_code}"
												<c:if test="${reservationListVo.status_name == statusVo.status_name}">
													selected
												</c:if>
											>${statusVo.status_name}</option>
										</c:forEach>
										
										
									</select>
								
								${ReservationListVo.status_name}</td>
								<td><button style="background: #bfa071;" type="button" class="btn btn-info btnOk" data-rno="${reservationListVo.rno}">상태변경</button></td>
								<td><button style="background: #bfa071;" type="button" class="btn btn-warning btnModify"
									data-rno="${reservationListVo.rno}">수정</button></td>
								<td><button style="background: #bfa071;" type="button" class="btn btn-info btnDelete"
									 data-rno="${reservationListVo.rno}">삭제</button></td>
								
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-4">
						</div>
						<div class="col-md-4">
						<button style="background: #bfa071;" type="button" class="btn btn-warning btn-sm btnAdMain">
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