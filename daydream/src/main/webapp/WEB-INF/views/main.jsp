<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">													
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>		

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- <script type="text/javascript" 
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script> -->

<style>
 .mySlides {display:none;
 			margin : 0 auto;
 			} 






</style>

<!-- <h2 class="w3-center">DAYDREAM</h2> -->

<!-- 		<div class="w3-content w3-section" style="max-width:400px"> -->
<!-- 			  <img class="mySlides" src="/images/drink.JPG" style="width:100%" height="500" align="center"> -->
<!-- 			  <img class="mySlides" src="/images/drawing.JPG" style="width:100%" height="500" align="center"> -->
<!-- 			  <img class="mySlides" src="/images/flower.JPG" style="width:100%" height="500" align="center"> -->
<!--  		</div> -->

<div class="w3-content w3-section" style="max-width:400px">
						  <img class="mySlides" src="/images/drink.JPG" style="width:100%" height="400" align="center">
						  <img class="mySlides" src="/images/drawing.JPG" style="width:100%" height="400" align="center">
						  <img class="mySlides" src="/images/flower.JPG" style="width:100%" height="400" align="center">
					 </div>

<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2500); 
}


$(function() {
	var message = "${message}";
	if (message == "logout") {
		alert("로그아웃 되었습니다.");
	} else if (message == "login") {
		alert("정보변경이 되었습니다.\n다시 로그인해주세요.");
	}  else if (message == "delete") {
		alert("탈퇴");
	} 
});

//페이드인 페이드아웃 
/* $('#slide3>ul>li').hide(); 
$('#slide3>ul>li:first-child').show(); 
setInterval(function(){ 
	$('#slide3>ul>li:first-child').fadeOut() 
					.next().fadeIn().end(1000)
					.appendTo('#slide3>ul');
	},3000);
 */

</script>
<title>DAYDREAM MAIN PAGE</title>
</head>
<body>

<!-- Logo -->
<!-- 			<section id="header"> -->
<!--                <div class="container" style="padding-top:50px; padding-bottom:50px;"> -->
<!--                      <h1 id="logo"><a href="/main">DAYDREAM</a></h1> -->
<!--                      <p>One Day, One Dream</p> -->
<!--                </div> -->
<!--             </section> -->

	<section id="features">
		<div class="container">
			<header> 
				

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-8">
							<!-- <div id="index_03"> 
							<div id="header3"></div> 
								<div id="slide3"> <ul> 
									<li><img src="/images/drink.JPG" alt="drink"></li> 
									<li><img src="/images/drawing.JPG" alt="drawing"></li> 
									<li><img src="/images/flower.JPG" alt="flower"></li> 
									</ul> 
							</div> 
						</div> -->
						</div>
						<div class="col-md-2">
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-8">
							<table class="table table-hover">
								<tbody>
									<tr>
										<td>
										<img src="/images/drink.JPG" alt="drink" width="400" height="350">
										</td>
										<td>
										<img src="/images/flower.JPG" alt="flower" width="400" height="350">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-md-2">
						</div>
					</div>
				</div>
			</div>
		</div>
				
<<<<<<< HEAD
				
				
				
			</header>
=======
			</header> 
>>>>>>> branch 'master' of https://github.com/yunkongzi/daydream.git
		</div>
	</section>

	



</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>