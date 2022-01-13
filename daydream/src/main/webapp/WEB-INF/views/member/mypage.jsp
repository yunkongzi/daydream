<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<script>
$(function() {
	
	
	$("#btnDeleteMember").click(function() {
		var user = $(this).attr("data-user");
		console.log("user: " + user);
		var url = "/member/deleteMember?user_id=" + user;
		location.href = url;
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
								<h5>【내 정보】</h5>
								아이디: ${sessionScope.memberVo.user_id} <br> 이름:
								${sessionScope.memberVo.user_name} <br> 전화번호:
								${sessionScope.memberVo.user_phone} <br>

								<button type="button" class="btn btn-outline-primary"
									onclick="location.href='/member/modify'">정보수정</button><br><br>

							</div><br><br>

							<div class="jumbotron">
								<h5>【나의 클래스 내역】</h5>

								<table>
									<c:forEach items="${reservationList}" var="MyReservationVo">
										<tr>
											<td>${MyReservationVo.res_date}</td>
											<td>${MyReservationVo.class_name}</td>
											<td>${MyReservationVo.program_time}</td>
											<td>${MyReservationVo.count}</td>
											<td>${MyReservationVo.status}</td>
											
											
											
											
											
											
											<td><button type="button"
													onclick="location.href='/review/review_regist?class_no=${MyReservationVo.class_no}'">후기작성</button></td>
											<td><button type="button" onclick=>예약취소</button></td>
											
											
											
											
											
											
											
										</tr>


									</c:forEach>
								</table>

							</div><br><br>




							<div class="jumbotron">
								<h5>【나의 후기】</h5>
								후기후기후기후기

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