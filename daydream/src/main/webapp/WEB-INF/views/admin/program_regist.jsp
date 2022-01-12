<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<h2 style=" text-align: center;">원데이 프로그램 등록</h2>
					<p></p>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form" action="/admin/regist_run" method="post">
							<div class="form-group">

								<label for="class_name"> 클래스명 </label><br> 
								<input
									type="text" class="form-control" name="class_name" />
							</div>
							<div class="form-group">

								<label for="price"> 가격 </label><br> 
								<input type="text"
									class="form-control" name="price" />
							</div>
							<div class="form-group">

								<label for="target"> 프로그램 대상 </label><br> 
								<input
									type="text" class="form-control" name="target" />
							</div>
							<div class="form-group">

								<label for="personnel"> 가능 인원 </label><br> 
								<input
									type="text" class="form-control" name="personnel" />
							</div>
							<div class="form-group">

								<label for="class_intro"> 프로그램 소개 </label><br>
								<textarea rows="5" cols="50" name="class_intro"></textarea>
							</div>
							
							<div class="form-group">

								<label for="time_no"> 개설 시간 </label><br>
								<c:forEach items="${timeList}" var="classTimeVo">
									<input type="checkbox" name="time_no" value="${classTimeVo.time_no}" checked>
									${classTimeVo.time_start} ~ ${classTimeVo.time_end}<br>
								</c:forEach>
							</div>
							<div class="form-group">
								<label for="file_image"> 사진 </label><br> 
								<input type="file" class="form-control" name="file_image" />
							</div>
							
							
							<button type="submit" class="btn btn-primary btnProgramReg">
								등록</button>
							<a class="btn btn-success btnAdminMain" href="/admin/admin_main">
								관리자 메인 화면
							</a>
							<a class="btn btn-secondary btnProList" href="/admin/program_list">
								프로그램 목록보기
							</a>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
