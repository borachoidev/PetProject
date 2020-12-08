<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.book__choice1{
		position: relative;
		/* box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23); */
		box-shadow: 5px 5px 5px rgba(0,0,0,0.25);
	}
	.book__choice1:after{
		top: 0; /*말풍선꼭지위치 위아래*/
		right: 9.3%; /*말풍선위치 좌우*/
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-color: transparent transparent transparent #F7CA18 ; /*말풍선 꼭지방향*/
		border-width: 32px; /*말풍선 꼭지 사이즈*/
		margin-right: -29.3%; /*말풍선 상세위치 조정*/
		z-index: 50;
		
	}
</style>
</head>
<body>
<ul class="book__choice">
	<li class="book__choice1" style="background-color: #F7CA18;"><a href="index.jsp?main=Book/bookMain.jsp">과정정보</a></li>
	<li class="book__choice2" ><a href="index.jsp?main=Book/bookSelect.jsp?onelesson=클래스를 선택해 주세요">예약정보 선택</a></li>
	<li class="book__choice3" ><a href="index.jsp?main=Book/bookAdd.jsp">예약 강아지 등록</a></li>
	<li class="book__choice4" ><a href="index.jsp?main=Book/bookInfo.jsp">예약 완료</a></li>
</ul>
</body>
</html>