<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {

	});
</script>
</head>
<body>



	<section id="features">
		<div class="container">
			<header>



				<div class="container-fluid">
					<div class="row">

						<div class="col-md-10" style="margin: 0 auto;">
							<h3>데이드림 회원 정보 수정</h3>
							<p>아이디는 변경이 불가능합니다.</p>
						</div>
						<br>
						<br>


					</div>
					<div class="row">
						<div class="col-md-5" style="margin: 0 auto;">
							<form role="form" action="/member/modify_run" method="post">
								<div class="form-group">
									<label for="user_id">아이디</label> <input type="text"
										class="form-control" id="user_id" name="user_id"
										value="${sessionScope.memberVo.user_name}" readonly />
								</div>
								<div class="form-group">
									<label for="user_pw">패스워드</label> <input type="password"
										class="form-control" id="user_pw" name="user_pw" />
								</div>
								<div class="form-group">
									<label for="user_name">이름</label> <input type="text"
										class="form-control" id="user_name" name="user_name" />
								</div>
								<div class="form-group">
									<label for="user_phone">전화번호</label> <input type="text"
										class="form-control" id="user_phone" name="user_phone" />
								</div>
								<br>
								<br>

								<button type="submit" class="btn btn-primary">수정 완료</button>
							</form>
						</div>
					</div>
				</div>

			</header>
		</div>
	</section>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>