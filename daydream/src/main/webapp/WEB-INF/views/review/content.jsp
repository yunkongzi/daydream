<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="myfn" uri="/WEB-INF/tlds/myfunc.tld" %>
<head>
<title>후기수정게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<script>
//$(document).ready(function())
$(function() {
	var message = "${message}";
	if (message == "modify_success") {
		alert("글 수정이 완료 되었습니다.");
	}
	
	// 삭제 버튼
	$("#btnDelete").click(function() {
		var bno = $(this).attr("data-bno");
		console.log("bno:", bno);
		var input_bno = '<input type="hidden" name="bno" value="' + bno + '">';
		$("#frmPaging").append(input_bno);
		$("#frmPaging > input[name=bno]").val(bno);
		$("#frmPaging").attr("action", "/review/deleteReview");
		$("#frmPaging").submit();
	});
	// 수정 버튼
	$("#btnModify").click(function() {
// 		console.log($(".modify"));
// 		class가 modify(글제목, 글내용)에 대해서 읽기 전용 해제
		$(".modify").prop("readonly", false);
		$("#btnModifyOk").fadeIn(500); // show, slideDown
		$(this).fadeOut(500); // hide, slideUp
	});


	//글목록 버튼
// 	$("#btnList").click(function(e) {
// 		e.preventDefault();
// 		$("#frmPaging").submit();
		
// 	});
	var starEls = document.querySelectorAll('#star span.star');
    var rate = 0;

    loop(starEls, function (el, index) {
        el.addEventListener('click', function () {
            rating(index + 1);
        });
    });
    function loop(list, func) {
        Array.prototype.forEach.call(list, func);
    }
    function rating(score) {
        loop(starEls, function (el, index) {
            if (index < score) {
                el.classList.add('on');
            } else {
                el.classList.remove('on');
            }
        });
        rate = score;
        var input_star_count = document.getElementById("star_count");
        input_star_count.value = rate;
    }
    
    rating(parseInt("${reviewVo.star_count}"));
});
</script>
<style>
// 별점 스타일
#star {
  display: flex;
}
.star {
  font-size: 2rem;
  margin: 10px 0;
  cursor: pointer;
}
.star:not(.on) {
  color: #ccc;
}
.star.on {
  color: orange;
}
</style>

<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>리뷰 상세보기</h2>
				<p>
					<a class="btn btn-primary btn-large" id="btnList"
					href="/review/reviewList_all">후기 목록</a>
				</p>
			</div>
		</div>
	</div>
	<form role="form" action="/review/modify_run" method="post">
	<div class="row">
		<div class="col-md-12">
			
				<input type="hidden" name="bno" value="${reviewVo.bno}">
				<input type="hidden" name="page" value="${param.page}">
				<input type="hidden" name="perPage" value="${param.perPage}">
				<input type="hidden" name="searchType" value="${param.searchType}">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<input type="hidden" name="star_count" id="star_count" value="${reviewVo.star_count}">
			
				<div class="form-group">
					<label for="user_id">아이디</label>
					<input type="text" class="form-control" 
						id="user_id" name="user_id" required="required"
						value="${reviewVo.user_id}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="title">글제목</label>
					<input type="text" class="form-control modify" 
						id="title" name="title" required="required"
						value="${reviewVo.title}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="content">후기 내용</label>
					<textarea class="form-control modify" 
						id="content" name="content"
						readonly="readonly">${reviewVo.content}</textarea>
				</div>
				<div class="form-group"> 
					<label for="regdate">작성일</label>
					<input type="text" class="form-control"
					id="regdate" required="required"
					value="${reviewVo.regdate}" readonly="readonly"/>
				</div>
				
				<div id="uploadedList">
				<c:forEach items="${reviewVo.files}" var="filename">
					<div class="divUploaded">
						<img height="100" class="img-rounded"
						<c:choose>
							<c:when test="${myfn:isImage(filename)}">
								src="/review/displayImage?fileName=${filename}"
							</c:when>
							<c:otherwise>
								src="/img/default.png"
							</c:otherwise>
						</c:choose>
						><br>
						<span><a href="#"></a></span>
					</div>
				</c:forEach>
				</div>
				
				<!-- 별점 첨부 -->
				<div class="from-group">
					<label for="star_rating">별점</label>
					<div class="star-container" id="star">
 						<span class="star">★</span>
  						<span class="star">★</span>
  						<span class="star">★</span>
  						<span class="star">★</span>
  						<span class="star">★</span>
					</div>
				</div>	
				</div>
				
				<div style="clear:both">
					<button type="button" class="btn btn-warning"
						id="btnModify">수정</button>
					<button type="submit" class="btn btn-success"
						id="btnModifyOk" style="display:none">수정완료</button>
					<button type="button" class="btn btn-danger"
						id="btnDelete" data-bno="${reviewVo.bno}">삭제</button>
				</div>
			
		</div>
	</form>
</div>
</body>
</html>