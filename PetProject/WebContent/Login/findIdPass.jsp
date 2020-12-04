<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.find__container{
display: flex;
flex-direction: column;
}


#findPass{
display:none;
}

</style>
<script type="text/javascript">
/* 이메일 입력시 이벤트 */
$(function(){
	$(".email3").change(function(){
		var mail =$(this).val();
		if(mail=="-"){
			$(".email2").val("");
			$(".email2").focus();
		}else{
			$(".email2").val(mail);
		}	
	});
	
/* 폼이동 버튼이벤트	 */
	$("#findIdBtn").click(function(){
		$("#findId").show();
		$("#findPass").hide();
				
	})
	$("#findPassBtn").click(function(){
		$("#findId").hide();
		$("#findPass").show();
				
	})
	
	
})
</script>
</head>
<body>
	<div class="find__container">
	<div class="find__btn">
	<!-- 아이디 비밀번호 찾기폼 출력 버튼 -->
	<button type="button" id="findIdBtn" class="button" > 아이디 찾기</button> <button type="button" id="findPassBtn" class="button"> 비밀번호 찾기</button>
	</div>
	<!-- 아이디 찾기 -->
		<div id="findId">
			아이디 찾기
			<form action="SendId">
				이메일 <input type="text" name="email1" class="all__form"
					placeholder="이메일주소" required /> <span>@</span> <input type="text"
					class="all__form email2" name="email2" placeholder="이메일주소"
					required /> <select class="email3 all__form">
					<option disabled selected>선택하세요</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="-">직접 입력하기</option>
				</select> 
				<br>
				<button type="submit" class="button" >찾기</button>
			</form>
		</div>
		<!-- 비밀번호 찾기 -->
		<div id="findPass" >
			비밀번호 찾기
			<form action="SendCertification">
			아이디 <input type="text" name="id" placeholder="아이디" class="all__form"> 
			<br>
				이메일 <input type="text" name="email1" class="all__form"
					placeholder="이메일주소" required /> <span>@</span> <input type="text"
					class="all__form email2" name="email2"  placeholder="이메일주소"
					required /> <select class="email3">
					<option disabled selected>선택하세요</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="-">직접 입력하기</option>
				</select> 
				<br>
			<button type="submit" class="button" >찾기</button>
			</form>

		</div>

	</div>

</body>
</html>