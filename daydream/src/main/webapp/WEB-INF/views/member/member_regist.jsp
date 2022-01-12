<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

											
<script>

$(function() {
	
	//아이디 중복 체크
	$("#btnCheckDupId").click(function() {
		var url = "member/checkDupId/" + $("#user_id").val();
		$.get(url, function(rData) {
			console.log(rData);
			if (rData == "used") {
				$("#btnCheckDupId").next().html("<br>사용중인 아이디입니다. 다른 아이디를 입력해주세요.");
				$("#btnCheckDupId").next().css("color", "red");
			} else {
				$("#btnCheckDupId").next().html("<br>사용가능한 아이디입니다.");
				$("#btnCheckDupId").next().css("color", "blue");
			}
		});
	});
	
// 	$("#btnSubmit").click(function() {
// 		if ($("#user_id").val() == null) {
// 			alert("아이디를 입력해주세요.");
// 		} else if ($("#user_pw").val() == null) {
// 			alert("비밀번호를 입력해주세요.");
// 		} else if ($("#user_name").val() == null) {
// 			alert("이름을 입력해주세요.");
// 		} else if ($("#user_phone").val() == null) {
// 			alert("전화번호를 입력해주세요.");
// 		} 
// 	});


});
</script>
</head>
<body>



<section id="features">
		<div class="container">
			<header>
				
				
				
<div class="container-fluid">
	<div class="row">

	<div class="col-md-10" style="margin:0 auto;">
	<h3>데이드림 가입양식</h3>
	<p>아래 내용을 빠짐없이 입력해주세요</p>
	</div><br><br>


	</div>
	<div class="row" >
		<div class="col-md-5" style="margin:0 auto;">
			<form role="form" action="/member/regist_run" 
				method="post">
				<div class="form-group" >
					<label for="user_id">아이디</label>
					<input type="text" class="form-control" 
						id="user_id" name="user_id" />
				</div><br>
				<div class="form-group">
					<button type="button" class="btn btn-warning"
						id="btnCheckDupId">아이디 중복체크</button>
					<span></span>
				</div>
				<div class="form-group">
					<label for="user_pw">패스워드</label>
					<input type="password" class="form-control" 
						id="user_pw" name="user_pw" />
				</div>
				<div class="form-group">
					<label for="user_name">이름</label>
					<input type="text" class="form-control" 
						id="user_name" name="user_name" />
				</div>
				<div class="form-group">
					<label for="user_phone">전화번호</label>
					<input type="text" class="form-control" 
						id="user_phone" name="user_phone" />
				</div><br><br>
				
				<button type="submit" class="btn btn-primary" id="btnSubmit">
					가입 완료
				</button>
			</form>
		</div>
	</div>
</div>
				
				
			</header>
		</div>
	</section>





</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>