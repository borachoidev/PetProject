<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.AccountDto"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.BookDao"%>
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
	.book__choice2, .book__choice3{
		background-color: #ddd;	
	}
	.book__choice3 a, .book__choice4 a{
		pointer-events: none;
	}
	.bookadd__3boxmain{
		display: flex;
		justify-content: space-between;
	}
	
	
	.bookadd__box1, .bookadd__box2, .bookadd__box3{
		border: 1px solid blue;
		width: 400px;
		height: 400px; 
		
	}
	.bookadd__btnbox{
		display: flex;
		justify-content: center;
	}
</style>

</head>
<%
request.setCharacterEncoding("utf-8");
String petcenter = request.getParameter("petcenter");
String startday = request.getParameter("startday");
String petselect = request.getParameter("petselect");



String myId = (String)session.getAttribute("myId");
BookDao bdao = new BookDao();

List<HashMap<String,String>> list = bdao.getPuppyList(myId);

int a = 1;



/* -------------------------------------------- */                                           

/* UserDto udto = bdao.getData(myId);

String name = udto.getUser_name();
String hp = udto.getHp();

String user_num = udto.getUser_num();

List<AccountDto> alist = bdao.getPuppy(user_num); */



%>

<body>

<div class="book__mainlayout">
	<jsp:include page="bookmenu.jsp"/>
	<form action="Book/bookInsertAction.jsp" method="post">
		<div class="bookadd__mainbox" style="border: 1px solid red;">
			<h5 style="border: 1px solid green;">Pet&Me Reservation</h5>
			<div class="bookadd__3boxmain">
				<div class="bookadd__box1">
					<%
						if(a == 1)
						{
							HashMap<String,String> map = list.get(0);
							
							
						%>
							예약자: <input name="user_name" type="text" value="<%=map.get("user_name") %>"><br>
							핸드폰: <input name="hp" type="text" value="<%=map.get("hp") %>"><br>
							예약자 번호: <input name="user_num" value="<%=map.get("user_num") %>"><br>
							강아지 번호: <input id="dog_num" name="dog_num" value="<%=map.get("dog_num")%>"><br>
							강아지 이름: <input id="dog_name" name="dog_name" value="<%=map.get("acc_name")%>">
						<%}
					
					%>
					<hr>
					
					<select id="dog_select">
					<%
						for(int i = 0; i<list.size(); i++)
						{
						HashMap<String,String> map = list.get(i);
						%>
						<option value="<%=map.get("dog_num")%>"><%=map.get("acc_name")%></option>
						<%}
					%>
					</select>
					<hr>
					
				</div>
				<div class="bookadd__box2">
					과  정 : <input type="text" name="petselect" value="<%=petselect%>" readonly="readonly"><br> 
					지  점 : <input type="text" name="petcenter" value="<%=petcenter%>" readonly="readonly"><br> 
					날  짜 : <input type="text" name="startday" value="<%=startday%>" readonly="readonly">
					
				</div>
				
				<div class="bookadd__box3"></div>
			</div>	
			<div class="bookadd__btnbox">
				<span style="padding: 10px;">back 버튼</span>
				<button type="submit" class="btn btn-info btn-sm">예약하기</button>
			</div>
			
		</div>
	</form>
</div>
<script type="text/javascript">
	$("#dog_select").change(function(){
		var num =  $("#dog_select option:checked").val();
		var name =  $("#dog_select option:checked").text();
		$("#dog_num").val(num);
		$("#dog_name").val(name);
	});
	
</script>
</body>
</html>