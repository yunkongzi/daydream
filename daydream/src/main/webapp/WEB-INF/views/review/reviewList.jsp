<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${reviewList}
<table border="1">
<c:forEach items="${reviewList}" var="attendClassVo">
	<tr>
		<td>${attendClassVo.user_id}</td>
		<td>${attendClassVo.res_date}</td>
		<td>${attendClassVo.class_name}</td>
		<td>${attendClassVo.program_time}</td>
		<td>${attendClassVo.status}</td>
		<td>${attendClassVo.class_no}</td>
		<td><a href="/review/review_regist?class_no=${attendClassVo.class_no}">후기 작성</a></td>
	</tr>

</c:forEach>
</table>
</body>
</html>