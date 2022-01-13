<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
* {
	margin: 0 auto;
	text-align: center;
}
section.a {
	width: 700px;
	display: block;
	margin: 0 auto;
	text-align: center;
}
input, textarea {
	text-align:left;
}

</style>
										
	<section class="a">
	<div style="margin:0 auto; text-align:center;">
		<h3>데이드림 강사 정보 수정</h3>
		<p style="margin:0 auto; text-align:center;">강사번호는 변경이 불가능합니다.</p>
		
	</div>
	</section>
	<hr/>
		
	<section class="a">
	<div>
		
		<form action="/teacher/modify_run" 
				method="post">
		<div style="margin:0 auto;">
			
				<div>
					<label for="tno">강사번호</label>
					<input type="text"  
						id="tno" name="tno" value="${teacherVo.tno}" readonly/>
				</div>
				<div class="form-group">
					<label for="class_name">클래스명</label>
					<input type="text" class="form-control" 
						id="class_name" name="class_name" value="${teacherVo.class_name}" />
				</div>
				<div class="form-group">
					<label for="price">가격</label>
					<input type="text" class="form-control" 
						id="price" name="price" value="${teacherVo.price}"/>
				</div>
				<div class="form-group">
					<label for="personnel">인원</label>
					<input type="text" class="form-control" 
						id="personnel" name="personnel" value="${teacherVo.personnel}"/>
				</div>
				
				<div class="form-group">
					<label for="target">참가대상</label>
					<input type="text" class="form-control" 
						id="target" name="target" value="${teacherVo.target}"/>
				</div>
				<c:if test="${not empty teacherVo.certificate}">
				<img src="/teacher/displayImage?fileName=${teacherVo.certificate}"/>
				</c:if>				
				<div class="form-group">
					<label for="certificate">자격증 파일 첨부</label>
					<input type="file" class="form-control" 
						id="certificate" name="certificate" style="display:none"/>
					<button type="button" id="btnFile">파일 첨부</button>
				</div>
				
				<div class="form-group">
					<label for="introduce">자기소개</label>
					<textarea class="form-control" id="introduce" name="introduce">${teacherVo.introduce}</textarea> 
				</div>				
				<br><br>				
				<button type="submit" class="btn btn-primary">
					수정 완료
				</button>
			
		</div>
		</form>
		
	</div>
	</section>
</body>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>