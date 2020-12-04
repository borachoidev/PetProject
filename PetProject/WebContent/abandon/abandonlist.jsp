<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "api.data.Abandon" %>
<%@ page import = "api.data.AbandonDto" %>
<%@ page import = "java.util.*" %>

<%
request.setCharacterEncoding("utf-8");
Abandon dao = new Abandon();
List<AbandonDto> list = dao.getAbandonList();

%>
<table>
	<thead>
		<tr>

			<th>age</th>
			<th>careAddr</th>
			<th>careNm</th>
		</tr>	
	</thead>
	<tbody>
<%
	for(AbandonDto dto: list){	
%>	
		<tr>
			<td><%=dto.getAge() %></td>
			<td><%=dto.getCareaddr() %></td>
			<td><%=dto.getCareNm() %></td>
		</tr>	
<% 	
	}
%>
	
	</tbody>
</table>
</body>
</html>