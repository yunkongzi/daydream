<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

 <meta charset="UTF-8">
    <title></title>
    
<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													

</script>

<style>
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}
</style>



		<div class="jumbotron">
		<c:choose>
		<c:when test="${param.status == 'Y'}">
			<h2>채용강사 리스트</h2>	
		</c:when>
		<c:otherwise>
			<h2>신청중인 강사 리스트</h2>	
		</c:otherwise>
		</c:choose>		
		<a class="btn btn-sm statusList" href="/teacher/teacher_list" style="background: #bfa071;">
			강사목록 보기
		</a>							
		</div>
		<div style="margin: 0 auto">
			<table class="table">
				<thead>
					<tr>
					    <th>아이디</th>
					    <th>이름</th>
						<th>강사번호</th>
						<th>강의명</th>
						<th>금액</th>
						<th>인원</th>
						<th>참가대상</th>												
						<th>연락처</th>																												
					</tr>
				</thead>
				<tbody>				
					<c:forEach items="${statusList}" var="teacherMemberVo">									
						<tr>
						    <td>${teacherMemberVo.user_id}</td>
						    <td>${teacherMemberVo.user_name}</td>
							<td>${teacherMemberVo.tno}</td>
							<td>${teacherMemberVo.class_name}</td>
							<td>${teacherMemberVo.price}</td>
							<td>${teacherMemberVo.personnel}</td>
							<td>${teacherMemberVo.target}</td>
							<td>${teacherMemberVo.user_phone}</td>														
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> 
		<div class="pagination" align="center">
		  <a href="#">&laquo;</a>
		  <a href="#">1</a>
		  <a href="#" class="active">2</a>
		  <a href="#">3</a>
		  <a href="#">4</a>
		  <a href="#">5</a> 
		  <a href="#">&raquo;</a>
		</div>       
</body>
</html>

