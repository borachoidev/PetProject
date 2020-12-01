<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- script -->
<script type="text/javaScript">
$(function(){
	$(".submenu").hide();
	
	$(".menu__list li").hover(function(){
		$(".submenu").slideDown();
	});
	$(".submenu").hover(function(){
		$(this)
	},function(){
		$(this).slideUp();
	});
	


});

</script>
<!-- style -->
<style type="text/css">
.main-menu {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	padding:25px;
	height:80px;
	align-items: center;
	font-size:20px;
	box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
	position: sticky;
	top:0;
	background-color: white;
}

ul.menu__list, .menu__login, .menu__logout, .submenu {
	display: flex;
	flex-direction: row;
	list-style: none;
}
ul.menu__list li{
padding:0px 25px ;
}
.menu__login li , .menu__logout li{
padding:0px .3em ;
}
.menu__login, .menu__logout{
font-size:17px;}

.submenu {
	display: flex;
	flex-direction: row;
	justify-content:center;
	background-color: white;
}
</style>
</head>

<body>
<!-- 메인메뉴 -->
	<div class="main-menu">
		<span><a href="home.jsp">Pet&Me</a></span>
		<ul class="menu__list">
			<li><a href="index.jsp?main=Intro/intro.jsp">펫앤미소개</a> </li>
			<li><a href="index.jsp?main=Book/bookMain.jsp"> 예약 </a> </li>
			<li><a href="index.jsp?main=Review/reviewMain.jsp"> 후기 </a> </li>
			<li><a href="index.jsp?main=Mung/mungMain.jsp"> 커뮤니티 </a> </li>
			<li><a href="index.jsp?main=Adopt/adoptMain.jsp"> 분양 </a> </li>
		</ul>
		<%
		//세션에서 로그인상태를 알수 잇는 loginok 얻기
	String loginok=(String)session.getAttribute("loginOk");	
	String myId=(String)session.getAttribute("myId");
		if(loginok==null){%>
		<ul class="menu__login">
				<li id="loginBtn"><a href="index.jsp?main=Login/loginForm.jsp">로그인 </a> </li>
				<li id="signinBtn"><a href="index.jsp?main=Member/memberForm.jsp">회원가입 </a></li>
			</ul>
	<%}else{
		//아이디가 amdin일떄 관리자 메뉴표시
		if(myId!=null){	
		 if(myId.equals("admin")){%>
		 	<ul class="menu__logout">	
				<li id="logoutBtn"><a href="Login/logoutAction.jsp" >로그아웃 </a></li>
				<li id="myPageBtn"><a href="index.jsp?main=Admin/adminMain.jsp">관리자페이지</a></li>
			</ul>
			<%}else{
			//아닐때 일반 로그아웃 메뉴 표시
			%>
		<ul class="menu__logout">	
				<li id="logoutBtn"><a href="Login/logoutAction.jsp" >로그아웃 </a></li>
				<li id="myPageBtn"><a href="index.jsp?main=MyPage/mypageMain.jsp">마이페이지 </a></li>
			</ul>
	<%}}
			
		
		 }%> 
	</div> 
<!-- 슬라이드 다운 서브메뉴 -->
	<div class="submenu">
		<ul class="menu__intro">
			<li><a href="index.jsp?main=Intro/intro.jsp#introUs"> 팻엔미소개 </a></li>
			<li><a href="index.jsp?main=Intro/intro.jsp#introLocation"> 위치안내 </a></li>
		</ul>
		
		<ul class="menu__community">
			<li><a href="index.jsp?main=Mung/mungMain.jsp"> 멍스타그램 </a></li>
			<li><a href="index.jsp?main=Walk/walkMain.jsp"> 산책친구 </a></li>
		</ul>
		<ul class="menu__adopt">
			<li><a href="index.jsp?main=Adopt/adoptMain.jsp"> 가정분양 </a></li>
			<li><a href="index.jsp?main=Adopt/adoptMain.jsp"> 유기견분양 </a></li>
		</ul>
	</div>
</body>
</html>