<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.search_container{
display: flex;
flex-direction: column;
margin-top: 25vh;
justify-content: center;
align-items: center;
}

</style>
</head>
<body>
<div class="search_container">
<h4>입력하신 주소로 회원님의 아이디를 전송했습니다!</h4>
<br>
<div><button type="button" onclick="location.href='index.jsp?main=Login/loginForm.jsp'" class="button">로그인 페이지로</button>
<button type="button" onclick="location.href='index.jsp?main=Login/findIdPass.jsp'" class="button">뒤로가기</button></div>

</div>
</body>
</html>