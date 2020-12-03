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
.login__form {
	margin: 0.2em 0;
	font-size: 1em;
	padding: 0.5em;
	border: 1px solid #ccc;
	border-color: #dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
	box-shadow: inset 0.1em 0.1em 0.15em rgba(0, 0, 0, 0.1);
	vertical-align: middle;
	line-height: 1.25em;
	outline: 0;
	width: 20em;
	border-radius: 0.7em;
}

button {
	padding: 0.5em 1em;
	margin: 0.4em 0.15em;
	border: 1px solid #dbdbdb;
	cursor: pointer;
	color: #464646;
	border-radius: 0.7em;
	vertical-align: middle;
	font-size: 1em;
	line-height: 1.25em;
	background-color: #efefef;
}
input {
	text-rendering: auto;
	color: -internal-light-dark(black, white);
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	text-align: start;
	appearance: textfield;
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
	-webkit-rtl-ordering: logical;
	cursor: text;
}

</style>
</head>
<body>
	<div class="login__containter">
		<form action="Login/loginAction.jsp" method="post" class="form__container">
			아이디<input type="text" name="id" class="login__form" > 
			비밀번호<input type="password" name="pass" class="login__form" >
			<button type="submit">로그인</button>
		</form>
		<a href="index.jsp?main=Login/findIdPass.jsp">아이디/비밀번호찾기</a> 
		<a href="index.jsp?main=Member/memberForm.jsp">회원가입</a>
	</div>
</body>
</html>