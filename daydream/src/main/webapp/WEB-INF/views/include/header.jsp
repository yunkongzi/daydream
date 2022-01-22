<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML>
<!--
   Strongly Typed by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>DAYDREAM</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/assets/css/main.css" />
<style>
select {
	display: inline;
}
</style>
</head>


<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container"
				style="padding-top: 100px; padding-bottom: 20px;">

				<!--                   Logo -->


				<!-- Nav -->
				<nav id="nav">
					<ul>

						<li><a href="/company/introduction">
							<img src="/images/daydream.jpg" style="width:100px;" height="40px;"></a>
										<ul>
											<li><a href="/company/introduction">데이드림 소개</a></li>
											<li><a href="/company/road">오시는 길</a></li>
										</ul></li>
						<li><a href="/program_intro">
							<img src="/images/program.jpg" style="width:150px;" height="48px;"></a></li>
						<li><a href="/review/reviewList_all">
							<img src="/images/review.jpg" style="width:100px;" height="38px;"></a></li>
						<li><a href="/teacher/teacher_regist">
							<img src="/images/teacher.jpg" style="width:100px;" height="38px;"></a></li>
						<li><a href="/notice/list_all">
							<img src="/images/notice.jpg" style="width:100px;" height="38px;"></a></li>
					</ul>
				</nav>


			
				<div class="nav-item" style="padding-top: 20px;">
					<h1 id="logo">
						<a href="/main"><img src="/images/logo.jpg" style="width:800px;" height="160px;"></a>
					</h1>
					
					
					<c:set var="id" value="${sessionScope.memberVo.user_id}"/>

					<c:choose>
						<c:when test="${empty sessionScope.memberVo }">
							<br>
							<br>
							<br>
							
							<button type="button" onclick="location.href='/member/login'"
							style="background: #bfa071;">로그인</button>
							<button type="button" onclick="location.href='/member/member_regist'"
							style="background: #bfa071;">회원가입</button>
							
						</c:when>
						
						<c:when test="${id eq 'kongzi'}">
							<br>
							<br>
							<br>
							 ${sessionScope.memberVo.user_name}! <br>
							<button type="button" onclick="location.href='/member/logout'"
							style="background: #bfa071;">로그아웃</button>
							<button type="button"
								onclick="location.href='/admin/admin_main'"
								style="background: #bfa071;">관리자메인</button>
						</c:when>
						
						
						<c:otherwise>
							<br>♡<br>
									데이드림과 꿈을 꾸실<br>
									 ${sessionScope.memberVo.user_name} 님!<br>

							<button type="button" onclick="location.href='/member/mypage'"
							style="background: #bfa071;">마이페이지</button>
							<button type="button" onclick="location.href='/member/logout'"
							style="background: #bfa071;">로그아웃</button>

						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</section>