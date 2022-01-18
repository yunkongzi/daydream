<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<head>

<title>예약수정</title>

<script>

</script>
</head>
<body>



	<section id="features">
		<div class="container">
			<header>



				<div class="container-fluid">
					<div class="row">


					</div>
					<div class="row">
						<div class="col-md-5" style="margin: 0 auto;">
							<form role="form" action="/member/modify_run" method="post">
								<div class="form-group">
									<label for="user_id">아이디</label> <input type="text"
										class="form-control" id="user_id" name="user_id"
										value="${reservationListVo.user_id}" readonly="readonly" />
								</div>
								<div class="form-group">
									<label for="user_name">이름</label> <input type="text"
										class="form-control" id="user_name" name="user_name" 
										value="${reservationListVo.user_name}"/>
								</div>
								<div class="form-group">
									<label for="user_phone">전화번호</label> <input type="text"
										class="form-control" id="user_phone" name="user_phone" 
										value="${reservationListVo.user_phone}"/>
								</div>
								<div class="form-group">
									<label for="res_date">예약날짜</label> <input type="text"
										class="form-control" id="res_date" name="res_date" 
										value="${reservationListVo.res_date}"/>
								</div>
								<div class="form-group">
									<label for="time_no">예약 시간</label> <input type="text"
										class="form-control" id="time_no" name="time_no" 
										value="${sessionScope.reservationListVo.time_no}"/>
								</div>
								<div class="form-group">
									<label for="count">인원수</label> <input type="text"
										class="form-control" id="count" name="count"
										value="${sessionScope.reservationListVo.count}"/>
								</div>
								<br>
								<br>

								<button type="submit" class="btn btn-primary">예약수정완료</button>
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