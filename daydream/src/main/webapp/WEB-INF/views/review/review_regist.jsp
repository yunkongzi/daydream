<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<script>
// 별점 처리 요청 
$(function () {
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
});

// 파일 업로드 요청 처리
$(function() {
	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
		console.log("엔터, 오버");
	});
	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		console.log(e);
		var file = e.originalEvent.dataTransfer.files[0];
		console.log(file);
		var filename = file.name;
		console.log(filename);
		var formData = new FormData(); // <form action="/upload/uploadAjax", method="post", enctype="mutipart/form-data">
		formData.append("file", file); // <input type="file">
		var url = "/review/uploadAjax"; // 
		
		$.ajax({
			"processData"	: false,
			"contentType"	: false,
			"method"		: "post",
			"url"			: url,
			"data"			: formData,
			"success"		: function(rData) {
				console.log(rData);
				
				
				if(rData == "fail") {
					alert("잘못된 형식의 파일입니다.");
					return;
				}
				
			var div = $("#uploadedList").prev().clone();
			div.attr("data-filename", rData);
			
			console.log(div);
			var underIndex = rData.indexOf("_");
			var fileName = rData.substring(underIndex + 1);
			div.find("span").text(fileName);
			var result = isImage(fileName);
			if(result == true) {
				var img = div.find("img");
				img.attr("src", "/review/displayImage?fileName=" + rData);
			}
			
			var a = div.find("a");
			a.attr("data-filename", rData);
			
			$("#uploadedList").append(div);
			div.show(1000);
			}
		});
	}); //fileDrop
	
			
	$("#frmRegist").submit(function(){
		var divs = $("#uploadedList > .divUploaded");
		console.log("divs:", divs);
		divs.each(function(index){
			var filename = $(this).attr("data-filename");
			var inputHtml = "<input type='hidden' name='files["+ index +"]' value='" + filename + "'>";
			$("#frmRegist").prepend(inputHtml);
		});
// 		return false;
	});
	
	// 파일 삭제 
	$("#uploadedList").on("click", ".a_times", function(e){
		e.preventDefault();
		var that = $(this);
		var filename = that.attr("data-filename");
		console.log(filename);
		var url = "/upload/deleteFile?fileName=" + filename;
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "success") {
				that.parent().hide(1000, function() {
					that.parent().remove();
				});
			} else {
				alert("파일 삭제에 실패했습니다.");
			}
		});
	});
});

// isImage
function isImage(fileName){
	var dotIndex = fileName.lastIndexOf(".");
	var extName = fileName.substring(dotIndex + 1);
	var upper = extName.toUpperCase(); // 대문자로 JPG ,PNG, GIF
	
	if(upper == "JPG" || upper == "PNG" || upper == "GIF") {
		return true;
	} else {
		return false;
	}
}
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

.fileDrop{
	width:80%;
	height:100px;
	background-color: gray;
	margin: 20px auto;
	border:1px dotted blue;
}
.divUploaded {
	width: 150px;
	float: left;
}

</style>

<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>후기 양식</h2>
				<p><a class="btn btn-primary btn-large" href="/">후기 목록</a></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/review/regist_run" id="frmRegist"
				method="post">
				<input type="hidden" name="star_count" id="star_count">
				<input type="hidden" name="class_no" value="${class_no}">
				<div class="form-group">
					<label for="class_name">클래스이름</label>
					<input type="text" class="form-control" 
						id="class_name" value="${class_name}" readonly />
				</div>
				
				<div class="form-group">
					<label for="title">글제목</label>
					<input type="text" class="form-control" 
						id="title" name="title" required="required"/>
				</div>
				<div class="form-group">
					<label for="content">후기 내용</label>
					<textarea class="form-control" 
						id="content" name="content"></textarea>
				</div>
			
				<!-- 첨부파일 업로드  영역-->
				<div>
					<label>첨부할 파일을 드래그 &amp; 드롭하세요</label>
					<div class="fileDrop"></div><br>
				</div>
				
				<!-- 업로드할 항목의 템플릿 -->
				<div style="display:none"
					class="divUploaded">
					<img src="/images/default.png" height="100"><br>
					<span>default.png</span>
					<a href="#" class="a_times">&times;</a>
				</div>
				<!-- 업로드한 파일들 -->
				<div id="uploadedList">
				
				</div>
				<hr  style="clear:both;">
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
				<div>
					<button type="submit" class="btn btn-primary" id="btnSubmit">
					작성 완료
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>