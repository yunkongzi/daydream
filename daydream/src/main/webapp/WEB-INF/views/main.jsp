<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function() {
	var message = "${message}";
	if (message == "logout") {
		alert("로그아웃 되었습니다.");
	} else if (message == "login") {
		alert("정보변경이 되었습니다.\n다시 로그인해주세요.");
	}
});
</script>
<title>DAYDREAM MAIN PAGE</title>
</head>
<body>

<!-- Logo -->
<!-- 			<section id="header"> -->
<!--                <div class="container" style="padding-top:50px; padding-bottom:50px;"> -->
<!--                      <h1 id="logo"><a href="/main">DAYDREAM</a></h1> -->
<!--                      <p>One Day, One Dream</p> -->
<!--                </div> -->
<!--             </section> -->

	<section id="features">
		<div class="container">
			<header>
				
				
				"여기에 내용물을 넣어주세요"
				
			</header>
		</div>
	</section>




</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>