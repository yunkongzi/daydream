<%@ page import ="java.text.*,java.util.*" contentType="text/html;charset=euc-kr"
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
		$("#calTable").append(tr);
		
	}
});
	
	
</script>
<style type="text/css">

a:link { font-family: "";font-size:14pt; text-decoration:none; color:darkblue}
a:visited { font-family: "";font-size:14pt;text-decoration:none; color:darkblue}
a:hover {font-family: "";font-size:14pt;text-decoration::none; color:red}
font {  font-family: ""; font-size:14pt; text-decoration: none}
.inputline {  border:1 solid; color: #002669}
.input {  border:1 solid}
.head {  font-family: "arial"; font-size: 10pt; font-weight: bold; color: #000000}
.text_jp {  font-family: ""; font-size:9pt; line-height: 12pt}
.text_sjp {  font-family: ""; font-size:8pt; line-height: 12pt}
.text_mjp {  font-family: ""; font-size:11pt; line-height: 12pt}
.text_bjp {  font-family: ""; font-size:12pt; line-height: 12pt}
.body1{ font-size:38px;}
.body2{ font-size:26px;}
.body3{ font-size:14px;}
.body4{ font-size:8px;}
.body5{ font-size:10px;}
.body6{ font-size:9px;}
.lt { font-size:12pt; text-decoration: line-through }

input.locked {  background-color:#DDDDDD;  }

</style>

<%  
int year;
int month;
   Calendar today=Calendar.getInstance();
   Calendar cal = new GregorianCalendar();
   year = (request.getParameter("year")==null) ?  today.get(Calendar.YEAR) :      Integer.parseInt(request.getParameter("year").trim()) ;

 month = (request.getParameter("month")==null) ?   today.get(Calendar.MONTH)+1:      Integer.parseInt(request.getParameter("month").trim()) ;

if (month<=0){

 month = 12;
 year  =year- 1;
}else if (month>=13){

 month = 1;
 year =year+ 1;
}
   cal.set(Calendar.YEAR,year);
   cal.set(Calendar.MONTH,(month-1));
   cal.set(Calendar.DATE,1);

%>
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
		<div class="left-box">
			<form role="form" action="/member/regist_run" 
				method="post">
				<div class="form-group">
		<label for="res_date">예약날짜</label>
					
				
<table style="text-align:center;">


<tr >
 <td align="center" bgcolor='#CCE3C6' height='18' valign='bottom' colspan="7">
   <a href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)-1)%>'><font color='484848' size='2'>◀ </font></a><font color='484848' size='2'><%=cal.get(Calendar.YEAR)%> / <%=(cal.get(Calendar.MONTH)+1)%> </font><a href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)+1)%>'><font color='484848' size='2'>▶ </font></a>
 </td></tr>
<tr align="right" bgcolor="#6ea1aa">
<td>  일</td><td>  월</td><td>  화</td><td>  수</td><td>  목</td><td>  금</td><td>  토</td>
</tr>

<%  
cal.set(year, month-1, 1);
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
%>
<tr align="right" bgcolor="#6ea1aa">
<%
for(int i=1;i<dayOfWeek;i++){
%><td align="right" bgcolor="#CCE3C6"></td>
<% }

for(int i=1;
        i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH);i++){
    %>
<td>
  <a href='day.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1))%>&day=<%=i %>'><%=i %></a>
  </td><%
            if((dayOfWeek-1+i)%7==0){
                %></tr><tr align="right" bgcolor="#6ea1aa">
   <% }
  }%>
 
 </tr>
</table><br>
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
