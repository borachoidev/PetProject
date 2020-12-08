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
	#abandon__detail {
		margin-top: 5%;
	}

	#adopt__container{
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		width: 70vw;
	}
	
	.adopt__abandon-photo {
		width: 45%;
		margin: 2%;
	}
	
	.adopt__abandon-photo img {
		width: 100%;
	}
	
	.adopt__abadon-tb {
		width: 45%;
		margin: 2%;
		font-size: 1.2em;
	}
	
	.first__td {
		text-align: center;
		white-space: nowrap;
	}
	
	.first__td,.second__td {
		padding: 2%;
	}
	
	.adopt__info {
		padding: 2%;
	}
	
	.abandon__list-btn {
		align-self: center;
		width: 20%;
		margin: 2% 40%;
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
	  	<main id="adopt__container">	
			 <div class="adopt__abandon-photo">
	               <img src=<%=dto.getPopfile()%>>
			</div>
	       <div class="adopt__abadon-tb">
				<table class="table table-bordered" id="abandon__table">
		        <tr>
		         		<td class="first__td"> 견종 </td>
		         		<td class="second__td"> <%=dto.getKindcd().replace("[개]","")%> </td>
		         </tr>
		          <tr>
		         		<td class="first__td"> 모색</td>
		         		<td class="second__td"> <%=dto.getColorcd() %></td>
		         </tr>
		         <tr>		
	         	<td class="first__td">성별</td>
				<td class="second__td"><%
			         if(dto.getSexCd().equals("M")){
			        %>수컷
			        <%}else{%>암컷
			        <%}
			          %><%=dto.getNeuteryn().equals("Y")?"(중성화 완료)":"(중성화 미완료)"%></td>
		         </tr>
		         <tr>		  
		         		<td class="first__td"> 나이 </td>
		         		<td class="second__td"> <%=dto.getAge() %> </td>  
		         </tr>
		         <tr>		
		         		<td class="first__td" style="vertical-align: middle;"> 특이사항 </td>
		         		<td class="second__td"> <%=dto.getSpecialmark() %> </td>
		         </tr>
		         <tr>		
		         		<td class="first__td"> 보호소</td>
		         		<td class="second__td"> <%=dto.getCareNm() %> </td>
		         </tr>
		         <tr>		
		         		<td class="first__td">연락처 </td>
		         		<td class="second__td"> <%=dto.getOfficetel() %> </td>
		         </tr>
		         <tr>		
		         		<td class="first__td">보호소 주소 </td>
		         		<td class="second__td"> <%=dto.getCareaddr() %> </td>
		         </tr>
		      
			</table>
         </div>
	   	</main>	
	   	<div class="adopt__info">
		   	<h5>입양절차</h5>
		   	<span>
		   	펫앤미에서는 매일 보호중인 아이들을 소개합니다. 입양관련사항에 대해서는 해당 보호소 담당자에게 문의해주세요.
		   	</span>
	   	</div>	
	   	<button class="button medium abandon__list-btn" onclick="location.href='index.jsp?main=Adopt/abandonlist.jsp'">목록으로</button>		 
	</div>
</body>
</html>
