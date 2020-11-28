<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 인덱스를 통해 아직 들어갈 수 없어서 테스트겸 붙혀놓았으니 나중에 뺌 -->
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<!-- Bootstrap -->
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
   integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
   integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Bungee+Inline&family=Bungee+Shade&family=Do+Hyeon&family=Press+Start+2P&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<!--general stylesheet-->
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
	font-family: 'Noto Sans KR';
}
</style>
<title>강아지 등록하기</title>
</head>
<body>
<div class="accAddform">
	<form action="databoard/datawriteaction.jsp" method="post" enctype="multipart/form-data"
	class="form-inline">
	<!-- hidden -->
	<input type="hidden" name="" value="">
	
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>애견이름</b></td>
			<td><input type="text" name="dogName" class="form-control" style="width: 400px;">
			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>견종</b></td>
			<td><span class="breeds">
      		<input type="radio" name="poodle" value="poodle">푸들
      		<input type="radio" name="pome" value="pomeranian">포메
      		<input type="radio" name="golden" value="goldenretriever">골든리트리버
      		<input type="radio" name="golden" value="goldenretriever">진돗개
      		<input type="radio" name="Mixed" value="Mixed" checked>믹스견
  			</span></td>
		</tr>
		
		
		
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			
			<b>사진</b></td>
			<td>
			<div class="form-group">
				<input type="file" name="dogFile1"
				style="width:250px;" class="form-control" >
				<span class="glyphicon glyphicon-plus-sign files"
				style="margin-left: 30px;font-size: 1.3em;cursor:pointer;"></span>
			</div>
			<div class="addfile"></div>
			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>소개글</b></td>
			<td>
				<textarea name="content"
				style="width:400px;height: 150px;" required="required"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">

				
				<button type="button" class="btn btn-info"
				style="width:100px;"
				onclick="location.href='index.jsp?main=databoard/databoardlist.jsp'">저장하기</button>
		</tr>
	</table>
	</form>
</div>
</body>
</html>