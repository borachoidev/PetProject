<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#myPage__container {
		width: 60vw;
		margin: 10% 20vh;
		align-content: center;
	}
	
	.myPage__pass-update {
		width: 20%;
		margin: 0 40%;
		display: flex;
		justify-content: flex-start;
		flex-direction: column;
	}
	
	.myPage__pass-update input {
		margin-bottom: 7%; 
		padding-left: 5%;
	}
</style>
</head>
<body>
<div id="myPage__container">
	<form action="MyPage/myPageIsPass.jsp" class="myPage__pass-update">
		<span>현재 비밀번호  </span>
		<input type="password" name="pass" id="pass" class="all__form large" placeholder="비밀번호" required /> 
		<span>변경할 비밀번호 </span>
		<input type="password" name="new_pass" id="pass" class="all__form large" placeholder="비밀번호" required pattern="(?=.*\d)(?=.*[a-z]).{6,}"  title="6자리 이상, 하나 이상의 숫자 및 소문자를 모두 포함해야합니다." /> 
		<span> 비밀번호 확인 </span>
		<input type="password" class="all__form large" placeholder="비밀번호확인" id="passComfirm" required />
		<span class="pass-comfirm"></span>
		<button type="submit" class="large button">비밀번호 변경</button>
	</form>
</div>
</body>
</html>