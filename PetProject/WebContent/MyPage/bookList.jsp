<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dao.AccountDao"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.BookDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.BookDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강내역 상세보기</title>
<style type="text/css">

h4{
 font-size: 19px;
 line-height: 1.375em;
 color: #303030;
 font-weight: 400;
 margin-bottom: 30px;
}
table {
  border: 1px solid #eee;
  border-bottom: 2px solid #00cccc;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.10),
     0px 5px 10px rgba(0,0,0,0.05),
     0px 10px 10px rgba(0,0,0,0.05),
     0px 20px 10px rgba(0,0,0,0.05);
  }
  th, td {
    border: 1px solid #eee;
  }
  
 .acc__btn-write {
 	background-color: #ff8e00;
 }
 
 .acc__btn-show {
 	background-color: #EAEAEA;
 }
  
}
</style>


<script type="text/javascript">

</script>
<%

String id=(String)session.getAttribute("myId");

UserDao udao=new UserDao();
String user_num=udao.getNum(id);

BookDao bdao=new BookDao();
List<HashMap<String,String>> clist = bdao.getCurrentBook(user_num);
List<HashMap<String,String>> plist = bdao.getPastBook(user_num);
String book_num=bdao.getBook(user_num);

ReviewDao rdao=new ReviewDao();
int cnt=rdao.isReviewCheck(user_num);


	
	
%>

</head>
<body>
<div id="acc_booklist">
	<h4><b>현재 진행 중인 훈련들</b></h4>
	<table class="table table-bordered" style="width:900px;">
	<tr bgcolor="#ffc400">
		<td style="width:60px;" align="center">예약넘버</td>
		<td style="width:100px;" align="center">애견명</td>
		<td style="width:100px;" align="center">센터명</td>
		<td style="width:120px;" align="center">예약코스</td>
		<td style="width:120px;" align="center">시작일</td>
		<td style="width:120px;" align="center">종료일</td>
	</tr>
	
	
	<%
	
	for(HashMap<String,String> map:clist)
		{%>
		<tr bgcolor="white">
		<td style="width:60px;" align="center" name="book_num"><%=map.get("book_num")%></td>
		<td style="width:100px;" align="center" name="accName"><%=map.get("acc_name")%></td>
		<td style="width:100px;" align="center" name="bookCenter"><%=map.get("petcenter")%></td>
		<td style="width:120px;" align="center" name="bookSelect"><%=map.get("petselect")%></td>
		<td style="width:120px;" align="center" name="bookStartDay"><%=map.get("startday")%></td>
		<td style="width:120px;" align="center" name="bookEndDay"><%=map.get("endday")%></td>
		</tr>
	<%
	}
	%>
	</table>
<br>
<br>

	<h4><b>수강완료된 훈련들</b></h4>
	<table class="table table table-bordered" style="width:900px;">
	<tr bgcolor="#ffc400">
		<td style="width:100px;" align="center">예약넘버</td>
		<td style="width:100px;" align="center">애견명</td>
		<td style="width:80px;" align="center">센터명</td>
		<td style="width:100px;" align="center">예약코스</td>
		<td style="width:100px;" align="center">시작일</td>
		<td style="width:100px;" align="center">종료일</td>
		<td style="width:80px;" align="center">후기</td>
	</tr>
	
	<%
	for(HashMap<String,String> map:plist)
		{%>
		<tr bgcolor="white">
		<input type="hidden" name="user_num" value="<%=map.get("user_num")%>">
		<td style="width:100px;" align="center" name="book_num"><%=map.get("book_num")%></td>
		<td style="width:100px;" align="center" name="accName"><%=map.get("acc_name")%></td>
		<td style="width:80px;" align="center" name="bookCenter"><%=map.get("petcenter")%></td>
		<td style="width:100px;" align="center" name="bookSelect"><%=map.get("petselect")%></td>
		<td style="width:100px;" align="center" name="bookStartDay"><%=map.get("startday")%></td>
		<td style="width:100px;" align="center" name="bookEndDay"><%=map.get("endday")%></td>
			<%
			if(cnt==0){
			%>
			<td>
			<button type="button" class="acc__btn-write button" onclick="location.href='index.jsp?main=Review/reviewForm.jsp'">후기쓰기</button>
			</td>
			<%}else{%>
			<td><button type="button" class="acc__btn-show button" onclick="location.href='MyPage/reviewRead.jsp'">내글보기</button>
			</td>
			<%}%>
			</tr>
		<%}
	%>
	</table>
</div>


</body>
</html>
