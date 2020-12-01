<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet & Me | 반려견과 내가 소통하는 공간</title>
<link rel="icon" href="Image/favicon.png">
<link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<style type="text/css">
html, body {
	margin:0;
	padding:0;
	width: 100%; 
	height: 100%;
}
*{
	margin:0;
	padding:0;
}
.container{
overflow: hidden;
touch-action: none;
display: flex;
flex-direction: row;
width:100%;
height:100%;
}
#intro{
overflow:hidden;
background: url('Image/main1.jpg') no-repeat center ;
background-size: cover;
width:100%;
height:100%;
}
#community{
overflow:hidden;
background: url('Image/main2.jpg') no-repeat center ;
background-size: cover;
width:100%;
height:100%;
}

.animate__jello{
animate__animated animate__jello animate__delay-2s
}

</style>
<script type="text/javascript">
window.onload=function() {
	const intro =document.getElementById("intro");
	const mung =document.getElementById("community");
	const introDescription =document.getElementById("introDescription");
	const mungDescription =document.getElementById("mungDescription");
	intro.onclick=function(){
		location.href="index.jsp?main=Intro/intro.jsp";
	}
	mung.onclick=function(){
		location.href="index.jsp?main=Mung/mungMain.jsp";
	}
	
	intro.onmouseover=function(){
		addClass(introDescription, "animate__animated");
		addClass(introDescription, "animate__jello");
	}
	mung.onmouseover=function(){
		addClass(mungDescription, "animate__animated");
		addClass(mungDescription, "animate__jello");
	}
	intro.onmouseout=function(){
		removeClass(introDescription, "animate__animated");
		removeClass(introDescription, "animate__jello");
	}
	mung.onmouseout=function(){
		removeClass(mungDescription, "animate__animated");
		removeClass(mungDescription, "animate__jello");
	}
	
}
function addClass(element, className){ 
	element.className += " " + className; 
	};


function removeClass(element, className){
	var check = new RegExp("(\\s|^)" + className + "(\\s|$)"); 
	element.className = element.className.replace(check, " ").trim(); 
	};

</script>
</head>
<body>
<div class="container">
	<div id="intro">
		<div id="introDescription">
			<h3>프리미엄 반려견유치원</h3>
			<h1>펫앤미</h1>
			<p>&lt;들어가기&gt;<p>
		</div>
	</div>	
	<div id="community">
		<div id="mungDescription">
			<h3>국내 최대 반려견 커뮤니티</h3>
			<h1>멍스타그램</h1>
			<p>&lt;들어가기&gt;<p>
		</div>
	
	</div>
</div>
</body>
</html>