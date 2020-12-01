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
<title>애견 등록하기</title>
</head>
<body>
<%


	String id=(String)session.getAttribute("myId");
	
	UserDao udao=new UserDao();
	String user_num=udao.getNum(id);

	
	
%>
<div class="acc__add-form">
	<form action="MyPage/accAddAction.jsp" method="post" enctype="multipart/form-data"
	class="form-inline">
	<input type="hidden" name="user_num" value="<%=user_num%>">

	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>애견이름</b></td>
			<td><input type="text" name="accName" class="form-control" style="width: 400px;" required="required">
			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>견종선택</b></td>
			<td><select name="accBreed" required="required">
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
			<td><input type="text" name="accWeight" class="form-control" style="width: 100px;">
			KG</td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>나이</b></td>
			<td><input type="text" name="accAge" class="form-control" style="width: 100px;">년 (1년 미만일 시 0으로 기입)
			<!-- <input type="text" name="accAge_2" class="form-control" style="width: 100px;">개월 -->
			</td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
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
			<td style="width: 150px;background-color:#66cdaa;">
			<b>사진</b></td>
			<td>
			<div class="form-group">
				<input type="file" name="accPhoto"
				style="width:250px;" class="form-control" required="required">
			</div>
			<div class="acc__addfile"></div>
			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>소개글</b></td>
			<td>
				<textarea name="accMemo"
				style="width:400px;height: 150px;"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="acc__btn btn-info"
				style="width:100px;">저장하기</button>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>