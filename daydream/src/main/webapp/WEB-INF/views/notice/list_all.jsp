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
	
	// 등록하기
	$(function(){
		$(".btnwrite").click(function(){
			var admin = $(this).attr("data-user");
			console.log(admin);
			var bno = $(this).attr("data-bno");
			console.log("bno:", bno);
			if(admin == "kongzi"){
				location.href = "/notice/write_form?bno=" + bno;
			} else {
				alert("관리자로 로그인 해주세요.");
			}
		});
	});
	// 수정하기
	$(function(){
		$(".btnModify").click(function(){
			var admin = $(this).attr("data-user");
			console.log(admin);
			var bno = $(this).attr("data-bno");
			console.log("bno:", bno);
			if (admin == "kongzi") {
				location.href = "/notice/modify_form?bno=" + bno;
			} else {
				alert("관리자로 로그인 해주세요.");
			
			}
			
		});
	// 삭제하기
	$(function(){
		$(".btnDelete").click(function(){
			var admin = $(this).attr("data-user");
			console.log(admin);
			var bno = $(this).attr("data-bno");
			console.log("bno:", bno);
			if(admin == "kongzi") {
				location.href = "/notice/deleteNotice?bno=" + bno;
			} else {
				alert("관리자로 로그인 해주세요.");
			}
			
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
					<p><button type="button" style="background: #bfa071;" class="btn btn-primary btnwrite"
						data-bno="${noticeVo.bno}"
						data-user="${sessionScope.memberVo.user_id}">공지사항 등록</button></p>
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
										href="/notice/modify_run" 
										data-bno="${noticeVo.bno}" 
										data-user = "${sessionScope.memberVo.user_id}"
										style="background: #bfa071;">수정</button></td>
								<td><button type="button"
										class="btn btn-outline-danger btnDelete"
										data-user ="${sessionScope.memberVo.user_id}"
										data-bno="${noticeVo.bno}" style="background: #bfa071;">삭제</button></td>
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