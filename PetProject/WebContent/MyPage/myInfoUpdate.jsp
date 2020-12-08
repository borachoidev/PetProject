<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#myPage__container {
		width: 40vw;
		margin-top: 5%;
	}

	.myPage__update-btn {
		display: flex;
		justify-content: space-between;
		margin-top: 10%;
		padding: 0 5%;
	}
	
	.myPage__info-btn {
		width: 45%;
		height: 100%;
		border: 2px solid #ffc400;
		border-radius: 10px;
		text-align: center;
		padding: 5% 0;
		color: white;
		box-shadow: 3px 3px #ddd;
	}
	
	.myPage__info-btn:hover {
		background-color: #ffc400;
	}
	
	.myPage__info-btn h5 {
		margin: 0;
	}
</style>
</head>
<body>
<div id="myPage__container">
	<h2>내 정보 관리&nbsp;&gt;</h2>
	<div class="myPage__update-btn">
		<div class="myPage__info-btn">
			<a href="index.jsp?main=MyPage/memberUpdate.jsp">
				<h5>개인정보 수정&nbsp;</h5>
			</a>
		</div>
		<div class="myPage__info-btn">
			<a href="index.jsp?main=MyPage/passUpdate.jsp">
				<h5>비밀번호 변경&nbsp;</h5>
			</a>
		</div>
	</div>
</div>
</body>
</html>