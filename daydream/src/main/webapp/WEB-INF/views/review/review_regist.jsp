<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<script>
$( ".star_rating a" ).click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    return false;
});
</script>
<style>
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#777;}
</style>

<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>후기 양식</h2>
				<p><a class="btn btn-primary btn-large" href="/">후기 목록</a></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/review/regist_run" id="frmRegist"
				method="post">
				<div class="form-group">
					<label for="userid">아이디</label>
					<input type="text" class="form-control" 
						id="userid" name="userid" required="required"/>
				</div>
				<div class="form-group">
					<label for="title">글제목</label>
					<input type="text" class="form-control" 
						id="title" name="title" required="required"/>
				</div>
				<div class="form-group">
					<label for="content">후기 내용</label>
					<textarea class="form-control" 
						id="content" name="content"></textarea>
				</div>
			
				<!-- 이미지파일 업로드 -->
				<div>
					<label>첨부할 파일을 드래그 &amp; 드롭하세요</label>
					<div id="fileDrop"></div>
				</div>
				
				<!-- 별점 첨부 -->
				<div class="from-group">
				<label for="star_rating">평점</label>
				<p class="star_rating">
					<a href="#" class="on">★</a>
					<a href="#" class="on">★</a>
					<a href="#" class="on">★</a>
					<a href="#">★</a>
					<a href="#">★</a></p>
				</div>		
				<div>
					<button type="submit" class="btn btn-primary" id="btnSubmit">
					작성 완료
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>