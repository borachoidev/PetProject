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
			<li>펫앤미소개</li>
			<li>예약</li>
			<li>후기</li>
			<li>커뮤니티</li>
			<li>분양</li>
		</ul>
		<ul class="menu__login">
			<li class="menu__login-btn" id="loginBtn">로그인</li>
			<li class="menu__logout-btn" id="logoutBtn">로그아웃</li>
			<li class="menu__logout-btn" id="myPageBtn">마이페이지</li>
		</ul>
	</div>
</body>
</html>