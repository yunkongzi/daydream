<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>



<script>
$(function() {
	
	//로그인 실패 시
	var msg = "${msg}"; // fail
	if (msg == "fail") {
		alert("아이디 또는 비밀번호가 잘못 입력 되었습니다.\n아이디와 비밀번호를 정확히 입력해 주세요.");
	} else if (msg == "nothing") {
		alert("탈퇴한 회원입니다.");
	}
	
	
});

</script>
</head>
<body>



<section id="features">
		<div class="container">
			<header>
				
				
				<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin:0 auto;">
			
				<h2>DAYDREAM LOGIN PAGE</h2>
				
			
		</div>
	</div>
	<div class="row">
		<div class="col-md-12" style="margin:0 auto;">
			<form role="form" action="/member/login_run" 
				method="post">
				<div class="form-group">
					<label for="user_id">아이디</label>
					<input type="text" class="form-control" 
						id="user_id" name="user_id" />
						
				</div>
				<div class="form-group">
					<label for="user_pw">패스워드</label>
					<input type="password" class="form-control" 
						id="user_pw" name="user_pw" />
				</div><br><br><br>
				
				<button type="submit" id="btnLogin">로그인</button><br><br>
				
				<button type="button" id="btnRegist"
				onclick="location.href='/member/member_regist'">회원가입</button><br><br>

				
			</form>
		</div>
	</div>
</div>
				
				
</header>
</div>
</section>
</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>