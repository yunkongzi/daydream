<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;}
</style>

<body>

<h2 class="w3-center">introduction</h2>

<div class="w3-content w3-section" style="max-width:400px">
  <img class="mySlides" src="/images/h.jpg" style="width:100%" height="500" align="center">
  <img class="mySlides" src="/images/c1.JPG" style="width:100%" height="500" align="center">
  <img class="mySlides" src="/images/cc.JPG" style="width:100%" height="500" align="center">
 </div>

<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 950); 
}
</script>
<section id="features">
<div class="container-fluid" style="margin:0 auto;">
<!-- 	<img src="/images/1.jpg" alt="소개" width="400" height="400" align="center">

 -->
<style>
	p {font-size: 15px; letter-spacing: 2px;}
</style>
	
  <p>데이드림을 방문해주신 모든 분들에게 감사의 인사를 드립니다.<br>
 데이드림은 회원들의 잠재된 능력과 소질을 찾고 다양한<br> 
 세대들의 폭넓은 체험의 기회를 제공하고자 합니다.<br> 
 스트레스 해소와 일상의 활력을 위한 취미활동을 넘어 기초부터 <br>
 고급과정까지 높은 퀄리티의 강의를 제공하겠습니다.<br>
 실력있는 강사진을 갖춰 보다 흥미로운 강좌를 발굴하고 <br>
 여러분의 편의에 서서 노력하는 데이드림이 되겠습니다.<br> 
 모든 회원을 위한 다양한 체험의 기회와 관련 정보 및 자격증,<br>
 부업정보 등 개성 탐구와 능력 향상을 위해 노력하며 즐거운 <br>
 삶을 지향하는 장으로 강사와 회원여러분이 함께 참여하여 만들어<br>
 가도록 노력하겠습니다. 감사합니다.</p>


</div>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
