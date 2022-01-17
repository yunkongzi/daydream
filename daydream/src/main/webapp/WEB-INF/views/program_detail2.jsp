<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 상세페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
		<table class="table">
				<tbody>
				<tr>
				<td>${programVo.class_name}<br></td>
				<td>
					<c:if test="${not empty programVo.file_image}">
						<img src="/admin/displayImage?fileName=${programVo.file_image}" height="250" width="350"/>
					</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="col-md-1">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table">
				<tbody>
<%-- 					 <c:forEach items="${programList}" var="programVo"> --%>
					<tr>
					<td>
						<c:if test="${not empty programVo.file_image}">
									<img src="/admin/displayImage?fileName=${programVo.file_image}" height="250" width="350"/>
						</c:if>
					</td>
					</tr>
<%-- 					</c:forEach>  --%>
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
		</div>
		<div class="col-md-1">
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>