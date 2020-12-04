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
.table2 {
	position: absolute;
	bottom:0px;
}

</style>



<script type="text/javascript">
</script>
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("myId");


BookDao bdao=new BookDao();
List<BookDto> blist=bdao.getUserBook();

	
	
%>

</head>
<body>
<div id="acc_booklist-current">
	<h4><b>현재 진행 중인 훈련들</b></h4>
	<table class="table table-bordered" style="width:900px;">
	<tr bgcolor="#66cdaa">
		<td style="width:60px;" align="center">예약넘버</td>
		<td style="width:100px;" align="center">센터명</td>
		<td style="width:120px;" align="center">애견이름</td>
		<td style="width:120px;" align="center">시작일</td>
		<td style="width:120px;" align="center">종료일</td>
	</tr>
	
	<!-- subString, toString -->
	<%for(BookDto dto:blist)
	{%>
	
		<input type="hidden" name="dog_num" id="dog_num" value="">
		<tr bgcolor="white">
		<td style="width:60px;" align="center" name="bookNum">bookNum</td>
		<td style="width:100px;" align="center" name="bookCenter">bookCenter</td>
		<td style="width:120px;" align="center" name="accName">accName</td>
		<td style="width:120px;" align="center" name="bookStartDay">bookStartDay</td>
		<td style="width:120px;" align="center" name="bookEndDay">bookEndDay</td>
		</tr>
	<%
	}
	%>
	</table>
</div>
<br>
<br>
<div id="acc_booklist-past">
	<h4><b>수강완료된 훈련들</b></h4>
	<table class="table2 table table-bordered" style="width:900px;">
	<tr bgcolor="#66cdaa">
		<td style="width:60px;" align="center">예약넘버</td>
		<td style="width:100px;" align="center">센터명</td>
		<td style="width:120px;" align="center">애견이름</td>
		<td style="width:120px;" align="center">시작일</td>
		<td style="width:120px;" align="center">종료일</td>
		<td style="width:120px;" align="center">후기</td>
	</tr>
	
	<!-- for(BookDto dto:blist) -->
		
		<input type="hidden" name="dog_num" id="dog_num" value="">
		<tr bgcolor="white">
		<td style="width:60px;" align="center" name="bookNum">bookNum</td>
		<td style="width:100px;" align="center" name="bookCenter">bookCenter</td>
		<td style="width:120px;" align="center" name="accName">accName</td>
		<td style="width:120px;" align="center" name="bookStartDay">bookStartDay</td>
		<td style="width:120px;" align="center" name="bookEndDay">bookEndDay</td>
		<td style="width:120px;" align="center">
			<button user_num="" type="button" class="book__2 btn btn-danger btn-sm" >후기쓰기</button>
			<!-- <button dog_num2="" type="button" class="book__1 btn btn-danger btn-sm" 
			onclick="index.jsp?main=MyPage/reviewList.jsp?dog_num='">내글보기</button> -->
		</td>
		</tr>

	</table>
</div>


</body>
</html>
