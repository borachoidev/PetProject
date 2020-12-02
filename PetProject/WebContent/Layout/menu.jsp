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
<style type="text/css">

#topMenu {
  height: 9vh; /* 메인 메뉴의 높이 */
  width:100%; /* 메인 메뉴의 넓이 */
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  position: sticky;
  top:0;
  background-color: white;
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
}
#topMenu ul {
 
  list-style-type: none; 
  margin: 0px; 
  padding: 0px;
}
#topMenu ul li {
  
  color: black; 
  line-height: 3rem;
  vertical-align: middle; 
  text-align: center;
}
.menu__list{
	display: flex;
	flex-direction: row;
	align-items: center;
}
.menu__login {
	display: flex;
	flex-direction: row;
	padding:3em;
	align-items: center;
}
 .menuLink,
.submenuLink {
  text-decoration: none; 
  display: block; 
  width: 11vw; 

} 

.topMenuli{
height:100%;}
.menuLink {
  color: black;
  height:100%;
}
 .submenuLink {

  color: #2d2d2d; 
  background-color: white; 

} 

.submenu {
  
  position: absolute; 
  height: 0px; 
  overflow: hidden; 
  transition: height 0.2s; 
  -webkit-transition: height 0.2s; 
  -moz-transition: height 0.2s;
  -o-transition: height 0.2s; 
  z-index:9999;
}
.topMenuLi:hover .submenu {
  	height: auto; 
  	/* box-shadow: -1px 1px 6px rgba(0,0,0,0.16); */
}
.submenuLink:hover {
  color: #FFD479; 
}
.menu__login li{
padding-right:1vw;
}
.menu__title{
padding-left:1.5vw;
}
</style>

</head>

<body>
<!-- 메인메뉴 -->
	<div class="main-menu" id="topMenu">
		<span class="menu__title"><a href="home.jsp">Pet&Me</a></span>
		<ul class="menu__list">
			<li class="topMenuLi">
				<a class="menuLink" href="index.jsp?main=Intro/intro.jsp">펫앤미소개</a> 
				<ul class="menu__intro submenu">
					<li><a class="submenuLink" href="index.jsp?main=Intro/intro.jsp#introUs"> 팻엔미소개 </a></li>
					<li><a class="submenuLink" href="index.jsp?main=Intro/intro.jsp#introLocation"> 위치안내 </a></li>
				</ul>
			</li>
			<li class="topMenuLi">
				<a class="menuLink" href="index.jsp?main=Book/bookMain.jsp"> 예약 </a> 
			</li>
			<li class="topMenuLi">
				<a class="menuLink" href="index.jsp?main=Review/reviewMain.jsp"> 후기 </a> 
			</li>
			<li class="topMenuLi">
				<a class="menuLink" href="index.jsp?main=Mung/mungMain.jsp"> 커뮤니티 </a> 
				<ul class="menu__community submenu">
					<li><a class="submenuLink"  href="index.jsp?main=Mung/mungMain.jsp"> 멍스타그램 </a></li>
					<li><a class="submenuLink" href="index.jsp?main=Walk/walkMain.jsp"> 산책친구 </a></li>
				</ul>
			</li>
			<li class="topMenuLi">
				<a class="menuLink" href="index.jsp?main=Adopt/adoptMain.jsp"> 분양 </a> 
				<ul class="menu__adopt submenu">
					<li><a class="submenuLink" href="index.jsp?main=Adopt/adoptMain.jsp"> 가정분양 </a></li>
					<li><a class="submenuLink" href="index.jsp?main=Adopt/adoptMain.jsp"> 유기견분양 </a></li>
				</ul>
			</li>
		</ul>
		
		
		
	<!-- 로그인 관련메뉴 -->	
		<%
		//세션에서 로그인상태를 알수 잇는 loginok 얻기
	String loginok=(String)session.getAttribute("loginOk");	
	String myId=(String)session.getAttribute("myId");
		if(loginok==null){%>
		<ul class="menu__login">
				<li id="signinBtn"><a href="index.jsp?main=Member/memberForm.jsp">회원가입 </a></li>
				<li id="loginBtn"><a href="index.jsp?main=Login/loginForm.jsp">로그인 </a> </li>
			</ul>
	<%}else{
		//아이디가 amdin일떄 관리자 메뉴표시
		if(myId!=null){	
		 if(myId.equals("admin")){%>
		 	<ul class="menu__login menu__list">	
				<li id="myPageBtn" class="topMenuLi">
					<a class="menuLink" href="index.jsp?main=Admin/adminMain.jsp">관리자페이지</a>
					<ul class="menu__adminpage submenu">
						<li><a class="submenuLink" href="index.jsp?main=Admin/memberList.jsp"> 회원관리 </a></li>
						<li><a class="submenuLink" href="index.jsp?main=Admin/bookingList.jsp"> 예약관리 </a></li>
						<li><a class="submenuLink" href="index.jsp?main=Admin/reviewList.jsp"> 후기글관리 </a></li>
					</ul>
				</li>	
				<li id="logoutBtn"><a href="Login/logoutAction.jsp" >로그아웃 </a></li>
				
			</ul>
			<%}else{
			//아닐때 일반 로그아웃 메뉴 표시
			%>
		<ul class="menu__login menu__list">	
				<li id="myPageBtn" class="topMenuLi">
					<a class="menuLink" href="index.jsp?main=MyPage/mypageMain.jsp">마이페이지 </a>
					<ul class="menu__mypage submenu">
						<li><a class="submenuLink" href="index.jsp?main=MyPage/accAdd.jsp"> 반려동물등록 </a></li>
						<li><a class="submenuLink" href="index.jsp?main=MyPage/accUpdate.jsp"> 반려동물수정</a></li>
						<li><a class="submenuLink" href="index.jsp?main=MyPage/bookList.jsp"> 수강내역 </a></li>
						<li><a class="submenuLink" href="index.jsp?main=MyPage/bookListForFuture.jsp"> 예약현황 </a></li>
						<li><a class="submenuLink" href="index.jsp?main=MyPage/reviewList.jsp"> 내글관리 </a></li>
						<li><a class="submenuLink" href="index.jsp?main=MyPage/memberUpdate.jsp"> 회원정보수정 </a></li>
					</ul>
				</li>	
				<li id="logoutBtn"><a href="Login/logoutAction.jsp" >로그아웃 </a></li>
			</ul>
	<%}}
			
		
		 }%> 
	</div> 
</body>
</html>















