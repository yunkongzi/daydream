<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>



<script>
$(function() {
	
	//회원 탈퇴
	$("#btnDeleteMember").click(function() {
		var user = $(this).attr("data-user");
		var url = "/member/deleteMember?user_id=" + user;
		location.href = url;
	});
	
	//내가 쓴 후기 보기
	$(".btnReview").click(function() {
		var bno = $(this).attr("data-bno");
		var url = "/review/content?page=1&perPage=10&searchType=&keyword=&bno=" + bno;
		location.href = url;
	});
	
	//후기 쓰기
	$(".btnReview_write").click(function() {
		var classNo = $(this).attr("data-classNo");
		var status = $(this).attr("data-status");
		if (status == "3") {
			var url ="/review/review_regist?class_no=" + classNo;
			location.href = url;
		}
	});
	
	//지원서 보기
	$(".btnTeacher").click(function() {
		var tno = $(this).attr("data-tno");
		console.log("tno: " + tno);
		var url = "/teacher/modifyTeacherForm?tno=" + tno;
		location.href = url;
	});
	
// 	//예약 취소
	$(".btnDelete").click(function() {
		var rno = $(this).attr("data-rno");
		var status = $(this).attr("data-status");
		if (status == 1) {
			location.href = "/member/deleteReservation?rno=" + rno;
			alert("취소가 완료되었습니다.");
		}
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
								<h5>【회원님의 정보입니다】</h5><br>
								아이디: ${sessionScope.memberVo.user_id} <br> 이름:
								${sessionScope.memberVo.user_name} <br> 전화번호:
								${sessionScope.memberVo.user_phone} <br>

								<button type="button"
									onclick="location.href='/member/modify'"
									style="background: #bfa071;">정보수정</button><br><br>

							</div><br><br>

							<div class="jumbotron">
								<h5>【예약하신 클래스 목록이에요】</h5>
								<label>후기는 수업이 완료되면 작성하실 수 있습니다.
									예약 취소는 예약중일 때만 하실 수 있습니다.</label><br><br>

								<table>
											<td>[예약번호]</td>
											<td>[예약날짜]</td>
											<td>[클래스이름]</td>
											<td>[교시]</td>
											<td>[예약인원]</td>
											<td>[상태]</td>
											<td>[후기작성]</td>
											<td>[예약취소]</td>
								
								
									<c:forEach items="${reservationList}" var="MyReservationVo">
										<tr>
											<td>${MyReservationVo.rno}</td>
											<td>${MyReservationVo.res_date}</td>
											<td>${MyReservationVo.class_name}</td>
											<td>${MyReservationVo.program_time}교시</td>
											<td>${MyReservationVo.count}명</td>
											<td>${MyReservationVo.status_name}</td>
											
											<td><button type="button" class="btnReview_write"
													data-classNo = "${MyReservationVo.class_no}"
													data-status = "${MyReservationVo.status}"
													style="background: #bfa071;">후기작성</button></td>
											<td><button type="button" class="btnDelete" 
													data-rno="${MyReservationVo.rno}"
													data-status = "${MyReservationVo.status}"
													style="background: #bfa071;">예약취소</button></td>
											
										</tr>
									</c:forEach>
								</table>
							</div><br><br>

							<div class="jumbotron">
								<h5>【작성하신 후기가 여기 있어요】</h5>
								<table>
								<tr>
									<td>[글번호]</td>
									<td>[작성날짜]</td>
									<td>[제목]</td>
									<td>[글 보기]</td>
								<tr>
									<c:forEach items="${myreviewList}" var="ReviewVo">
										<tr>
											<td>${ReviewVo.bno}</td>
											<td>${ReviewVo.regdate}</td>
											<td>${ReviewVo.title}</td>
											<td><button type="button" 
												data-bno="${ReviewVo.bno}"
												class="btnReview"
												style="background: #bfa071;">글 보기</button></td>
										</tr>
									</c:forEach>
								</table>
							</div><br><br>
							
							
							<div class="jumbotron">
								<h5>【강사 지원 하셨나요?】</h5>
								
								<table>
									<td>[글번호]</td>
									<td>[클래스이름]</td>
									<td>[상태]</td>
									<td>[보기]</td>
								
									<c:forEach items="${myTeacherList}" var="TeacherVo">
										<tr>
											<td>${TeacherVo.tno}</td>
											<td>${TeacherVo.class_name}</td>
											<td>${TeacherVo.status}</td>
											<td><button type="button" 
												data-tno="${TeacherVo.tno}"
												class="btnTeacher"
												style="background: #bfa071;">보기</button></td>
										</tr>
									</c:forEach>
								</table> 

							</div><br><br>
							
							
							
							
							<button type="button"
									data-user="${sessionScope.memberVo.user_id}"
									id="btnDeleteMember"
									style="background: #bfa071;">
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