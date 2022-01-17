
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>프로그램 리스트</title>
<style>
	.btnNewPro {
		margin : auto;
		display : block;
	}
	td {
		text-align:center;
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<script>

</script>
<body>

			<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2 style="text-align:center;">클래스 보기 </h2>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered">
						
						<tbody>
								<tr><td class="text-center">${programVo.class_name}</td></tr>
								<tr><td>
								<c:if test="${not empty programVo.file_image}">
									<img src="/admin/displayImage?fileName=${programVo.file_image}" height="400" width="500"/>
								</c:if></td></tr>
								<tr><td>${programVo.class_content}</td></tr>
								<tr><td>개설 시간</td></tr>
								<tr>
									<td>
										<c:forEach items="${timeList}" var="time">
											${time.time_no}: ${time.time_start}:00 ~ ${time.time_end}:00<br>
										</c:forEach>
									</td>
								</tr>
								
								
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>