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
							${programVo.file_image}<br>
							${programVo.class_name}<br>
							${programVo.price}<br>
							
							
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