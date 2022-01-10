<%@ page language="java"  contentType="text/html; charset=UTF-8"
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
</head>
<script>
$(function() {
	
	
	var d = new Date("2022-01-07");
	var w = d.getDay(d);
	console.log(w);
	var day = 0;
	while (day <= 31) {
		var tr = "<tr>";
		var weekNum = 0; // 0 ~ 6(일~토)
		var weekV = 0;
		if (day == 0) {
			while (weekNum < w) {
				console.log("없음");
				tr += "<td class='none'></td>";
				weekNum++;
			}
		}
		
		while (weekNum < 7 ) {
			
			day++;
			if (day <= 31) {
				tr += "<td>" + day + "</td>";
			} else {
				tr += "<td class='none'></td>";
			}
			
			weekNum++;
			
		}
		tr += "</tr>";
		$("#calendar").append(tr);
		
	}
});
	
	
</script>

 <style type="text/css">
/* 기본스타일  */	
	table{ background-color: #F2F2F2;}
	
	tr{height: 60px;}
	td{width: 100px; text-align: right; font-size: 15pt; font-family: D2coding;}
/* 타이틀 스타일 */
	th#title {font-size: 20pt; font-weight: bold; color: #FFBF00; font-family: D2coding; }

/* 요일 스타일 */
	td.sunday{ text-align: center; font-weight: bold; color: red; font-family: D2coding; }
	td.saturday{ text-align: center; font-weight: bold; color: blue; font-family: D2coding; }
	td.etcday{ text-align: center; font-weight: bold; color: black; font-family: D2coding; }

/* 날짜 스타일 */
	td.sun{ text-align: right; font-size: 15pt; color: red; font-family: D2coding; vertical-align: top;}
	td.sat{ text-align: right; font-size: 15pt; color: blue; font-family: D2coding; vertical-align: top;}
	td.etc{ text-align: right; font-size: 15pt; color: black; font-family: D2coding; vertical-align: top;}
	
	
</style>


 <body>
 
 <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>예약 등록 양식</h2>
				
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/member/regist_run" 
				method="post">
				<div class="form-group">
		<label for="res_date">예약날짜</label>
<hr>		

			<table id="calendar">
					<tr>
						<td><label onclick="prevCalendar()"> ◀ 이전 달 </label></td>
						<td colspan="3" align="center" id="calendarTitle">yyyy년 m월</td>
						<td  colspan="3"><label onclick="nextCalendar()"> 다음 달 ▶ </label></td>
					</tr>
					<tr>
						<td align="center"><font color ="#F79DC2">일</font></td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color ="skyblue">토</font></td>
					</tr>
					<!-- <script type="text/javascript">buildCalendar();</script> -->
			</table>

<hr>


		</div>	
				<div class="form-group">
					<label for="program_time">예약 시간</label>
					<select>
						<option>10-12</option>
						<option>14-16</option>
						<option>16-18</option>
						<option>19-21</option>
					</select>
				</div><br>
				<div class="form-group">
					<label for="count">인원</label>
					<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>
				
				<button type="submit" class="btn btn-primary">
					예약 등록 완료
				</button>
			</form>
		</div>
	</div>
</div>
 </body>
 </html>
