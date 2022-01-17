<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

											
<script>

$(function() {
	var isDupIdChecked = false;
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
				isDupIdChecked = true;
			}
		});
	});
	
	
	$("#registform").submit(function() {
		if (isDupIdChecked == false) {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
	});

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
			<form role="form" action="/member/regist_run" id="registform"
				method="post">
				<div class="form-group" >
					<label for="user_id">아이디</label>
					<input type="text" class="form-control" 
						id="user_id" name="user_id" size="25" maxlength="25" required/>
				</div><br>
				<div class="form-group">
					<button type="button" class="btn btn-warning"
						id="btnCheckDupId">아이디 중복체크</button>
					<span></span>
				</div>
				<div class="form-group">
					<label for="user_pw">비밀번호</label>
					<input type="password" class="form-control" 
						id="user_pw" name="user_pw" required />
				</div>
				<div class="form-group">
					<label for="user_pwCk">비밀번호 확인</label>
					<input type="password" class="form-control" 
						id="user_pwCk" name="user_pwCk" required />
				</div>
				<div class="form-group">
					<label for="user_name">이름</label>
					<input type="text" class="form-control" 
						id="user_name" name="user_name" required />
				</div>
				<div class="form-group">
					<label for="user_phone">전화번호</label>
					<input type="text" class="form-control" 
						id="user_phone" name="user_phone" required />
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