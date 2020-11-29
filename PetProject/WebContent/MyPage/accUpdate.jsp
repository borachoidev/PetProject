<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

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


	
	
	
	
%>
<div class="acc__update-form">
	<form action="mypage/accAddAction.jsp" method="post" enctype="multipart/form-data"
	class="form-inline">
	
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>애견이름</b></td>
			<td><input type="text" name="accName" class="form-control" style="width: 400px;" required="required">
			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>견종</b></td>
			<td><span class="acc__breed">
      		<input type="radio" name="accBreed" value="poodle">푸들
      		<input type="radio" name="accBreed" value="pomeranian">포메
      		<input type="radio" name="accBreed" value="goldenretriever">골든리트리버
      		<input type="radio" name="accBreed" value="jindo"checked>진돗개
      		<input type="radio" name="accBreed" value="mixed">믹스견
      		<input type="radio" name="accBreed" value="other">기타
  			</span></td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>무게</b></td>
			<td><input type="text" name="accWeight" class="form-control" style="width: 400px;">
			</td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>나이</b></td>
			<td><input type="text" name="accAge" class="form-control" style="width: 400px;">
			</td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>성별</b></td>
			<td>
			<input type="radio" name="accGender" value="male">수컷
      		<input type="radio" name="accGender" value="female">암컷
      		<input type="radio" name="accGender" value="maleneutral">수컷(중성화)
      		<input type="radio" name="accGender" value="femaleneutral" checked>암컷(중성화)
  			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>사진</b></td>
			<td>
			<div class="form-group">
				<input type="file" name="accPhoto"
				style="width:250px;" class="form-control" required="required">
			</div>
			<div class="addfile"></div>
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
				style="width:100px;">수정하기</button>
		</tr>
	</table>
	</form>
</div>
</body>
</html>