<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.form__container{
display: flex;
flex-direction: column;
margin-top:20vh;
height:100%;
width:100%;
justify-content: center;
align-items: center;
}

.form__container div{
display: flex;
width:100%;
justify-content: space-between;
align-items: center;
}
</style>
<%
String id=request.getParameter("id");
%>
<script type="text/javascript">
$(function(){
	//비밀번호 조건체크
    $("#newPass").keyup(validatePassword);
    $("#passComfirm").keyup(comfirmPassword);
    
})
//비밀번호 조건함수
function validatePassword() {
      var password = $("#newPass").val();

      if (password.match(/^(?=.*\d)(?=.*[a-z]).{6,}$/)) {
        $(".pass-check")
          .css("color", "#7A81FF")
          .html("사용가능한 비밀번호 입니다.");
      } else {
        $(".pass-check")
          .css("color", "#FF7E79")
          .html(
            "6자리 이상, 하나 이상의 숫자 및 소문자를 모두 포함해야합니다."
          );
      }
    }
//비밀번호 확인함수   
function comfirmPassword(){
	  var password= $("#newPass").val();
	  var comfirm = $("#passComfirm").val();
	  
  	  if(comfirm!==password){
  		  $(".pass-comfirm")
            .css("color", "#FF7E79")
            .html(
              "비밀번호가 일치하지 않습니다"
            );
        }else{
      	  $(".pass-comfirm")
            .css("color", "#7A81FF")
            .html("비밀번호가 일치합니다");
        }
	  }

 
</script>
</head>
<form action="MatchCertification" method="post">
<div class="form__container">
	<h2>메일로 인증번호를 확인해주세요! </h2>
	<br>
	<input type="hidden" value="<%=id %>" name="id" class="all__form">
	<div>인증번호 <input type="text" name="AuthenticationUser" class="all__form"></div>
	 <div>변경할 비밀번호 
	<input type="password" name="pass" id="newPass"  pattern="(?=.*\d)(?=.*[a-z]).{6,}"  title="6자리 이상, 하나 이상의 숫자 및 소문자를 모두 포함해야합니다."  class="all__form"></div>
	<span class="pass-check"></span>

	<div>비밀번호 확인 <input type="password" id="passComfirm" class="all__form"></div>
	<span class="pass-comfirm"></span>
	<br>
	<button type="submit" class="button">비밀번호 변경하기</button>
	
	</div>
</form>
<body>
</body>
</html>