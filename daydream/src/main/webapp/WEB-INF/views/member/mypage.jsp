<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>



<script>
$(function() {
	
	
	$("#btnDeleteMember").click(function() {
		var rno = $(this).attr("data-user");
		console.log("user: " + user);
		var url = "/member/deleteMember?user_id=" + user;
		location.href = url;
	});
	
	$(".btnReview").click(function() {
		var bno = $(this).attr("data-bno");
		console.log("bno: " + bno);
		var url = "/review/content?page=1&perPage=10&searchType=&keyword=&bno=" + bno;
		location.href = url;
	});
	
// 	//예약 삭제
	$(".btnDelete").click(function() {
		var rno = $(this).attr("data-rno");
		console.log(rno);
		location.href = "/member/deleteReservation?rno=" + rno;
		alert("취소가 완료되었습니다.");
	});

});
</script>
</head>
<body>


	<section id="features">
		<div class="container" style="margin: 0 auto;">
			<header>


				<div class="container-fluid" style="margin: 0 auto;">
					<div class="row">
						<div class="col-md-12" style="margin: 0 auto;">
							<div class="jumbotron">
								<h2>마이페이지</h2>
							</div>

							<div class="jumbotron">
								<h5>【회원님의 정보입니다】</h5>
								아이디: ${sessionScope.memberVo.user_id} <br> 이름:
								${sessionScope.memberVo.user_name} <br> 전화번호:
								${sessionScope.memberVo.user_phone} <br>

								<button type="button"
									onclick="location.href='/member/modify'">정보수정</button><br><br>

							</div><br><br>

							<div class="jumbotron">
								<h5>【예약하신 클래스 목록이에요】</h5>

								<table>
											<th>예약번호</th>
											<th>예약날짜</th>
											<th>클래스이름</th>
											<th>교시</th>
											<th>예약인원</th>
											<th>상태</th>
											<th>후기작성</th>
											<th>예약취소</th>
								
								
									<c:forEach items="${reservationList}" var="MyReservationVo">
										<tr>
											<td>${MyReservationVo.rno}</td>
											<td>${MyReservationVo.res_date}</td>
											<td>${MyReservationVo.class_name}</td>
											<td>${MyReservationVo.program_time}교시</td>
											<td>${MyReservationVo.count}명</td>
											<td>${MyReservationVo.status_name}</td>
											
											<td><button type="button"
													onclick="location.href='/review/review_regist?class_no=${MyReservationVo.class_no}'">후기작성</button></td>
											<td><button type="button" class="btnDelete" data-rno="${MyReservationVo.rno}">예약취소</button></td>
											
										</tr>
									</c:forEach>
								</table>
							</div><br><br>




							<div class="jumbotron">
								<h5>【작성하신 후기가 여기 있어요】</h5>
								<table>
									<th>글번호</th>
									<th>작성날짜</th>
									<th>제목</th>
									<th>글 보기</th>
								
									<c:forEach items="${myreviewList}" var="ReviewVo">
										<tr>
											<td>${ReviewVo.bno}</td>
											<td>${ReviewVo.regdate}</td>
											<td>${ReviewVo.title}</td>
											<td><button type="button" 
												data-bno="${ReviewVo.bno}"
												class="btnReview">글 보기</button></td>
										</tr>
									</c:forEach>
									
								</table>
								
								
								
								
								

							</div><br><br>
							
							
							<div class="jumbotron">
								<h5>【강사 지원 하셨나요?】</h5>
								강사 지원 내용 

							</div><br><br>
							
							
							
							
							<button type="button"
									data-user="${sessionScope.memberVo.user_id}"
									id="btnDeleteMember">
									회원탈퇴할래요 (정말요?😭)</button>
							


						</div>
					</div>
				</div>



			</header>
		</div>
	</section>




</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>