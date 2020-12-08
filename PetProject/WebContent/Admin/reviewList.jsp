<%@page import="data.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강내역 상세보기</title>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  
  color: #333;
}

table {
  text-align: left;
  line-height: 20px;
  border-collapse: separate;
  border-spacing: 0;
  border: 2px solid #ed1c40;
  width: 600px;
  margin: 40px auto;
  border-radius: .25rem;
}

thead tr:first-child {
  background: #ed1c40;
  color: #fff;
  border: none;
}


th {
  font-weight: 500;
}

thead tr:last-child th {
  border-bottom: 3px solid #ddd;
}

tbody tr:hover {
  background-color: #f2f2f2;
  cursor: default;
}

tbody tr:last-child td {
  border: none;
}

tbody td {
  border-bottom: 1px solid #ddd;
}

td:last-child {
 
  padding-right: 10px;
}

.button {
  color: #aaa;
  cursor: pointer;
  vertical-align: middle;
  margin-top: -4px;
}

.edit:hover {
  color: #0a79df;
}

.delete:hover {
  color: #dc2a2a;
}


 .acc__btn-write {
 	background-color: #ff8e00;
 }
 
 .acc__btn-show {
 	background-color: #EAEAEA;
 }
  
}
</style>


<%

String id=(String)session.getAttribute("myId");

UserDao udao=new UserDao();
String user_num=udao.getNum(id);

ReviewDao rdao=new ReviewDao();
List<ReviewDto> list=rdao.getAllReview();
int tot=rdao.getTotalCount();
%>

</head>
<body>
<div id="acc__review-list">
<br><br>
	<h4><b>후기글 목록</b></h4>
	<table class="table table-bordered" style="width:1000px;">
	<tr bgcolor="#ffc400">
		<td style="width:80px;" align="center">리뷰넘버</td>
		<td style="width:80px;" align="center">예약번호</td>
		<td style="width:120px;" align="center">아이디</td>
		<td style="width:120px;" align="center">제목</td>
		<td style="width:220px;" align="center">내용</td>
		<td style="width:120px;" align="center">쓴날짜</td>
		
		
		<td style="width:50px;" align="center">삭제</td>
	</tr>
	<%
	if(tot==0){%>
	<tr bgcolor="white">
 				<td colspan="6" align="center">
 				<b>등록된 후기가 없습니다!</b>
 				</td>
 			</tr>
 		<%} %>
	<%
	
	for(ReviewDto dto:list)
	{%>
	<tr bgcolor="white">
	<td style="width:80px;" align="center" name="review_num"><%=dto.getReview_num()%></td>
	<td style="width:80px;" align="center" name="ReBook_Num"><%=dto.getBook_num()%></td>
	<td style="width:120px;" align="center" name="ReId"><%=dto.getId()%></td>
	<td style="width:120px;" align="center" name="ReTitle"><%=dto.getTitle()%></td>
	<td style="width:220px;" align="center" name="ReContent"><div style="overflow:hidden;width:220px"><%=dto.getContent()%><div></div></td>
	<td style="width:120px;" align="center" name="ReWriteday"><%=dto.getWriteday()%></td>
	
	
	<td>
	<input type="hidden" value="<%=dto.getReview_num()%>" class="review_num">
	<button type="button" class="Review__delete-btn button">삭제</button></td>
	</tr>
	<%
	}
	%>
	</table>

</div>
<script type="text/javascript">
$(document).on("click",".Review__delete-btn",function(){
	var num=$(this).siblings().val();
	var check = confirm("이 글을 삭제 하시겠습니까?");
	if(check){
		location.href="Admin/deleteReviewAction.jsp?num="+num;
	}else{
		location.href="index.jsp?main=Admin/reviewList.jsp";
	}
});
</script>
</body>
</html>