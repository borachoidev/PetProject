<%@page import="api.data.AbandonDto"%>
<%@page import="java.util.List"%>
<%@page import="api.data.Abandon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	main{
		display: flex;
		flex-direction: row;
	
	}
	#abandon__table td{
		text-align:center;
	
	}
	td.first__td{
		width: 200px;	
	}
	td.second__td{
		width: 600px;	
	}


</style>
</head>
<%  
request.setCharacterEncoding("utf-8");
String desertionNo=request.getParameter("desertionNo");
Abandon dao = new Abandon();
AbandonDto dto = dao.getData(desertionNo);
%> 
<body>
	<div id="abandon__detail">
		<header>
			<h2>분양 정보</h2>
		</header>
	  	<main>	
			 <div class="photo" style="text-align: center;">
	               <img src=<%=dto.getPopfile()%> style="max-width: 300px; max-height: 400px; margin: auto;">
			</div>
	       <div style="text-align: center;">
			<table class="table table-striped" style="width: 750px;" id="abandon__table">
	        <tr>
	         		<td class="first__td"><h3>견종</h3></td>
	         		<td class="second__td"><h3><%=dto.getKindcd()%></h3></td>
	         </tr>
	         <tr>		
	         	<td class="first__td"><h3>성별</h3></td>
				<td class="second__td"><h3><%
	         if(dto.getSexCd().equals("M")){
	        %>수컷
	        <%}else{%>암컷
	        <%}
	          %></h3></td>
	         </tr>
	           <tr>		
	         		<td class="first__td"><h3>중성화 여부</h3></td>
	         		<td class="second__td"><h3><%=dto.getNeuteryn()%></h3></td>
	         </tr>
	         <tr>		  
	         		<td class="first__td"><h3>나이</h3></td>
	         		<td class="second__td"><h3><%=dto.getAge() %></h3></td>  
	         </tr>
	         <tr>		
	         		<td class="first__td"><h3>보호자 연락처</h3></td>
	         		<td class="second__td"><h3><%=dto.getOfficetel() %></h3></td>
	         </tr>
	         <tr>		
	         		<td class="first__td"><h3>특이사항</h3></td>
	         		<td class="second__td"><h3><%=dto.getSpecialmark() %></h3></td>
	         </tr>
	         </div>
		</table>
	   	</main>			 
	</div>
</body>
</html>
