<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>후기 수정 양식</h2>
				<p><a class="btn btn-primary btn-large" href="/">후기 목록</a></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/review/regist_run" id="frmRegist"
				method="post">
			<input type="hidden" name="bno" value="${reviewVo.bno}">
				<div class="form-group">
					<label for="bno">글번호</label>
					<input type="text" class="form-control"
						id="bno" name="bno" required="required" value="${reveiwVo.bno}" readonly/>
				</div>
				<div class="form-group">
					<label for="userid">아이디</label>
					<input type="text" class="form-control" 
						id="userid" name="userid" required="required"/>
				</div>
				<div class="form-group">
					<label for="title">글제목</label>
					<input type="text" class="form-control" 
						id="title" name="title" required="required"/>
				</div>
				<div class="form-group">
					<label for="content">후기 내용</label>
					<textarea class="form-control" 
						id="content" name="content"></textarea>
				</div>
				<div class="form-group"> 
					<label for="title">작성일</label>
					<input type="text" class="form-control"
					id="title" required="required"
					value="${reviewVo.regdate}" readonly="readonly"/>
				</div>
				
				<div id="uploadedList">
				<c:forEach items="${reviewVo.files}" var="filename">
					<div class="divUploaded">
						<img height="100" class="img-rounded"
						<c:choose>
							<c:when test="">
								src="/upload/displayImage?fileName=${filename}"
							</c:when>
							<c:otherwise>
								src="/img/default.png"
							</c:otherwise>
						</c:choose>
						><br>
						<span><a href="#"></a></span>
					</div>
				</c:forEach>
				</div>
				<div>
					<button type="submit" class="btn btn-primary" id="btnSubmit">
					후기 수정 완료
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>