<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

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
		$("#imgCer").attr("src", "/teacher/displayImage?fileName=" + fileName);
		$("#modal-511270").trigger("click");
	});
	$(".btnModify").click(function() {
		var tno = $(this).attr("data-tno");
		location.href = "/teacher/modifyTeacherForm?tno=" + tno;
	});
	
	$(".btnDelete").click(function() {
		var tno = $(this).attr("data-tno");
	});
});
</script>

<div class="row">
	<div class="col-md-12">
		<a id="modal-511270" href="#modal-container-511270" role="button"
			class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>

		<div class="modal fade" id="modal-container-511270" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">자격증 사진</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body"><img id="imgCer" src="" width="450"></div>
					<div class="modal-footer">

						
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>

		</div>

	</div>
</div>

<div>
	<div>
		<div class="jumbotron">
			<h2>강사 리스트</h2>
		</div>
		<div style="margin: 0 auto">
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
							<td><a href="#" class="a_certificate">${teacherVo.certificate}</a></td>
							<td>${teacherVo.introduce}</td>
							<!-- 								<div style="clear:both"></div> -->
							<td><button type="button" class="btn btn-warning btnModify"
									data-tno="${teacherVo.tno}">수정</button></td>
							<td><button type="button" class="btn btn-info btnDelete"
								 data-tno="${teacherVo.tno}">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<section id="footer" style="padding-top:0px; padding-bottom:0px;">
              
               <div id="copyright" class="container" style="margin-top:0px;">
                  <ul class="links">
                     <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                  </ul>
               </div>
            </section>

      </div>

   </body>
</html>

