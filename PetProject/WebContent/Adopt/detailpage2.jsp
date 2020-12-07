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
	  	 <table style="width: 1000px;">
	      <tr>
	         <td class="photo" rowspan="6">
	               <img src=<%=dto.getPopfile()%> style="max-width: 300px; " >       
	       </tr>
	        <tr>
	         		<td>견종 : <%=dto.getKindcd()%></td>
	         </tr>
	         <tr>		
	         		<td>성별 : <%=dto.getSexCd()%></td>   
	         </tr>
	           <tr>		
	         		<td>중성화 여부 : <%=dto.getNeuteryn() %></td>
	         </tr>
	         <tr>		  
	         		<td>나이 : <%=dto.getAge() %></td>  
	         </tr>
	         <tr>		
	         		<td>보호자 연락처 <%=dto.getOfficetel() %></td>
	         </tr>

	         <tr>		
	         		<td><pre>특이사항 : <%=dto.getSpecialmark() %></pre></td>
	         </tr>
	</table>
	   	</main>			 
	</div>
</body>
</html>