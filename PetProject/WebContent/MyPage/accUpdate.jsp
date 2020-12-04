<%@page import="java.util.List"%>
<%@page import="data.dto.AccountDto"%>
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
* {
	padding: 0px;
	margin: 0px;
	font-family: 'Noto Sans KR';
}

</style>
<title>애견 정보들 수정하기</title>
<%
	String id=(String)session.getAttribute("myId");

	UserDao udao=new UserDao();
	String user_num=udao.getNum(id);
	
	String dog_num=request.getParameter("dog_num");
	
	AccountDao adao=new AccountDao();
	AccountDto dto=adao.getDogData(dog_num);
	
	
	
%>

<script type="text/javascript">
$(function() {
	  $("#accBreed").val("<%=dto.getBreed()%>");
	  $("#accAge").val("<%=dto.getAge()%>");
	  $("#accGender").val("<%=dto.getGender()%>");
	  $("#sel_acc").val("<%=dto.getSel_acc()%>");
	  
	  $('#accBreed').change(function() {
		    $(this).val();
		});
		$('#accAge').change(function() {
		    $(this).val();
		});
		$('#accGender').change(function() {
		    $(this).val();
		});
		
	});
</script>
</head>
<body> 


<div class="acc__update-form">
	<form action="MyPage/accUpdateAction.jsp" method="post" enctype="multipart/form-data"
	class="form-inline">
		<input type="hidden" name="user_num" value="<%=dto.getUser_num()%>">
		<input type="hidden" name="dog_num" value="<%=dto.getDog_num()%>">
		<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td style="width: 120px;background-color:#66cdaa;">
			<b>애견이름(변경불가)</b></td>
			<td><input type="text" name="accName" class="form-control" style="width: 400px;" value="<%=dto.getAcc_name()%>" disabled>
			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>견종선택</b></td>
			<td><select name="accBreed" id="accBreed" required="required" >
			<option disabled selected value>견종을 선택해 주세요</option>
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
			<td style="width: 80px;background-color:#66cdaa;">
			<b>무게</b></td>
			<td><input type="text" name="accWeight" class="form-control" style="width: 100px;" value=<%=dto.getWeight()%>>
			KG</td>
		</tr>
		
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>나이</b></td>
			<td><select name="accAge" id="accAge">
			<option disabled selected value>나이를 선택해 주세요</option>
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
			<td style="width: 80px;background-color:#66cdaa;">
			<b>성별</b></td>
			<td><select name="accGender" id="accGender" required="required">
			<option disabled selected value>성별을 선택해주세요</option>
			<option value="수컷">수컷</option>
			<option value="암컷">암컷</option>
			<option value="수컷(중성화)">수컷(중성화)</option>
			<option value="암컷(중성화)">암컷(중성화)</option>
  			</select></td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>메인유무</b></td>
			<td><select name="sel_acc" id="sel_acc" disabled>
			<option disabled selected value>메인선택</option>
			<option value=0>일반계정</option>
			<option value=1>메인계정</option>
  			</select></td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>사진</b></td>
			<td>
			<div class="form-group">
				<input type="file" name="accPhoto"
				style="width:250px;" class="form-control" required="required" <%=dto.getPhoto()%>>
			</div>
			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>소개글</b></td>
			<td>
				<textarea name="accMemo"
				style="width:400px;height: 150px;"><%=dto.getMemo()%></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="acc__update btn btn-info"
				style="width:100px;">수정하기</button>
				<button type="button" class="btn btn-default"
				style="width:100px;" onclick="history.back()">돌아가기</button>
			</td>
		</tr>
	</table>
	
	</form>
</div>
</body>
</html>