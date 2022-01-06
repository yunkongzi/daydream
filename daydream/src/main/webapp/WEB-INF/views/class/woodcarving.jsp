<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>woodcarving.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">		
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>		
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>		
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>		
</head>
<body>
<!-- 	안녕하세요. 쇼핑몰 중심 JSP 시작입니다!!!<br> -->
<%-- 	<jsp:include page="duke_image.jsp"> --%>
<%-- 		<jsp:param value='<%=URLEncoder.encode("듀크2", "utf-8") %>' name="name"/> --%>
<%-- 		<jsp:param value="duke2.png" name="imgName"/> --%>
<%-- 	</jsp:include> --%>
<!-- 	<br>안녕하세요. 쇼핑몰 중심 JSP 끝 부분입니다!!!! -->
		
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-info">
				우드카빙 클래스
			</h3>
			<div class="row">
				<div class="col-md-6">
					<img alt="wood image" src="WEB-INF/.jpg" class="rounded" />
				</div>
				<div class="col-md-6">
					<h2>
						Heading
					</h2>
					<p>
						Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
					</p>
					
				</div>
			</div><img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="rounded" />
			<h2>
				Heading
			</h2>
			<p>
				Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
			</p>
			
			<button type="button" class="btn btn-success btn-md">
				강의신청
			</button> 
			<button type="button" class="btn btn-sm btn-info active disabled">
				목록
			</button>
		</div>
	</div>
</div>
</body>
</html>