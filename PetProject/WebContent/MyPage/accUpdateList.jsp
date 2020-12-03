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
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$(document).on("click","a.acc_dogdetail", function() {	
		var dog_num=$(this).attr("dog_num");
		location.href="index.jsp?main=MyPage/accUpdate.jsp?dog_num="+dog_num;
	});
	
	//강아지계정 sel_acc를 0->1로 바꿔주기 (현재 고민중인것은 어찌 updateDefaultAll (dao)를 활용할 것인가)
	$(document).on(".acc__sel-acc", function() {	
		var dog_num=$("#dog_num").val();
		
		
		$.ajax({
			dataType:"html",
			data:{
				"dog_num":dog_num,
				
			},
			type:"post",
			url:"MyPage/accDefault.jsp",
			success:function(){
				location.reload();
			}
		})
	});
	

});




</script>
<%

	String id=(String)session.getAttribute("myId");
	
	UserDao udao=new UserDao();
	String user_num=udao.getNum(id);
	
	
	AccountDao adao=new AccountDao();
	List<AccountDto> alist=adao.getAllAccounts(user_num);
	
	
%>

</head>
<body>


<div id="acc_update-list">
	<caption><b>내 강아지 명단</b></caption>
	<table class="table table-bordered" style="width:600px;">
	<tr bgcolor="#66cdaa">
		<td style="width:100px;" align="center">강아지 이름</td>
		<td style="width:100px;" align="center">견종</td>
		<td style="width:100px;" align="center">성별</td>
		<td style="width:100px;" align="center">메인강아지로 설정</td>
		<td style="width:100px;" align="center">강아지 계정삭제</td>
	</tr>
	
	<%
	for(AccountDto dto:alist)
		{%>
		<tr bgcolor="">
		<input type="hidden" name="dog_num" id="dog_num" value="<%=dto.getDog_num()%>">
		<td> <a dog_num="<%=dto.getDog_num()%>" style="width:100px;cursor:pointer;" align="center" name="accName" class="acc_dogdetail"><%=dto.getAcc_name()%></a></td>
		<td style="width:100px;" align="center" name="accBreed"><%=dto.getBreed()%></td>
		<td style="width:100px;" align="center" name="accGender"><%=dto.getGender()%></td>
		<input type="hidden" id="sel_acc" name="sel_acc" value="<%=dto.getSel_acc()%>">
		<%if(dto.getSel_acc()==0){ %>
		<td style="width:100px;" align="center">
			<button type="button" class="acc__sel-acc btn btn-danger btn-sm">기본으로</button>
		</td>
		<%}else{%>
			<td style="width:100px;" align="center" id="acc_sel-acc-default">
			기본강아지
		</td>
		<%} %>
		<td>
		<button type="button" class="acc__acc-del btn btn-info"
		style="width:100px;" onclick="location.href='MyPage/accDelete.jsp?dog_num=<%=dto.getDog_num()%>'">삭제하기</button>
		</td>
		</tr>
	<%
	}
	%>
	</table>
	<button type="button" class="btn btn-default" style="width:100px;"
	onclick="history.back()">돌아가기</button>
</div>

</body>
</html>