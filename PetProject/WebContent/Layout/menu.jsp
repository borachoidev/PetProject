<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.nav__title {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	padding:25px;
	height:80px;
	align-items: center;
	font-size:20px;
	box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
}

ul.menu__list, .menu__login {
	display: flex;
	flex-direction: row;
	list-style: none;
}
ul.menu__list li{
padding:0px 25px ;
}
.menu__login li{
padding:0px 10px ;
}
.menu__login{
font-size:17px;}

.menu__login .menu__logout-btn {
	display: none;
}
</style>
</head>
<body>
	<div class="nav__title">
		<span>Pet&Me</span>
		<ul class="menu__list">
			<a href="index.jsp?main=Intro/intro.jsp"><li>펫앤미소개</li></a>
			<a href="index.jsp?main=Book/bookMain.jsp"><li>예약</li></a>
			<a href="index.jsp?main=Review/reviewMain.jsp"><li>후기</li></a>
			<a href="index.jsp?main=Mung/mungMain.jsp"><li>커뮤니티</li></a>
			<a href="index.jsp?main=Adopt/adoptMain.jsp"><li>분양</li></a>
		</ul>
		<ul class="menu__login">
			<a href="index.jsp?main=Login/loginForm.jsp"><li class="menu__login-btn" id="loginBtn">로그인</li></a>
			<a href="index.jsp?main=Logout/logout.jsp"><li class="menu__logout-btn" id="logoutBtn">로그아웃</li></a>
			<a href="index.jsp?main=Mypage/mypageMain.jsp"><li class="menu__logout-btn" id="myPageBtn">마이페이지</li></a>
		</ul>
	</div>
</body>
</html>