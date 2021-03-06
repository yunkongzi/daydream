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
 /* .mySlides {display:none;
 			margin : 0 auto;
 			}  */
 			* {
  box-sizing: border-box;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.container {
	background-image: .myslides;
	height: 50%;
}

.mySlides {
  display: none;
  
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
/* .caption-container {
  text-align: center;
  background-color: #f2f2f2;
  padding: 2px 16px;
  color: black;
} */

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

/* .product .img-responsive {
    margin: 0 auto;
}
 */
 
.flower {
	float: right;
}

.kombu {
	float: left;
}

</style>


<!-- <div class="w3-content w3-display-container" style="max-width:2000px">
			<img class="mySlides" src="/images/class_flower.png"  alt="flower" style="width:1500" height="600">
			<img class="mySlides" src="/images/class_calli.png" alt="calli" style="width:1500" height="600">
			<img class="mySlides" src="/images/class_car.png" alt="car" style="width:1500" height="600">
			<img class="mySlides" src="/images/class_marka.png" alt="marka" style="width:1500" height="600">
			<img class="mySlides" src="/images/class_cookie.png" alt="cookie" style="width:1500" height="600">
			<img class="mySlides" src="/images/class_lipstick.png" alt="lipstick" style="width:1500" height="600">


</div> -->

<div class="container">

  <!-- Full-width images with number text -->
<div class="mySlides">
    <div class="numbertext">1 / 12</div>
      <img src="/images/class_flower.png" style="width:100%">
  </div>
  
  <div class="mySlides">
    <div class="numbertext">2 / 12</div>
      <img src="/images/car1.png" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 12</div>
      <img src="/images/class_calli.png" style="width:100%">
  </div>
  
  <div class="mySlides">
    <div class="numbertext">4 / 12</div>
      <img src="/images/marker.png" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 12</div>
      <img src="/images/class_car.png" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">6 / 12</div>
      <img src="/images/class_marker.png" style="width:100%">
  </div>
  
  <div class="mySlides">
    <div class="numbertext">7 / 12</div>
      <img src="/images/class_candle.png" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">8 / 12</div>
      <img src="/images/class_cookie.png" style="width:100%">
  </div>
  
  <div class="mySlides">
    <div class="numbertext">9 / 12</div>
      <img src="/images/calli1.png" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">10 / 12</div>
      <img src="/images/class_lipstick.png" style="width:100%">
  </div>
  
  <div class="mySlides">
    <div class="numbertext">11 / 12</div>
      <img src="/images/class_flower1.png" style="width:100%">
  </div>
  
  <div class="mySlides">
    <div class="numbertext">12 / 12</div>
      <img src="/images/class_comboo.png" style="width:100%">
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>

  <!-- Image text -->
  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <!-- Thumbnail images -->
  <div class="row">
    <div class="column">
      <img class="demo cursor" src="/images/class_flower.png" style="width:100%" onclick="currentSlide(1)" >
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/car1.png" style="width:100%" onclick="currentSlide(2)" >
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/class_calli.png" style="width:100%" onclick="currentSlide(3)">
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/marker.png" style="width:100%" onclick="currentSlide(4)">
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/class_car.png" style="width:100%" onclick="currentSlide(5)" >
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/class_marker.png" style="width:100%" onclick="currentSlide(6)" >
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/class_candle.png" style="width:100%" onclick="currentSlide(7)" >
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/class_cookie.png" style="width:100%" onclick="currentSlide(8)">
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/calli1.png" style="width:100%" onclick="currentSlide(9)">
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/class_lipstick.png" style="width:100%" onclick="currentSlide(10)" >
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/class_flower1.png" style="width:100%" onclick="currentSlide(11)" >
    </div>
    <div class="column">
      <img class="demo cursor" src="/images/class_comboo.png" style="width:100%" onclick="currentSlide(12)" >
    
  </div>
</div>
</div>
<script>
 var slideIndex = 1;
 showSlides(slideIndex);

 // Next/previous controls
 function plusSlides(n) {
   showSlides(slideIndex += n);
 }

 // Thumbnail image controls
 function currentSlide(n) {
   showSlides(slideIndex = n);
 }

 function showSlides(n) {
   var i;
   var slides = document.getElementsByClassName("mySlides");
   var dots = document.getElementsByClassName("demo");
   var captionText = document.getElementById("caption");
   if (n > slides.length) {slideIndex = 1}
   if (n < 1) {slideIndex = slides.length}
   for (i = 0; i < slides.length; i++) {
     slides[i].style.display = "none";
   }
   for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" active", "");
   }
   slides[slideIndex-1].style.display = "block";
   dots[slideIndex-1].className += " active";
   captionText.innerHTML = dots[slideIndex-1].alt;
 }
 
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
   setTimeout(carousel, 3100); 
 }

$(function() {
	var message = "${message}";
	if (message == "logout") {
		alert("???????????? ???????????????.");
	} else if (message == "login") {
		alert("??????????????? ???????????????.\n?????? ?????????????????????.");
	}  else if (message == "delete") {
		alert("??????");
	} 
});


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
		<div class="container" style="margin: 0 auto;">
			<header> 
		 		
		<!-- 
			<img src="/images/flower2.gif" style="float: left; margin-right:10px;" alt="flower" width="260" height="200">
			<img src="/images/flower4.gif" style="float: left; margin-right:10px;" alt="flower" width="260" height="200">
			<img src="/images/flower5.gif" style="float: left; margin-right:10px;" alt="flower" width="260" height="200">
			<img src="/images/flower3.gif" style="float: left; margin-right:10px;" alt="flower" width="260" height="200">

			<img src="/images/drawing6.jpeg" style="float: left; margin-right:10px;" alt="flower" width="260" height="200">
			<img src="/images/drawing7.jpg" style="float: left; margin-right:10px;" alt="flower" width="260" height="200">
			<img src="/images/drawing5.jpg" style="float: left; margin-right:10px;" alt="flower" width="260" height="200">
			<img src="/images/drawing4.jpeg" style="float: left; margin-right:10px;" alt="flower" width="260" height="200">
			
			<img src="/images/kombu1.gif" style="float: left; margin-right:10px;" alt="flower" width="350" height="250">
			<img src="/images/kombu3.gif" style="float: left; margin-right:10px;" alt="flower" width="350" height="250">
			<img src="/images/kombu4.png" style="float: left; margin-right:10px;" alt="flower" width="350" height="250">
		 -->
				
					<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-8">
						</div>
						<div class="col-md-2">
						</div>
					</div>
					<div class="row">
						<div class="col-md-0">
						</div>
						<div class="col-md-12">
							<table class="table table-hover flower" 
									onclick="location.href='/program_detail?class_no=60'">
								<tbody>
									<tr>
										
										<td>
										<img src="/images/flower2.gif" alt="flower" width="280" height="200">
										</td>
										<td>
										<img src="/images/flower4.gif" alt="flower" width="280" height="200">
										</td>
										<td>
										<img src="/images/flower5.gif" alt="flower" width="280" height="200">
										</td>
										<td>
										<img src="/images/flower3.gif" alt="flower" width="280" height="200">
										</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
									</tr>
									</tbody>
								</table>
								
								<table class="table table-hover drawing" 
										onclick="location.href='/program_detail?class_no=64'">
								<tbody>
									<tr>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
										<td>&nbsp</td>
									 <td>
										<img src="/images/drawing6.jpeg"  alt="drawing" width="280" height="200">
									</td> 
									<td>
										<img src="/images/drawing7.jpg"  alt="drawing" width="280" height="200">
									</td>
									<td>
										<img src="/images/drawing5.jpg"  alt="drawing" width="280" height="200">
									</td>
									<td>
										<img src="/images/drawing4.jpeg"  alt="drawing" width="280" height="200">
									</td>
									</tr>
									</tbody>
							</table>
							
							<table class="table table-hover kombu" 
									onclick="location.href='/program_detail?class_no=62'">
								<tbody>
									 <tr>
										<td>
										<img src="/images/kombu2.gif" alt="kombu" width="280"  height="200">
										</td>
										<td>
										<img src="/images/kombu3.gif" alt="kombu" width="280" height="200">
										</td>
										<td>
										<img src="/images/kombu5.gif" alt="kombu" width="280" height="200">
										</td>
										<td>
										<img src="/images/kombu6.gif" alt="kombu" width="280" height="200">
										</td>
										
									</tr> 
								</tbody>
							</table>
						</div>
						<div class="col-md-0">
						
							
						</div>
					</div>
				</div>
			</div>
		</div>
				
			</header>
		</div>
	</section>

	



</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>