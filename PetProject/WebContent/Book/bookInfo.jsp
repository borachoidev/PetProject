<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.book__mainlayout{
		margin-top: 100px;
	}
	.book__choice{
		display: flex;
		justify-content: space-between;
	}
	.book__choice li{
		list-style-type: none;
		padding:20px 130px;
	}
	.book__choice2, .book__choice3, .book__choice4{
		background-color: #ddd;
	}
	/* .book__choice1 a, .book__choice2 a, .book__choice3 a, .book__choice4 a{
		pointer-events: none;
	}  */
	.bookinfo__mainbox{
		width:100%; 
		height: 500px;
		border: 1px solid red;
		text-align: center;
	}
	
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String myId = (String)session.getAttribute("myId");
	
	String petcenter = request.getParameter("petcenter");
	String startday = request.getParameter("startday");
	String petselect = request.getParameter("petselect");
	String user_name = request.getParameter("user_name");
	String hp = request.getParameter("hp");
	String dog_name = request.getParameter("dog_name");
	
%>
<body>
<div class="book__mainlayout">
<jsp:include page="bookmenu.jsp"/>

book4

	<div class="bookinfo__mainbox">
		<h1>예약이 완료되었습니다.</h1>
		<div class="bookinfo__success">
			<h4>예약정보</h4>
			<div>
				<div>예약자명 :<%=user_name %></div>
				<div>hp :<%=hp %></div>
				<div>강아지이름 :<%=dog_name %></div>
				<div>시작날짜 :<%=startday %></div>
				<div>지점명 :<%=petcenter %></div>
				<div>선택강좌 :<%=petselect %></div>
				
				
				
				
				
								
			</div>
		</div>
	</div>

</div>
</body>
</html>