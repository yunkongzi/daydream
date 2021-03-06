
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>프로그램</title>
<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
	td {
		text-align:center;
	}
	
	span {
		
		font-size:15pt; 
		color:black;
		font-family:맑은 고딕;
		/* font-weight: bold; */
		
	}
</style>
<script>
$(function() {
	$(".btnReserv").click(function(e) {
		e.preventDefault();
		var class_no = $(this).attr("data-class_no");
		var href = $(this).attr("href");
		console.log("class_no: ", class_no);
		location.href = href + "?class_no=" + class_no;
	});
	
	$(".proDetail").click(function(e){
		e.preventDefault();
		var class_no = $(this).attr("data-class_no");
		var href = $(this).attr("href");
		location.href = href + "?class_no=" + class_no;
	});
}); 
</script>
<body>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table">
				<tbody>
					 
					<c:forEach items="${programList}" var="programVo" varStatus="status">
						<c:if test="${status.index % 3 == 0}">
							<tr>
						</c:if>
						<td>
							
							<a class="proDetail" data-class_no="${programVo.class_no}" href="/program_detail"><img src="/admin/displayImage?fileName=${programVo.file_image}" height="270" width="350"/></a><br>
							<br>
							<span>< ${programVo.class_name} ></span><br>
							<br>
							- ${programVo.class_intro} -<br>
							금액 : ${programVo.price}원<br>
							<%-- <a class="btn btn-sm btn-outline-warning btnReserv" href="/reservation/reservation_regist"
								data-class_no="${programVo.class_no}">예약</a> --%>
							<br>
							</td>
						<c:if test="${status.index % 3  == 2}">
							</tr>
						</c:if>
					</c:forEach>	
				
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

