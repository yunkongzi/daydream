<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<head>
<meta charset="UTF-8">
<title>강사리스트</title>

</head>
<body>
<section id="features">
		<div class="container" style="margin:0 auto;">
			<header>	
<div class="container-fluid" style="margin:0 auto;">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>강사 리스트</h2>						
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>강사번호</th>
								<th>강의명</th>
								<th>금액</th>
								<th>인원</th>
								<th>참가대상</th>
								<th>자격증파일</th>								
								<th>자기소개</th>					
								<th>수정</th>					
								<th>삭제</th>					
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="teacherVo">
							<tr>
								<td>${teacherVo.tno}</td>
								<td>${teacherVo.class_name}</td>
								<td>${teacherVo.price}</td>
								<td>${teacherVo.personnel}</td>
								<td>${teacherVo.target}</td>
								<td>${teacherVo.certificate}</td>
								<td>${teacherVo.introduce}</td>
								<div style="clear:both">
								<td><button type="button" class="btn btn-warning" id="btnModify">
											수정</button></td>
								<td><button type="button" class="btn btn-info"
											id="btnDelete" data-tno="${teacherVo.tno}">
											삭제</button></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</header>
</div>
</section>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>