<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.book__mainlayout{
		margin-top: 15px;
	}
	.book__choice{
		display: flex;
		justify-content: space-between;
		margin-bottom: 40px;
	}
	
	.book__choice li{
		list-style-type: none;
		padding:20px 130px;
	}
	
	.book__choice2 a, .book__choice3 a, .book__choice4 a{
		pointer-events: none;
	} 
	.bookmain__boxs{
		display: flex;
		justify-content: space-between;
	}
	
	.bookmain__box1{
		background-image: url("Image/puppy3.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		border-radius: 40px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
		width: 430px;
		height: 500px;
		transition:0.5s;
		opacity: 0.9;
		
	}
	.bookmain__box1:hover, .bookmain__box2:hover, .bookmain__box3:hover {
		transform: scale(1.07);
		opacity: 1.0;
		cursor: pointer;
		
	}
	.bookmain__box2{
		background-image: url("Image/puppy50.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		border-radius: 40px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
		width: 430px;
		height: 500px;
		transition:0.5s;
		opacity: 0.9;
	}
	.bookmain__box3{
		background-image: url("Image/puppy40.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		border-radius: 40px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
		width: 430px;
		height: 500px;
		transition:0.5s;
		opacity: 0.9;
	}
	.book__box1__spantitle, .book__box2__spantitle, .book__box3__spantitle{
		color: white;
  		text-shadow: 2px 2px 4px #000000;
		line-height: 150px;
	}
	.book__box1__spancontent, .book__box2__spancontent, .book__box3__spancontent{
		display:none;
		color: white;
	}
	
	
	
	.bookmain__box1:hover .book__box1__spantitle,.bookmain__box2:hover .book__box2__spantitle, .bookmain__box3:hover .book__box3__spantitle{
		display: none;
	}
	.bookmain__box1:hover .book__box1__spancontent ,.bookmain__box2:hover .book__box2__spancontent, .bookmain__box3:hover .book__box3__spancontent{
		display: inline;
		position: relative;
		z-index: 100;
	}
	.bookmain__box1:hover .book__box1__spancontent h3 ,.bookmain__box2:hover .book__box2__spancontent h3, .bookmain__box3:hover .book__box3__spancontent h3{
		position: relative;
		z-index: 100;
		margin-top: 50px;
		margin-bottom: 40px;
	}
	.black__box1, .black__box2, .black__box3{
		width: 430px;
		height: 500px;
		position: absolute;
		border-radius:40px;
		left: 80px;
		top: 187px;
		background-color: black;
		display: none;
		transition:0.5s;
	}
	.bookmain__box1:hover .black__box1, .bookmain__box2:hover .black__box2, .bookmain__box3:hover .black__box3{
		display: inline-block;
		left: 0px;
		top: 0px;
		opacity: 0.7;
		z-index: 1;
		background-color: black;
	} 
	
	
</style>
</head>
<%
 		String loginOk = (String)session.getAttribute("loginOk");
%>
<body>
	<div class="book__mainlayout">
		<jsp:include page="bookmenu.jsp"/>
		
		<div class="bookmain__boxs" style="width: 100%; height: 500px;">
			<div class="bookmain__box1" style="text-align: center; padding: 20px;"  onclick="bookSelectOnelesson()">
				<span class="book__box1__spantitle" style="font-size: 2.5em;">1:1 레슨</span>
				<span class="book__box1__spancontent" style="font-size: 0.9em;">
					<h3 style="color : white; ">1:1 레슨이란?</h3><br>
					그룹 레슨을 200회 이상 진행한 펫앤미 훈련사와 일대일로 이루어지는 Personal Care!
					
					내 반려견의 성향과 특성에 맞는 맞춤 교육은 물론 산책 교육에 기초가 되는
					섬세한 핸들링 교정을 받아보세요.
					
					보듬훈련사는 반려견 문제행동의 근본적인 원인을 파악하고
					그 원인 치유에 주력할 것을 약속드립니다.
					
				</span>
				<div class="black__box1"></div>
			</div>
			<div class="bookmain__box2" style="text-align: center; padding: 20px;" onclick="bookSelectGrouplesson()">
				<span class="book__box2__spantitle" style="font-size: 2.5em;">그룹 레슨</span>
				<span class="book__box2__spancontent" style="font-size: 0.9em;">
					<h3  style="color : white; ">그룹 레슨이란?</h3><br>
					훈련사님이 자신 있게 추천하는 Pet & Me 그룹 레슨!<br>
					
					풀패키지 기간 동안 매주 풍부한 주제로 업데이트되는 그룹 레슨을 통해
					양질의 오프라인 교육을 받으실 수 있습니다.<br>
					
					경험이 풍부한 펫앤미 훈련사의 지도 아래 분리불안, 어질리티, 예절, 클리커 등
					다양한 주제로 진행되며, 내 반려견과 성향이 맞는 다른 강아지들과 어울려
					사회성을 기를 수 있습니다.
					
					보호자님의 반려견의 이 사회에 잘 적응하고 행복한 생활을 하는 것이
					펫앤미의 목표이고 바람입니다.
				</span>
				<div class="black__box2"></div>
			</div>
			<div class="bookmain__box3" style="text-align: center; padding: 20px;" onclick="bookSelectHoteling()">
				<span class="book__box3__spantitle" style="font-size: 2.5em;">호텔링</span>
				<span class="book__box3__spancontent" style="font-size: 0.9em;">
					<h3  style="color : white; ">호텔링이란?</h3><br>
					펫앤미 호텔링 서비스는 단순히 아이들을 케어만 하는 곳이 아니며 
					안락하고 단란한 환경과 따듯한 손길로
					아이의 행복과 긍정성을 극대화하는 반려동물 복합 힐링플레이스입니다.
				</span>
				<div class="black__box3"></div>
			</div>
		</div>
	
	
	</div>
<script type="text/javascript">
 	function bookSelectOnelesson(){
 		var s="<%=loginOk%>";
 		if(s=="null"){
 			alert("먼저 로그인을 해주세요");
 			location.onLoad();
 		}else{
 			location.href="index.jsp?main=Book/bookSelect.jsp?onelesson=1:1 레슨";
 		}
 	}
 	function bookSelectGrouplesson(){
 		var s="<%=loginOk%>";
 		if(s=="null"){
 			alert("먼저 로그인을 해주세요");
 			location.onLoad();
 		}else{
 			location.href="index.jsp?main=Book/bookSelect.jsp?onelesson=그룹 레슨";
 		}
 	}
 	function bookSelectHoteling(){
 		var s="<%=loginOk%>";
 		if(s=="null"){
 			alert("먼저 로그인을 해주세요");
 			location.onLoad();
 		}else{
 			location.href="index.jsp?main=Book/bookSelect.jsp?onelesson=호텔링";
 		}
 	}
</script>	
</body>
</html>