<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">										
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">										
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>										
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>										
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>										
</head>
<script>
$(function(){
	var message = "${message}";
	if (message == "write_success") {
		alert("글 등록이 완료 되었습니다.");
	} else if (message == "delete_success") {
		alert("글 삭제가 완료되었습니다.");
	}
	
});

</script>
<body>
<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>공지사항 목록</h2>
					<p><a class="btn btn-primary btn-large btnRegist" 
						href="/notice/write_form">공지사항 등록</a></p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="noticeVo">
							<tr>
								<td>${noticeVo.bno}</td>
								<td><a class="a_title" href="${noticeVo.bno}">
									${noticeVo.title}</a>
								</td>
								<td>${noticeVo.user_id}</td>
								<td>${noticeVo.regdate}</td>
								
								<td><button type="button"
										class="btn btn-outline-info btnModify"
										href="/notice/write_form" data-bno="${noticeVo.bno}">수정</button></td>
								<td><button type="button"
										class="btn btn-outline-danger btnDelete"
										data-sno="${noticeVo.bno}">삭제</button></td>
								<td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>