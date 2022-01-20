<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 쓰기</title>			
</head>
<body>
	<div class="container-fluid" style="margin:0 auto;">
			<div class="row" style="margin:0 auto;">
				<div class="col-md-12" style="margin:0 auto;">
					<div class="jumbotron" style="margin:0 auto;">
						<h2>공지사항 양식</h2>
						<p><button type="button" style="background: #bfa071;"><a class="btn btn-primary btn-large" href="/notice/list_all">공지사항 목록</a></button></p>
					</div>
				</div>
			</div>
			<div class="row" style="margin:0 auto;">
				<div class="col-md-12" style="margin:0 auto;">
					<form role="form" action="/notice/notice_run" method="post">
				
				<div class="form-group" style="margin:0 auto;">
					<label for="title">제목</label>
					<input type="text" class="form-control" 
						id="title" name="title"/>
				</div>
				
				<div class="form-group" style="margin:0 auto;">
					<label for="content">공지 내용</label>
					<textarea rows="5" cols="100" class="form-control" 
						id="content" name="content"></textarea>
				</div>
				
						<button type="submit" class="btn btn-primary" style="background: #bfa071;">등록 완료</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>