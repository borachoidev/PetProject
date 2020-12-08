<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.book__mainlayout{
		margin-top: 15px;
	}
	.book__choice{
		display: flex;
		justify-content: space-between;
	}
	.book__choice2{
		background-color: #FFB61E;	
		position: relative;
		box-shadow: 5px 5px 5px rgba(0,0,0,0.25);
	}
	.book__choice2:after{
		top: 0; /*말풍선꼭지위치 위아래*/
		right: 9.99%; /*말풍선위치 좌우*/
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-color: transparent transparent transparent #FFB61E ; /*말풍선 꼭지방향*/
		border-width: 31.8px; /*말풍선 꼭지 사이즈*/
		margin-right: -28%; /*말풍선 상세위치 조정*/
		z-index: 50;
	}
	.book__choice3{
		background-color: #FFA400;	
		position: relative;
		box-shadow: 5px 5px 5px rgba(0,0,0,0.25);
	}
	.book__choice3:after{
		top: 0; /*말풍선꼭지위치 위아래*/
		right: 9.99%; /*말풍선위치 좌우*/
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-color: transparent transparent transparent #FFA400 ; /*말풍선 꼭지방향*/
		border-width: 31.8px; /*말풍선 꼭지 사이즈*/
		margin-right: -27%; /*말풍선 상세위치 조정*/
		z-index: 50;
	}
	.book__choice4{
		background-color: #F9690E;	
		position: relative;
		box-shadow: 5px 5px 5px rgba(0,0,0,0.25);
	}
	.book__choice4:after{
		top: 0; /*말풍선꼭지위치 위아래*/
		right: 9.99%; /*말풍선위치 좌우*/
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-color: transparent transparent transparent #F9690E ; /*말풍선 꼭지방향*/
		border-width: 31.8px; /*말풍선 꼭지 사이즈*/
		margin-right: -29.5%; /*말풍선 상세위치 조정*/
		z-index: 50;
	}
	.book__choice li{
		list-style-type: none;
		padding:20px 130px;
	}
	 .book__choice1 a, .book__choice2 a, .book__choice3 a, .book__choice4 a{
		pointer-events: none;
	} 
	.bookinfo__mainbox{
		width:100%; 
		height: 600px;
		text-align: center;
		background-image: url("AccSave/puppy14.jpg");
		background-size: cover;
		background-repeat: no-repeat;
		border-radius: 20px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
	}
	.bookinfo__mainbox h1{
		line-height: 250px;
		color: white;
  		font-size: 3.5em;
  		text-shadow: 1px 2px 5px #5D5D5D;
	}
	
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String myId = (String)session.getAttribute("myId");
	
	String petcenter = request.getParameter("petcenter");
	String startday = request.getParameter("startday");
	String endday = request.getParameter("endday");
	String petselect = request.getParameter("petselect");
	String user_name = request.getParameter("user_name");
	String hp = request.getParameter("hp");
	String dog_name = request.getParameter("dog_name");
	
%>
<body>
<div class="book__mainlayout">
<jsp:include page="bookmenu.jsp"/>


	<div class="bookinfo__mainbox">
		<h1>예약이 완료되었습니다.</h1>
		<%-- <div class="bookinfo__success">
			<h5>예약정보</h5>
			<div>
				<div>예약자명 :<%=user_name %></div>
				<div>H.P :<%=hp %></div>
				<div>강아지이름 :<%=dog_name %></div>
				<div>시작날짜 :<%=startday %></div>
				<div>종료날짜 :<%=endday %></div>
				<div>지점명 :<%=petcenter %></div>
				<div>선택강좌 :<%=petselect %></div>
				
			</div>
		</div> --%>
	</div>

</div>
</body>
</html>