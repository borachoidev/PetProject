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
@font-face {
    font-family: 'GoyangIlsan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff');
     font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GoyangDeogyang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangDeogyang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
	padding: 0px;
	margin: 0px;
	font-family: 'GoyangIlsan';
}

html, body {
	margin:0;
	padding:0;
	width: 100%; 
	height: 100%;
}
h1,h2,h3,h4,h5{
   font-family:'GoyangDeogyang';
}
h1{
font-size: 5rem;
}
h3{
font-size: 2rem;
}
#introDescription, #mungDescription{
cursor: pointer;
padding:4vw;
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
padding:15vh 0 0 0;
overflow:hidden;
background: url('Image/main1.jpg') no-repeat center ;
background-size: cover;
width:100%;
height:100%;
display: flex;
justify-content: center;
align-items: center;
}
#community{
padding:15vh 0 0 0;
overflow:hidden;
background: url('Image/main2.jpg') no-repeat center ;
background-size: cover;
width:100%;
height:100%;
display: flex;
justify-content: center;
align-items: center;
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
	introDescription.onclick=function(){
		location.href="index.jsp?main=Intro/intro.jsp";
	}
	mungDescription.onclick=function(){
		location.href="index.jsp?main=Mung/mungMain.jsp";
	}
	
	intro.onmouseover=function(){
		introDescription.classList.add('animate__jello');
		
	}
	mung.onmouseover=function(){
		mungDescription.classList.add('animate__jello');
	}
	intro.onmouseout=function(){
		introDescription.classList.remove('animate__jello');
	}
	mung.onmouseout=function(){
		mungDescription.classList.remove('animate__jello');
	}
	
}


</script>
</head>
<body>
<div class="container">
	<div id="intro">
		<div id="introDescription" class="animate__animated">
			<h3>프리미엄 반려견유치원</h3>
			<h1>펫앤미</h1>
			<h4>&lt;들어가기&gt;</h4>
		</div>
	</div>	
	<div id="community">
		<div id="mungDescription" class="animate__animated">
			<h3>국내 최대 반려견 커뮤니티</h3>
			<h1>멍스타그램</h1>
			<h4>&lt;들어가기&gt;</h4>
		</div>
	
	</div>
</div>
</body>
</html>