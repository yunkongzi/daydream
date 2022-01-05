<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 등록</title>

<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
<script>
	$('.schedule').load('/_subpage/kor/content/calendar.php');
	$(document).on('click','.schedule .top .dateArrow',function(e){
		e.preventDefault();
		$('.schedule').load($(this).attr('href'));

		$('#wm_rev_date').val('');
		$('#wm_rev_time').val('');
		$('#wm_division').val('');

	});

	$(document).on('click','.schedule .scBody .reserv',function(e){
		e.preventDefault();
		var cur_week = $(this).data('weeks');
		var cur_day = $(this).data('days');

		var cur_product = $('#wm_product').val();
		//alert(cur_week+'/'+cur_day);


		$('#wm_rev_date').val('');
		$('#wm_rev_time').val('');
		$('#rev_time_str').text('');
		$('#wm_division').val('');

		$('.schedule .innerBox ').html('').hide();
		/*
		if(cur_product==''){
			alert('상품 먼저 선택해주세요.');
			return false;
		}
		*/
                $('.schedule .week_' + cur_week).load("/_subpage/kor/content/calendar_inner.php?wm_week=" + cur_week + '&wm_rev_date=' + cur_day + '&wm_product=' + cur_product).show();
		

		//console.log($(this).data('weeks'));
	});
</script>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>예약 등록 양식</h2>
				
				<p>
					<a class="btn btn-primary btn-large" href="/reservation/reservation_list">예약 목록</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="reservation/regist_run" 
				method="post">
				<div class="form-group">
					<label for="class_name">클래스명</label>
					
						<select name="class_name">
							<option selected="selected">쿠킹클래스</option>
							<option>커플 반지 클래스</option>
							<option>향초 만들기 클래스</option>
							<option>우드카빙 클래스</option>
						
						</select>
				</div>
				<div class="form-group">
					<label for="user_id">아이디</label>
					<input type="text" class="form-control" 
						id="user_id" name="user_id" />
				</div>
				
				<div class="form-group">
					<label for="user_name">회원이름</label>
					<input type="text" class="form-control" 
						id="user_name" name="user_name" />
				</div>
			
				<div class="form-group">
					<label for="user_phone">전화번호</label>
					<input type="text" class="form-control" 
						id="user_phone" name="user_phone" />
				</div>
				
				<div class="schedule">예약 시간 
					<select name="res_time">
							<option selected="selected">10-12</option>
							<option>14-16</option>
							<option>17-19</option>
							<option>19-21</option>
						
						</select>

				</div><br>
				<div class="schedule">예약 날짜 
					<input type="date"/>

				</div><br>
				
				
				<button type="submit" class="btn btn-primary">
					예약 등록 완료
				</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>