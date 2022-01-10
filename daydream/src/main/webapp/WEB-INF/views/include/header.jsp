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
<link rel="stylesheet" href="/assets/css/main.css" />
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
						<li><a href="index.html"><span>데이드림</span></a></li>
						<li><a href="#"><span>프로그램</span></a></li>
						<li><a href="/reservation/reservation_regist"><span>예약하기</span></a></li>
						<li><a href="/teacher/teacher_regist"><span>인재모집</span></a></li>
						<li><a href="no-sidebar.html"><span>공지사항</span></a></li>
					</ul>
				</nav>


				<hr>
				<div class="nav-item" style="padding-top: 20px;">
					<h1 id="logo">
						<a href="/main">DAYDREAM</a>
					</h1>
					<p>One Day, One Dream</p>



					<c:choose>
						<c:when test="${empty sessionScope.memberVo }">
							<br>
							<br>
							<br>
							<button type="button" onclick="location.href='/member/login'">로그인</button>
							<button type="button"
								onclick="location.href='/member/member_regist'">회원가입</button>
						</c:when>
						
						<c:otherwise>
							<br>♡<br>
									데이드림과 꿈을 꾸실<br>
									 ${sessionScope.memberVo.user_name} 님!<br>

							<button type="button" onclick="location.href='/member/mypage'">마이페이지</button>
							<button type="button" onclick="location.href='/member/logout'">로그아웃</button>

						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</section>