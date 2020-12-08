
<%@page import="data.dto.UserDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.userlist{
width:68%;

}
ul{
list-style-type: none;}

.change-lvl ,.user__detail {
 /*  position: absolute;  */
display: none;
}

.userlist__tb{
margin-top:5%;
width:100%;
display: flex;
flex-direction:column;
justify-content: center;
align-items: center;
}
caption {
	caption-side: top;
	color: black;
}
</style>
<script type="text/javascript">
$(function(){
	$(document).on("click",".userLvl", function() {
		$(this).siblings(".change-lvl").toggle();
	});	
	
	$(document).on("click",".lvl__change-btn", function() {	
		var num=$(this).siblings(".user__level").attr("num");
		var lvl=$(this).siblings(".user__level").val();
		$.ajax({
			dataType:"html",
			data:{
				"num":num,
				"lvl":lvl
			},
			type:"post",
			url:"Admin/changeLevel.jsp",
			success:function(){
				location.reload();
			}
		})
	});
	$(document).on("click",".detail-btn",function() {
		$(this).parents("tr").next(".user__detail").toggle();
		$(this).parents("tr").next().next(".user__detail").toggle();
	});	
	
	
	$(document).on("click",".user__delete-btn",function() {
		var num=$(this).siblings().val();
		 var check= confirm("정말로 탈퇴하시겠습니까?");
   	  if(check){
   		location.href="Admin/deleteUserAction.jsp?num="+num;	  
   	  }else{
   		  location.href="index.jsp?main=Admin/memberList.jsp";
   	  }
     })
	});	



</script>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<% UserDao dao =new UserDao();
List<UserDto> list=dao.getAllUsers();
%>
<body>
<div class="userlist__tb">

<table class="table userlist">
<caption><h3>회원목록</h3></caption>
<%
for(UserDto a : list){
if(!a.getId().equals("admin")){%>
	<tr>
		<th><%=a.getId()%></th>
		
		
		<th><%=a.getUser_name()%></th>
		<th><%=a.getLvl()==1?"분양회원":"일반회원"%></th>
		<td>
			<button class="detail-btn button">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
				  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
				</svg>
			</button>
		</td>
		</tr>
	<tr class="user__detail">
		<td><%=a.getEmail()%></td> 
		<td><%=a.getHp()%></td>
		<td colspan="2"><%=a.getZipcode()==null?"등록주소 없음":a.getZipcode()+"\t"%>
		<%=a.getRoad_addr()==null?"":a.getRoad_addr() +"\t"%>
		<%=a.getDetail_addr()==null?"":a.getDetail_addr()%></td>
	</tr>
	<tr class="user__detail">
		<td colspan="2">
		</td>
		<td>
		<span class="userLvl">회원등급변경</span>
		<div class="change-lvl">
			<select class="user__level" num="<%=a.getUser_num()%>">
					<option disabled selected>등급선택</option>
					<option value="0">일반회원</option>
					<option value="1">분양회원</option>	
			</select>
			<button type="button" class="lvl__change-btn button">수정</button>
		</div>
		</td>
		<td>
			<input type="hidden" value="<%=a.getUser_num()%>" class="userNum">
			<button type="button" class="user__delete-btn button">회원강퇴</button>
		</td>
	</tr>
	
<% }}
%>
</table>
</div>
</body>
</html>










