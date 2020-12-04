<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet & Me | 로그인</title>
<style type="text/css">

.form__container{
display: flex;
flex-direction: column;
}

}

</style>
</head>
<body>
	<div class="login__containter">
		<form action="Login/loginAction.jsp" method="post" class="form__container">
			아이디<input type="text" name="id" class="all__form" > 
			비밀번호<input type="password" name="pass" class="all__form" >
			<button type="submit" class="button">로그인</button>
		</form>
		<a href="index.jsp?main=Login/findIdPass.jsp">아이디/비밀번호찾기</a> 
		<a href="index.jsp?main=Member/memberForm.jsp">회원가입</a>
	</div>
</body>
</html>