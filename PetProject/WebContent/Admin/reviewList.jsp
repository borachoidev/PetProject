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
	
%>

</head>
<body>
<div id="acc__review-list">
	<h4><b>후기글 목록</b></h4>
	<table class="table table-bordered" style="width:900px;">
	<tr bgcolor="#ffc400">
		<td style="width:100px;" align="center">리뷰넘버</td>
		<td style="width:100px;" align="center">제목</td>
		<td style="width:100px;" align="center">내용</td>
		<td style="width:120px;" align="center">쓴날짜</td>
		<td style="width:120px;" align="center">아이디</td>
		<td style="width:120px;" align="center">예약번호</td>
		<td style="width:60px;" align="center">삭제</td>
	</tr>
	
	
	<%
	
	for(ReviewDto dto:list)
	{%>
	<tr bgcolor="white">
	<td style="width:100px;" align="center" name="review_num"><%=dto.getReview_num()%></td>
	<td style="width:100px;" align="center" name="ReTitle"><%=dto.getTitle()%></td>
	<td style="width:100px;" align="center" name="ReContent"><%=dto.getContent()%></td>
	<td style="width:120px;" align="center" name="ReWriteday"><%=dto.getWriteday()%></td>
	<td style="width:120px;" align="center" name="ReId"><%=dto.getId()%></td>
	<td style="width:60px;" align="center" name="ReBook_Num"><%=dto.getBook_num()%></td>
	<td><button type="button" review_num="<%=dto.getReview_num()%>" class="Review__delete-btn button">삭제</button></td>
	</tr>
	<%
	}
	%>
	</table>

</div>
<script type="text/javascript">

$(".Review__delete-btn").click(function () {
	var review_num=$(this).attr(review_num);
	var check = confirm("후기를 삭제 하시겠습니까?");
	if(check){
		location.href="MyPage/deleteReviewAction.jsp?num="+review_num;
	}else{
		location.href="index.jsp?main=Admin/reviewList.jsp";
	}
});
</script>
</body>
</html>