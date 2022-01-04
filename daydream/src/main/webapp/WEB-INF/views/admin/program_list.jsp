<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 리스트</title>
</head>
<body>
	<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>학생 목록</h2>
					<p>
						<a class="btn btn-primary btn-large btnRegist" href="/admin/regist_form">학생
							등록</a>
					</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>클래스명</th>
							<th>가격</th>
							<th>프로그램 대상</th>
							<th>가능 인원</th>
							<th>프로그램 소개</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="studentVo">
							<tr>
								<td>${programVo.class_name}</td>
								<td>${programVo.price}</td>
								<td>${programVo.target}</td>
								<td>${programVo.personnel}</td>
								<td>${programVo.class_intro}</td>
  								<td><button type="button"
										class="btn btn-outline-info btnModify"
										href="/admin/program_modify" data-class_name="${programVo.class_name}">수정</button></td>
								<td><button type="button"
										class="btn btn-outline-danger btnDelete"
										data-class_name="${programVo.class_name}">삭제</button></td>
								<td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>