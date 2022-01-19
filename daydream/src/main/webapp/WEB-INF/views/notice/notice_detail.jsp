<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
<div class="container-fluid" style="margin:0 auto;">
			<div class="row" style="margin:0 auto;">
				<div class="col-md-12" style="margin:0 auto;">
					<div class="jumbotron" style="margin:0 auto;">
						<h2>상세보기</h2>
					</div>
				</div>
			</div>
			<div class="row" style="margin:0 auto;">
				<div class="col-md-12" style="margin:0 auto;">
					<form role="form" action="/notice/notice_run" method="post">
				
				<div class="form-group" style="margin:0 auto;">
					<label for="title">제목</label>
					<input type="text" class="form-control" 
						id="title" name="title" readonly="readonly" value="${noticeVo.title}"/>
				</div>
				
				<div class="form-group" style="margin:0 auto;">
					<label for="content">공지 내용</label>
					<textarea readonly="readonly" class="form-control" 
						id="content" name="content">${noticeVo.content}</textarea>
				</div>
				
						<button type="submit"><a class="btn btn-success" 
							href="/notice/list_all">공지사항 목록</a></button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>