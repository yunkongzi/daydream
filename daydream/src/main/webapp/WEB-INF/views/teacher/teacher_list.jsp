<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/WEB-INF/views/include/header.jsp"%> --%>


<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													

<script>
$(function() {
	$(".a_certificate").click(function(e) {
		e.preventDefault();
		var fileName = $(this).text();
		var tno = $(this).attr("data-tno");
		$("#imgCer").attr("src", "/teacher/displayImage?fileName=" + fileName);
		$("#modalModify").attr("data-tno", tno);
		$("#modalDelete").attr("data-tno", tno);
		$("#modal-511270").trigger("click");
	});
	$(".btnModify").click(function() {
		var tno = $(this).attr("data-tno");
		location.href = "/teacher/modifyTeacherForm?tno=" + tno;
	});
	
	$(".btnDelete").click(function() {
		var tno = $(this).attr("data-tno");
		location.href = "/teacher/deleteTeacher?tno=" + tno;
	});
	
	$(".btnStatus").click(function() {
		var that = $(this);
		var tno = that.attr("data-tno");
		var url = "/teacher/updateStatus/" + tno;
		$.get(url, function(rData) {
			if (rData == "success") {
				alert("상태 수락");
				that.hide(1000);
				location.href = "/teacher/statusList?status=Y";
			}
		});
	});	
});
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


<div class="row">
	<div class="col-md-12">
		<a id="modal-511270" href="#modal-container-511270" role="button"
			class="btn" data-toggle="modal" style="display:none;">자격증보기</a>

		<div class="modal fade" id="modal-container-511270" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">자격증 보기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body"><img id="imgCer" src="" width="450"></div>
					<div class="modal-footer">
					
						<button type="button" class="btn btn-warning btnModify"
							id="modalModify">수정</button>
						<button type="button" class="btn btn-info btnDelete"
							id="modalDelete">삭제</button>				
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div>
		<div class="jumbotron">
			<h2>강사 리스트</h2>
			<a href="/teacher/statusList?status=Y" class="btn btn-success statusList" style="background: #bfa071;">채용강사 보기</a>
			<a href="/teacher/statusList?status=N" class="btn btn-link statusList" style="background: #bfa071;">신청중인 강사 보기</a>
			<a href="/admin/admin_main" class="btn btn-success admin_main" style="background: #bfa071;">관리자 메인</a>
		</div>
		<div style="margin: 0 auto">
			<table class="table">
				<thead>
					<tr>						
						<th>강의코드</th>
						<th>아이디</th>
						<th>강좌명</th>
						<th>금액</th>
						<th>인원</th>
						<th>참가대상</th>
						<th>자격증파일</th>
						<th>자기소개</th>
						<th>수정</th>
						<th>삭제</th>
						<th>수락</th>
					</tr>
				</thead>
				<tbody>
				<%-- ${list} --%>
					<c:forEach items="${list}" var="teacherMemberVo">
						<tr>
							<td>${teacherMemberVo.tno}</td>
							<td>${teacherMemberVo.user_id}</td>
							<td>${teacherMemberVo.class_name}</td>
							<td>${teacherMemberVo.price}</td>
							<td>${teacherMemberVo.personnel}</td>
							<td>${teacherMemberVo.target}</td>
							<td>
							<c:if test="${not empty teacherMemberVo.certificate}">
								<a href="#" class="a_certificate" data-tno="${teacherMemberVo.tno}">${teacherMemberVo.certificate}</a>
							</c:if>
							
							</td>
							<td>${teacherMemberVo.introduce}</td>
							<!-- 		<div style="clear:both"></div> -->
							<td><button type="button" class="btn btn-sm btnModify"
									data-tno="${teacherMemberVo.tno}" style="background: #bfa071;">수정</button></td>
							<td><button type="button" class="btn btn-sm btnDelete"
								 data-tno="${teacherMemberVo.tno}" style="background: #bfa071;">삭제</button></td>
							<td>
							<c:if test="${teacherMemberVo.status == 'N'}">
							<button type="button" class="btn btn-sm btnStatus"
								 data-tno="${teacherMemberVo.tno}" style="background: #bfa071;">수락</button>
							</c:if>
							</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="pagination" style="margin: 0 auto">
	  <a href="#">&laquo;</a>
	  <a href="#">1</a>
	  <a href="#" class="active">2</a>
	  <a href="#">3</a>
	  <a href="#">4</a>
	  <a href="#">5</a> 
	  <a href="#">&raquo;</a>
</div>    
</div>     
</body>
</html>

