<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>관리자 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>			
</head>
<script>
// $(function() {
// 	$(".btnProReg").click(function() {
		
// 	});
// });
</script>
<body>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2 style=" text-align: center;"> 관리자 메뉴 </h2>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<a class="btn btn-outline-info btn-lg btn-block
							btnReserv" href="/main">
						메인으로 돌아이잉ㅇ
					</a> 
					<p></p>
					<a class="btn btn-outline-warning btn-lg btn-block
							btnReserv" href="/reservation/reservation_list">
						예약자 현황
					</a> 
					<p></p>
					<a class="btn btn-outline-success btn-lg btn-block
							btnProReg" href="/admin/program_list">
							
						프로그램 목록
					</a> 
					<p></p>
					<a class="btn btn-outline-primary btn-lg btn-block
							btnBoardAd">
						게시판 관리
					</a> 
					<p></p>
					<a class="btn btn-lg btn-outline-danger btn-block
							btnTeachAd" href="/teacher/teacher_list">
						강사지원 관리
					</a>
					<p></p>
					
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>