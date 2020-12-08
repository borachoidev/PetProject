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
	.book__choice li{
		list-style-type: none;
		padding:20px 130px;
	}
	.book__choice3 a, .book__choice4 a{
		pointer-events: none;
	}
	.bookAdd__box1{
		width : 430px;
		height:500px;
		border-radius: 40px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
		padding: 20px;
	}
	.bookAdd__box1 input{
		width: 150px;
		margin-bottom: 10px;
		
	}
	
	.bookAdd__box3{
		width : 430px;
		height:500px;
		border-radius: 40px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
		padding: 40px;
	}
	.bookAdd__box3 input{
		width: 200px;
		margin-bottom: 10px;
		
	}
	.bookAdd__box2{
		width : 430px;
		height:500px;
		padding: 30px;
		text-align: center;
		border-radius: 40px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
	}
	.bookadd__btnbox{
		display: flex;
		justify-content: center;
	}
	.book__photo{
		width:250px;
		height:250px;
		overflow:hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 250px;
		margin: auto;
		margin-bottom: 10px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
		
	}
	.book__photo img{
		max-width:250px;
	}
	.book__puppy tr{
		line-height: 60px;
	}
	
	.bookadd__mainbox{
		display: flex;
		justify-content: space-around;
	}
	.bookAdd__photobox{
		background-image: url("AccSave/petone2.jpg");
		width: 300px;
		height: 150px;
		background-size: cover;
		background-repeat: no-repeat;
		border-radius: 40px;
		box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
		opacity: 0.8;
		text-align: center;
		line-height: 150px;
		font-weight: bold;
		color: white;
		text-shadow: 2px 2px 4px #000000;
		font-size: 1.8em;
		margin: auto;
		margin-bottom: 20px;
		margin-top: 20px;
	}
	.bookAdd__infobox{
		margin-left:50px;
		margin-top: 50px;
	}
	.book__box2__breed{
		text-align: center;
		border-radius: 40px;
		box-shadow: 0 3px 3px rgba(0,0,0,0.16), 0 3px 3px rgba(0,0,0,0.23);
		width: 50%;
		margin: auto;
		margin-top: 30px;
		padding: 5px;
	}
	
</style>

</head>
<%
request.setCharacterEncoding("utf-8");
String petcenter = request.getParameter("petcenter");
String startday = request.getParameter("startday");
String endday = request.getParameter("endday");
String petselect = request.getParameter("petselect");



String myId = (String)session.getAttribute("myId");
BookDao bdao = new BookDao();

List<HashMap<String,String>> list = bdao.getPuppyList(myId);




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
		<div class="bookadd__mainbox" style="margin-top: 50px;">
			<!-- <h5 style="border: 1px solid green;">Pet&Me Reservation</h5> -->
			<div class="bookAdd__box1">
				
					<%
						if(true)
						{
							HashMap<String,String> map = list.get(0);
							
							
						%>
							<div class="bookAdd__photobox"><%=petselect%></div>
							<div class="bookAdd__infobox">
							센터명 : <input class="all__form" type="text" name="petcenter" value="<%=petcenter%>" readonly="readonly"><br> 
							시작일 : <input class="all__form" type="text" name="startday" value="<%=startday%>" readonly="readonly"><br> 
							종료일 : <input class="all__form" type="text" name="endday" value="<%=endday%>" readonly="readonly"><br>
							<input type="hidden" name="petselect" value="<%=petselect%>" readonly="readonly" style="width: 100px;"><br>
							</div>
						<%}
					
					%>
			</div>	
					
					
							<%-- <table class="book__puppy table table-striped">
								<tr>
									<td><div class="book__photo"><img src="AccSave/<%=list.get(0).get("photo")%>"></div></td>
									<td><%=list.get(0).get("acc_name")%></td>
									<td><%=list.get(0).get("breed")%></td>
									<td><%=list.get(0).get("age")%></td>
								</tr>
							</table>
							<hr> --%>
					<!-- 나의 강아지들 정보 -->
					<%-- <table class="book__puppy table table-striped">
					<%
						for(int i = 0; i<list.size(); i++)
						{
						HashMap<String,String> map = list.get(i);
						%>
						<tr>
							<td><div class="book__photo"><img src="AccSave/<%=map.get("photo")%>"></div></td>
							<td><%=map.get("acc_name")%></td>
							<td><%=map.get("breed")%></td>
							<td><%=map.get("age")%></td>
						</tr>
						<%}
					%>
					</table> --%>
				<div class="bookAdd__box2" >
					<!-- <div>예약할 강아지</div> -->
					<select id="dog_select"  onchange="selectGang()" style="margin-bottom: 30px;">
					<%
						for(int i = 0; i<list.size(); i++)
						{
						HashMap<String,String> map = list.get(i);
						%>
						<option value="<%=map.get("dog_num")%>"><%=map.get("acc_name")%></option>
						<%}
					%>
					</select>
					<div id="book__myPuppy"></div>
					
				</div>
				
			<div class="bookAdd__box3">
						<%
						if(true)
						{
							HashMap<String,String> map = list.get(0);
							
							
						%>
							<div style="font-weight: bold; margin-bottom: 35px;">예약자정보</div>
							예약자 : <input class="all__form" name="user_name" type="text" value="<%=map.get("user_name") %>"><br>
							핸드폰 : <input class="all__form" name="hp" type="text" value="<%=map.get("hp") %>"><br>
							
							<!-- 예약자 번호: --> <input type="hidden" name="user_num" value="<%=map.get("user_num") %>"><br>
							<!-- 강아지 번호: --> <input type="hidden" id="dog_num" name="dog_num" value="<%=map.get("dog_num")%>"><br>
							<!-- 강아지 이름:  --><input type="hidden" id="dog_name" name="dog_name" value="<%=map.get("acc_name")%>">
						<%}
					
					%>
						<div class="bookadd__btnbox">
							<button type="button" id="back_btn" class="button" onclick="btnBack()">Back</button>
							<button type="submit" class="button">예약하기</button>
						</div>
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
<!-- <script type="text/javascript">
	function selectGang(){
		var puppyNum = document.getElementById("dog_select").selectedIndex;
		alert(puppyNum);
		
	}
</script> -->
<script type="text/javascript">
		//선택안해도 처음부터 호출
		document.addEventListener("DOMContentLoaded", function() {
			selectGang();
		   });

		function selectGang(){
				var puppyNum = document.getElementById("dog_select").selectedIndex;
				//alert(puppyNum);
				$.ajax({
					type:"get",
					url:"Book/bookPuppyNum.jsp",
					dataType:"xml",
					data:{"puppyNum":puppyNum},
					success:function(data){
						var s = "<div>";
						$(data).find("puppyNum").each(function(i, element) {
							var n =$(this);
							/* alert(n.find("acc_name").text()); */
							s+= "<div class='book__photo'><img src='AccSave/"+n.find('photo').text()+"'></div>";
							s+= "<div class='book__box2__breed'>"+n.find("breed").text()+"<br>"+n.find("age").text()+"</div>";
							/* s+= "<div class='book__box2__age'>"+n.find("age").text()+"</div>"; */
						});
						s+="</div>";
						$("#book__myPuppy").html(s);
					}
				});
			}
	function btnBack(){
		history.back();
	}
</script> 
</body>
</html>