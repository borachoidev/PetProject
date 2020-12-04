<%@page import="data.dao.BookDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<style type="text/css">
	th{
		font-size: 0.9em;
	}
	td{
		font-size: 0.9em;
	}
	
</style>
</head>
<%
BookDao dao = new BookDao();
List<HashMap<String,String>> list = dao.getAllBook(); 

%>
<body>

<div style="width: 1200px; margin-top: 50px;">
	<h3>예약자 현황</h3>
	<table class="table table-striped">
		<tr align="center">
			<th>예약 번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>H.P</th>
			<th>강아지 이름</th>
			<th>강아지 견종</th>
			<th>강아지 성별</th>
			<th>강아지 나이</th>
			<th>예약 지점</th>
			<th>예약 강좌</th>
			<th>시작일</th>
			<th>종료일</th>
		</tr>
		
		<%
		for(int i = 0; i<list.size(); i++)
		{
			HashMap<String,String> map = list.get(i);
		%>
			<tr align="center">
				<td><%=map.get("book_num") %></td>
				<td><%=map.get("id") %></td>
				<td><%=map.get("user_name") %></td>
				<td><%=map.get("hp") %></td>
				<td><%=map.get("acc_name") %></td>
				<td><%=map.get("breed") %></td>
				<td><%=map.get("gender") %></td>
				<td><%=map.get("age") %></td>
				<td><%=map.get("petcenter") %></td>
				<td><%=map.get("petselect") %></td>
				<td><%=map.get("startday") %></td>
				<td><%=map.get("endday") %></td>
			</tr>
		
		<%}
		
		%>
	</table>

</div>
</body>
</html>