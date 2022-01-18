<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 양식</title>
</head>
<body>
<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="jumbotron">
						<h2>공지사항 수정 양식</h2>
						<p><a class="btn btn-primary btn-large" href="/notice/list_all">공지사항 목록</a></p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form role="form" action="/notice/notice_run" method="post">
				
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" class="form-control" 
						id="title" name="title"/>
				</div>
				
				<div class="form-group">
					<label for="content">공지 내용</label>
					<textarea class="form-control" 
						id="content" name="content"></textarea>
				</div>
				
						<button type="submit" class="btn btn-primary">등록 완료</button>
					</form>
				</div>
			</div>
		</div>

</body>
</html>