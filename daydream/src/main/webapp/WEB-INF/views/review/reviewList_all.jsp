<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
<title>후기목록게시판</title>
</head>
<script>

// 페이지 번호
$(".page-link").click(function(e) {
	e.prventDefault(); 
	console.log($(this));
	var page = $(this).attr("href");
	$("#frmPaging > input[name=page]").val(page);
	$("#frmPaging > input[name=searchType]").val("${pagingDto.searchType}");
	$("#frmPaging > input[name=keyword]").val("${pagingDto.keyword}");
	$("#frmPaging").submit();
});

// n줄씩 보기
$("#perPage").change(function(){
	console.log("change");
	var perPage = $(this).val();
	console.log("perPage:", perPage);
	$("#frmPaging > input[name=perPage]").val(perPage);
	$("#frmPaging").submit();
});

// 검색 버튼
$("#btnSearh").click(function(){
	var searchType = $("#searchType").val();
	var keyword = $("#keyword").val();
	$("#frmPaging > input[name=page]").val();
	$("#frmPaging > input[name=searchType]").val(searchType);
	$("#frmPaging > input[name=keyword]").val(keyword);
	$("#frmPaging").submit();
});

//글제목
$(".a_title").click(function(e) {
	e.preventDefault();
	var bno = $(this).attr("href");
	console.log("bno:", bno);
//		var input_bno = '<input type="hidden" name="bno" value="' + bno + '">';
	$("#frmPaging > input[name=bno]").val(bno);
	$("#frmPaging").attr("action", "/review/reviewList_all")
				   .submit();
	
});

</script>
<body>
${reviewList_all}
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					 후기목록 
				</h2>
				
				<p>
					<a class="btn btn-primary btn-large" href="/review/review_regist">후기쓰기</a>
				</p>
			</div>
			<div class="row">
				<div class="col-md-12">
					<select id="perPage">
					<c:forEach var="v" begin="5" end="30" step="5">
						<option value="${v}"
						<c:if test="${v == pagingDto.perPage}">
							selected
						</c:if>
						>${v}줄씩 보기</option>
					</c:forEach>
					</select>
					|
					<select name="searchType" id="searchType">
						<option value="t"
							<c:if test="${pagingDto.searchType == 't'}">
								selected
							</c:if>
						>제목</option>
						<option value="c"
							<c:if test="${pagingDto.searchType == 'c'}">
								selected
							</c:if>
						>내용</option>
						<option value="w"
							<c:if test="${pagingDto.searchType == 'w'}">
								selected
							</c:if>
						>작성자</option>
						<option value="tc"
							<c:if test="${pagingDto.searchType == 'tc'}">
								selected
							</c:if>
						>제목 + 내용</option>
					</select>
					<input type="text" name="keyword" 
						id="keyword" placeholder="검색어 입력"
						value="${pagingDto.keyword}">
					<button type="button" class="btn btn-sm btn-success"
						id="btnSearch">검색</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>글번호</th>
								<th>글제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>별점</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						<!-- 게시글 목록 -->
						<c:forEach items="${reviewlist}" var="reviewVo">
							<tr>
								<td>${reviewVo.bno}</td>
								<td>${reviewVo.title}</td> 
								<td>${reviewVo.userid}</td>
								<td>${reviewVo.regdate}</td>
								<td>${reviewVo.viewcnt}</td>
								<td>${reviewVo.star_count}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 페이징 -->
			<div class="row">
				<div class="col-md-12">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pagingDto.startPage != 1}">
							<li class="page-item">
								<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
							</li>
							</c:if>
							<c:forEach var="v" begin="${pagingDto.startPage}" 
											   end="${pagingDto.endPage}">
							<li 
								<c:choose>
									<c:when test="${pagingDto.page == v}">
										class="page-item active"
									</c:when>
									<c:otherwise>
										class="page-item"
									</c:otherwise>
								</c:choose>
							>
								<a class="page-link" href="${v}">${v}</a>
							</li>
							</c:forEach>
							<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
							</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>