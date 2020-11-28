<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet & Me | 로그인</title>
</head>
<body>
	<div class="login__containter">
		<form class="login__form" action="Login/loginAction.jsp" method="post">
			아이디<input type="text" name="id"> 
			비밀번호<input type="password" name="pass">
			<button type="submit">로그인</button>
		</form>
		<a href="">아이디/비밀번호찾기</a> 
		<ahref="index.jsp?main=Member/memberForm.jsp">회원가입</a>
	</div>
</body>
</html>