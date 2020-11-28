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

	span.camera{
		cursor: pointer;
		margin-left: 10px;
		font-size: 25px;
	}
	
	#showimg{
		position: absolute;
		margin-top: 100px;
		left: 600px;
		max-width:130px;
	}

</style>
<script type="text/javascript">
$(function(){
	
	$("span.camera").click(function(){
		//$("#photo").removeAttr("style");
		$("#photo").trigger('click');
	});
});

 function readUrl(input){
	if(input.files[0]){
		var reader=new FileReader();
		reader.onload=function(e){
			$("#showimg").attr("src",e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
 }
</script>
<title>강아지 등록하기</title>
</head>
<body>
<div class="accAddform">
<img id="showimg">
	<form action="mypage/accAddAction.jsp" method="post" enctype="multipart/form-data"
	class="form-inline">
	
	
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
      		<input type="radio" name="golden" value="goldenretriever"checked>진돗개
      		<input type="radio" name="Mixed" value="Mixed">믹스견
  			</span></td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>무게</b></td>
			<td><input type="text" name="dogName" class="form-control" style="width: 400px;">
			</td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>나이</b></td>
			<td><input type="text" name="dogName" class="form-control" style="width: 400px;">
			</td>
		</tr>
		<tr>
			<td style="width: 80px;background-color:#66cdaa;">
			<b>성별</b></td>
			<td>
			<input type="radio" name="poodle" value="poodle">수컷
      		<input type="radio" name="pome" value="pomeranian">암컷
      		<input type="radio" name="golden" value="goldenretriever">수컷(중성화)
      		<input type="radio" name="Mixed" value="Mixed" checked>암컷(중성화)
  			</td>
		</tr>
		<tr>
			<td style="width: 150px;background-color:#66cdaa;">
			<b>사진</b></td>
			<td>
			<div class="form-group">
				<input type="file" name="accFile1"
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
				onclick="location.href='index.jsp?main=databoard/databoardlist.jsp'">수정하기</button>
							<td colspan="2" align="center">
				<button type="button" class="btn btn-info"
				style="width:100px;"
				onclick="location.href='index.jsp?main=databoard/databoardlist.jsp'">삭제하기</button>
		</tr>
	</table>
	</form>
</div>
</body>
</html>