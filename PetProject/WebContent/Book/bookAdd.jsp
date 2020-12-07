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
		margin-top: 30px;
	}
	.book__choice{
		display: flex;
		justify-content: space-between;
	}
	.book__choice2{
		background-color: #FFB61E;	
		position: relative;
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
		margin-right: -28%; /*말풍선 상세위치 조정*/
		z-index: 50;
	}
	.book__choice li{
		list-style-type: none;
		padding:20px 130px;
	}
	.book__choice3 a, .book__choice4 a{
		pointer-events: none;
	}
	.bookadd__3boxmain{
		display: flex;
		justify-content: space-between;
	}
	
	
	.bookadd__box1, .bookadd__box2{
		border: 1px solid blue;
		width: 600px;
		height: 450px; 
		
	}
	.bookadd__btnbox{
		display: flex;
		justify-content: center;
	}
	.book__photo{
		width:60px;
		height:60px;
		overflow:hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 100px;
	}
	.book__photo img{
		max-width:80px;
	}
	.book__puppy tr{
		line-height: 60px;
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
		<div class="bookadd__mainbox" style="border: 1px solid red;">
			<h5 style="border: 1px solid green;">Pet&Me Reservation</h5>
			<div class="bookadd__3boxmain">
				<div class="bookadd__box1">
					<%
						if(true)
						{
							HashMap<String,String> map = list.get(0);
							
							
						%>
							예약자: <input name="user_name" type="text" value="<%=map.get("user_name") %>"><br>
							핸드폰: <input name="hp" type="text" value="<%=map.get("hp") %>"><br>
							<!-- 예약자 번호: --> <input type="hidden" name="user_num" value="<%=map.get("user_num") %>"><br>
							<!-- 강아지 번호: --> <input type="hidden" id="dog_num" name="dog_num" value="<%=map.get("dog_num")%>"><br>
							<!-- 강아지 이름:  --><input type="hidden" id="dog_name" name="dog_name" value="<%=map.get("acc_name")%>">
						<%}
					
					%>
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
					
					<div>예약할 강아지</div>
					<select id="dog_select"  onchange="selectGang()" style="margin-bottom: 10px;">
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
				<div class="bookadd__box2">
					과  정 : <input type="text" name="petselect" value="<%=petselect%>" readonly="readonly"><br> 
					지  점 : <input type="text" name="petcenter" value="<%=petcenter%>" readonly="readonly"><br> 
					시작일 : <input type="text" name="startday" value="<%=startday%>" readonly="readonly"><br> 
					종료일 : <input type="text" name="endday" value="<%=endday%>" readonly="readonly"><br><br>
					
					
					
							
							<%-- <table class="book__puppy table table-striped">
								<tr>
									<td><div class="book__photo"><img src="AccSave/<%=list.get(0).get("photo")%>"></div></td>
									<td><%=list.get(0).get("acc_name")%></td>
									<td><%=list.get(0).get("breed")%></td>
									<td><%=list.get(0).get("age")%></td>
								</tr>
							</table>
							<hr> --%>
							
					
				</div>
				
			</div>	
			<div class="bookadd__btnbox">
				<button type="button" id="back_btn" class="button"><a href="index.jsp?main=Book/bookSelect.jsp?onelesson=클래스를 선택해 주세요" style="color: white;">Back</a></button>
				<button type="submit" class="button">예약하기</button>
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
						var s = "<table class='book__puppy table table-striped'><tr>";
						$(data).find("puppyNum").each(function(i, element) {
							var n =$(this);
							/* alert(n.find("acc_name").text()); */
							s+= "<td><div class='book__photo'><img src='AccSave/"+n.find('photo').text()+"'></div></td>";
							s+= "<td>"+n.find("acc_name").text()+"</td>";
							s+= "<td>"+n.find("breed").text()+"</td>";
							s+= "<td>"+n.find("age").text()+"</td>";
						});
						s+="</tr></table>";
						$("#book__myPuppy").html(s);
					}
				});
			}
</script> 
</body>
</html>