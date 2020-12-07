<%@page import="data.dao.AccountDao"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--general stylesheet-->
<style type="text/css">
textarea.acc__memo{
resize: none;
width:30vw;
height:20vh;
}

.acc__add-form {
	margin-top: 5%;
}

</style>
<title>애견 등록하기</title>
</head>
<body>
<%


	String id=(String)session.getAttribute("myId");
	
	UserDao udao=new UserDao();
	String user_num=udao.getNum(id);
	
	
	AccountDao adao=new AccountDao();
	int cnt=adao.countDefault(user_num);
	
	
%>
<div class="acc__add-form">
	<form action="MyPage/accAddAction.jsp" method="post" enctype="multipart/form-data"
	class="form-inline">
	<input type="hidden" name="user_num" value="<%=user_num%>">
	
	<%
	
		if(cnt==0)
		{%>
			<input type="hidden" name="sel_acc" value="1">
		<%}else{%>
			<input type="hidden" name="sel_acc" value="0">
		<%}
	
	%>
	

	<table class="table" ">
		<tr>
			<td ">
			<b>애견이름</b></td>
			<td><input type="text" name="accName" class="all__form" style="width: 400px;" required="required">
			</td>
		</tr>
		<tr>
			<td>
			<b>견종선택</b></td>
			<td><select name="accBreed" required="required">
			<option disabled selected>견종을 선택해 주세요</option>
      		<option value="푸들">푸들</option>
      		<option value="비숑">비숑</option>
      		<option value="포메라니언">포메라니언</option>
      		<option value="퍼그">퍼그</option>
      		<option value="골든리트리버">골든리트리버</option>
      		<option value="허스키">허스키</option>
      		<option value="진돗개">진돗개</option>
      		<option value="믹스견">믹스견</option>
      		<option value="기타">기타</option>
  			</select></td>
		</tr>
		<tr>
			<td>
			<b>무게</b></td>
			<td><input type="text" name="accWeight" class="all__form" style="width: 100px;">
			KG</td>
		</tr>
		
		<tr>
			<td>
			<b>나이</b></td>
			<td><select name="accAge">
			<option disabled selected>나이를 선택해 주세요</option>
      		<option value="0~6개월">0~6개월미만</option>
      		<option value="6개월~1년">6개월~1년미만</option>
      		<option value="1년~2년">1년~2년미만</option>
      		<option value="2년~3년">2년~3년미만</option>
      		<option value="3년~4년">3년~4년미만</option>
      		<option value="4년~5년">4년~5년미만</option>
      		<option value="5년~6년">5년~6년미만</option>
      		<option value="6년~7년">6년~7년미만</option>
      		<option value="7년 이상">7년 이상</option>
      		<option value="10년 이상">10년 이상</option>
  			</select></td>
		
		</tr>
		<tr>
			<td>
			<b>성별</b></td>
			<td><select name="accGender" required="required">
			<option disabled selected value>성별을 선택해주세요</option>
			<option value="수컷">수컷</option>
			<option value="암컷">암컷</option>
			<option value="수컷(중성화)">수컷(중성화)</option>
			<option value="암컷(중성화)">암컷(중성화)</option>
  			</select></td>
		</tr>
		<tr>
			<td>
			<b>사진</b></td>
			<td>
			<div class="form-group">
				<input type="file" name="accPhoto"
				style="width:250px;" class="all__form" required="required">
			</div>
			</td>
		</tr>
		<tr>
			<td >
			<b>소개글</b></td>
			<td>
				<textarea name="accMemo"
				class="acc__memo"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="acc__btn button"
				style="width:100px;">저장하기</button>
			</td>
		</tr>

	</table>
	</form>
</div>
</body>
</html>