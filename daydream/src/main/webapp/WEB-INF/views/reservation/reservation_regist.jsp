<%@ page import="java.util.Date" %>
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
<script type="text/javascript">
//var reserve_count = 0;
//오늘 날짜
var today = new Date();

//현재 달력 만들기
function buildCalendar(){
  var row = null;
  var cnt = 0;
  var calendarTable = document.getElementById("calendar");
  var calendarTableTitle = document.getElementById("calendarTitle");
  	 calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
  
  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
  while(calendarTable.rows.length > 2){
  	calendarTable.deleteRow(calendarTable.rows.length -1);
  }

  row = calendarTable.insertRow();
  for(i = 0; i < firstDate.getDay(); i++){
	cell = row.insertCell();
  	cnt++;
  }

  for(i = 1; i <= lastDate.getDate(); i++){
  	cell = row.insertCell();
  	cnt++;

    cell.setAttribute('id', i);
    if (i % 7 == 3 || i % 7 == 4) {
    	cell.setAttribute('class', 'dis');
    	cell.setAttribute('title', '월,화요일은 휴무입니다.');
    }
  	cell.innerHTML = i;
  	cell.align = "center";

    cell.onclick = function(){
    	var isdis = this.getAttribute('class');
    	console.log(isdis);
    	if (isdis == 'dis') {
    		return;
    	}
    	clickedYear = today.getFullYear();
    	clickedMonth = (today.getMonth() +1);
    	clickedDate = this.getAttribute('id');

    	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
    	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
    	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
		console.log(clickedYMD);
    	document.getElementById("date").value = clickedYMD;
//     	$("#date").val(clickedYMD);
//     	self.close();
    }

    if (cnt % 7 == 1) {
    	cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
    } else if (cnt % 7 == 2 || cnt % 7 == 3) {
    	cell.innerHTML = "<font color=#cccccc>" + i + "</font>";
    } 
    
    if (cnt % 7 == 0){
    	cell.innerHTML = "<font color=skyblue>" + i + "</font>";
    	row = calendar.insertRow();
    }
  }

  if(cnt % 7 != 0){
  	for(i = 0; i < 7 - (cnt % 7); i++){
  		cell = row.insertCell();
  	}
  }
}
//이전달
// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
function prevCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	buildCalendar();
}
//다음달
function nextCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	buildCalendar();
}

function disableAllTheseDays(date){
	var day = date.getDay();
	return[(day !=1 && day !=2)]; 
} 


</script>

 <style type="text/css">
/* 기본스타일  */	
	table{ background-color: #F2F2F2;}
	
	tr{height:60px;}
	td{width:100px; text-align:center; font-size:15pt; font-family:D2coding; cursor: pointer}
	.dis {cursor:help;}

</style>
</head>



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
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<td  colspan="5"><label onclick="nextCalendar()"> 다음 달 ▶ </label></td>
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
					
			</table>

<hr>
		

		</div>	
		<div>
			선택한 날짜 : <input type="text" id="date" name="date" readonly>
		</div><br>
				<div class="form-group">
					<label for="program_time">예약 시간 : </label>
					<select>
						<option>10-12</option>
						<option>14-16</option>
						<option>16-18</option>
						<option>19-21</option>
					</select>
				</div><br>
				<div class="form-group">
					<label for="count">인원 : </label>
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
<script type="text/javascript">buildCalendar();</script>
 </body>
 </html>
