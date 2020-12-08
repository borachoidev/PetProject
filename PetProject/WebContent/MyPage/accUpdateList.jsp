<%@page import="data.dto.AccountDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.AccountDao"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#myPage__container {
	margin-top: 5%;
	align-content: center;
}

.avatar{
width:80px;
height:80px;
overflow:hidden;
display: flex;
align-items: center;
justify-content: center;
border-radius: 100px;
}
.avatar img{
max-width:80px;
}

.myPage__table td,.myPage__table tr{
text-align: center;
white-space: nowrap;
}

.acc__acc-del{
border: none;
white-space: nowrap;
}

.myPage__update-title {
	display: flex;
	justify-content: space-between;
	flex-direction: row;
	flex-wrap: nowrap;
	
}

.myPage__add-btn {
	border: none;
	background-color:#ff8e00;
	white-space: nowrap; 
}

.acc__set-default {
	white-space: nowrap;
}

</style>


<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$(document).on("click","a.acc_dogdetail", function() {	
		var dog_num=$(this).attr("dog_num");
		location.href="index.jsp?main=MyPage/accUpdate.jsp?dog_num="+dog_num;
	});
	
	
	$(document).on("click",".acc__set-default", function() {
		var user_num=$(this).attr("user_num");
		var dog_num=$(this).attr("dog_num2");
		
		$.ajax({
			dataType:"html",
			data:{
				"dog_num":dog_num,	
				"user_num":user_num
			},
			type:"post",
			url:"MyPage/accDefault.jsp",
			success:function(){
				
				 location.reload();
			}
		});
	
});
});

</script>
<%

	String id=(String)session.getAttribute("myId");
	
	UserDao udao=new UserDao();
	String user_num=udao.getNum(id);
	
	
	AccountDao adao=new AccountDao();
	List<AccountDto> alist=adao.getAllAccounts(user_num);
	String accId=adao.getDefault(id);
	if(accId==null||accId.equals(""))
	{
		accId="no";
	}
	session.setAttribute("accId", accId);
	
%>

</head>
<body>


<div id="myPage__container">
	<header class="myPage__update-title">
		<h4><b>반려견 계정 관리</b></h4>
		<a href="index.jsp?main=MyPage/accAdd.jsp">
			<button class="myPage__add-btn">+ 반려견 등록</button>
		</a>
	</header>	
	<table class="myPage__table table">
	<tr>
		<td align="center">이름</td>
		<td align="center">견종</td>
		<td align="center">성별</td>
		<td align="center">계정설정</td>
		<td align="center">계정삭제</td>
	</tr>
	
	<%
	for(AccountDto dto:alist)
		{%>
		<input type="hidden" name="dog_num" id="dog_num" value="<%=dto.getDog_num()%>">
		<tr bgcolor="white">
		<td align="center"> <a dog_num="<%=dto.getDog_num()%>" style="cursor:pointer;vertical-align: middle;"   name="accName" class="acc_dogdetail"><b><%=dto.getAcc_name()%></b>
		<div class="avatar"><img src="AccSave/<%=dto.getPhoto()%>" align="center"></div></a></td>
		<td style="vertical-align: middle;" align="center" name="accBreed"><%=dto.getBreed()%></td>
		<td style="vertical-align: middle;" align="center" name="accGender"><%=dto.getGender()%></td>
		<input type="hidden" id="sel_acc" name="sel_acc" value="<%=dto.getSel_acc()%>">
		<%if(dto.getSel_acc()==0){ %>
		<td style="vertical-align: middle;" align="center">
			<button dog_num2="<%=dto.getDog_num()%>" user_num="<%=dto.getUser_num()%>" type="button" class="acc__set-default button" >메인으로</button>
		</td>
		<%}else{%>
		<td id="acc_sel-defaultAcc" style="vertical-align: middle;">
			메인
		</td>
		<%} %>
		<td style="vertical-align: middle;">
		<button type="button" class="acc__acc-del" onclick="location.href='MyPage/accDelete.jsp?dog_num=<%=dto.getDog_num()%>'">삭제하기</button>
		</td>
		</tr>
	<%
	}
	%>
	</table>
	
</div>


</body>
</html>