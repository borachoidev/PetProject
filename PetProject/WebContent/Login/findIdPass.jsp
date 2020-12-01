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

input {
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: -internal-light-dark(black, white);
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	appearance: textfield;
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
	-webkit-rtl-ordering: logical;
	cursor: text;
}

.m_form {
	margin: 0.2em 0;
	font-size: 1em;
	padding: 0.5em;
	border: 1px solid #ccc;
	border-color: #dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
	box-shadow: inset 0.1em 0.1em 0.15em rgba(0, 0, 0, 0.1);
	vertical-align: middle;
	line-height: 1.25em;
	outline: 0;
	width: 10em;
	border-radius: 0.7em;
}

button {
	padding: 0.5em 1em;
	margin: 0.4em 0.15em;
	border: 1px solid #ccc;
	border-color: #dbdbdb #d2d2d2 #b2b2b2 #d2d2d3;
	cursor: pointer;
	color: #464646;
	border-radius: 0.7em;
	vertical-align: middle;
	font-size: 1em;
	line-height: 1.25em;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#f2f2f2));
}

select {
	padding: 0 2em 0 1em;
	-webkit-border-radius: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: #fff url(Image/select_arrow.png) no-repeat 100% 50%;
	background-size: 1.5em;
	border: 1px solid #d7d7d7;
	color: #777;
	height: 2.38em;
	vertical-align: middle;
	border-radius: 0.7em;
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
	<button type="button" id="findIdBtn"> 아이디 찾기</button> <button type="button" id="findPassBtn"> 비밀번호 찾기</button>
	</div>
	<!-- 아이디 찾기 -->
		<div id="findId">
			아이디 찾기
			<form action="SendId">
				이메일 <input type="text" name="email1" class="m_form"
					placeholder="이메일주소" required /> <span>@</span> <input type="text"
					class="m_form email2" name="email2" placeholder="이메일주소"
					required /> <select class="email3 m_form">
					<option disabled selected>선택하세요</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="-">직접 입력하기</option>
				</select> 
				<br>
				<button type="submit">아이디찾기</button>
			</form>
		</div>
		<!-- 비밀번호 찾기 -->
		<div id="findPass" >
			비밀번호 찾기
			<form action="SendCertification">
			아이디 <input type="text" name="id" placeholder="아이디" class="m_form"> 
			<br>
				이메일 <input type="text" name="email1" class="m_form"
					placeholder="이메일주소" required /> <span>@</span> <input type="text"
					class="m_form email2" name="email2"  placeholder="이메일주소"
					required /> <select class="email3">
					<option disabled selected>선택하세요</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="-">직접 입력하기</option>
				</select> 
				<br>
			<button type="submit">비밀번호 찾기</button>
			</form>

		</div>

	</div>

</body>
</html>