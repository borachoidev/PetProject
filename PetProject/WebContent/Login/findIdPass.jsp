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
margin-top: 10%;
}

#findId,#findPass {
	margin-top: 3%;
}

#findPass{
display:none;
}

.find-btn {
	border: none;
	background: none;
	color: gray;
}

.find-btn:first-child {
	color: #ffd479;
}

.login__findBtn {
	width: 10%;
	margin: 2% 45%;
	align-content: center;
	white-space: nowrap;
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
		$(this).css("color","#ffd479");
		$(this).next().css("color","gray");
				
	})
	$("#findPassBtn").click(function(){
		$("#findId").hide();
		$("#findPass").show();
		$(this).css("color","#ffd479");
		$(this).prev().css("color","gray");
				
	})
	
	
})
</script>
</head>
<body>
	<div class="find__container">
	<div class="find__btn">
	<!-- 아이디 비밀번호 찾기폼 출력 버튼 -->
	<button type="button" id="findIdBtn" class="find-btn" > 아이디 찾기</button>  <button type="button" id="findPassBtn" class="find-btn"> 비밀번호 찾기</button>
	<hr>	
	</div>
	<!-- 아이디 찾기 -->
		<div id="findId">
			<form action="SendId">
				이메일 <input type="text" name="email1" class="all__form"
					placeholder="이메일주소" required /> <span>@</span> <input type="text"
					class="all__form email2" name="email2" placeholder="이메일주소"
					required /> <select class="email3">
					<option disabled selected>선택하세요</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="-">직접 입력하기</option>
				</select> 
				<br>
				<button type="submit" class="button login__findBtn" >검색</button>
			</form>
		</div>
		<!-- 비밀번호 찾기 -->
		<div id="findPass" >
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
			<button type="submit" class="button login__findBtn">검색</button>
			</form>

		</div>

	</div>

</body>
</html>