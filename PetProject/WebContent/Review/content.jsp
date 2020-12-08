<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>

<%@page import="java.io.File"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.review__content img{
max-width: 200px;

}

#review__container {
	width: 60vw;
	margin-top: 5%;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String myid=(String)session.getAttribute("myId");
	String num=request.getParameter("num");	
	String pageNum=request.getParameter("pageNum");
	ReviewDao db=new ReviewDao();
	//번호에 해당하는 dto 가져오기
	ReviewDto dto=db.getData(num);
	System.out.println(dto.getId());
	
%>
<div id="review__container">
<table class="table">
	<tr>
		<td width="350">
			<b><%=dto.getTitle()%></b>
		</td>
		<td align="right">
			<span style="color: #ccc;font-size: .9em;">
			<%=dto.getWriteday() %></span>
		</td>
	</tr>
	<tr height="350">
		<td colspan="2" valign="top" style="padding:2%;">
			<b><%=dto.getId()%></b>
			<br><br>			
			<pre class="review__content"><%=dto.getContent()%></pre>	
		</td>
	</tr>
	<tr>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<%if(myid!=null&&dto.getId().equals(myid)){ %>
			<button type="button"  class="button"
			  onclick="location.href='Review/deleteReview.jsp?reviewNum=<%=dto.getReview_num() %>&pageNum=<%=pageNum%>'">삭제</button>	
			<% }%>
			<button type="button" class="button"
			  onclick="location.href='index.jsp?main=Review/reviewMain.jsp?pageNum=<%=pageNum%>'">글목록</button>	
		</td>
	</tr>	
</table>
</div>	
</body>
</html>




