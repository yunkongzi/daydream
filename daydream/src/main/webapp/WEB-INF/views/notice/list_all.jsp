<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<script>
	// 수정하기
	$(function(){
		$(".btnModify").click(function(){
			var bno = $(this).attr("data-bno");
			console.log("bno:", bno);
			location.href = "/notice/modify_form?bno=" + bno;
		});
	// 삭제하기
	$(function(){
		$(".btnDelete").click(function(){
			var bno = $(this).attr("data-bno");
			location.href = "/notice/deleteNotice?bno=" + bno;
		});
	});
	
	// 글제목 
	$(".a_title").click(function(e){
		e.preventDefault();
		var bno = $(this).attr("href");
		console.log("bno:", bno);
		location.href = "/notice/notice_detail?bno=" + bno;
	});
});

</script>
<body>
<div class="row" style="margin:0 auto;">
			<div class="col-md-12" style="margin:0 auto;">
				<div class="jumbotron" style="margin:0 auto;">
					<h2>공지사항</h2>
					<p><button type="button"><a class="btn btn-primary" 
						href="/notice/write_form">공지사항 등록</a></button></p>
				</div>
			</div>
		</div>
		<div class="row" style="margin:0 auto;">
			<div class="col-md-12" style="margin:0 auto;">
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
										href="/notice/modify_run" data-bno="${noticeVo.bno}">수정</button></td>
								<td><button type="button"
										class="btn btn-outline-danger btnDelete"
										data-bno="${noticeVo.bno}">삭제</button></td>
								<td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>