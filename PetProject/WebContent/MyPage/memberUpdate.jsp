<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- stylesheet -->
<style type="text/css">

.memeber__container {
margin-top:3em;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	width:100%;
	flex-wrap: wrap;
}

 .member__form{
	display: flex;
	flex-direction: column;
	width:50%;
} 

.del-button{
background-color: #f28e3c;
border: none;}
@media (max-width:800px){
	.member__form {
	width:100%;
}
form{
display: flex;
margin-left: 10%;

}
#memberForm{
	display:flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}


}
</style>
<script type="text/javascript">
      //우편번호 찾기 API
      function searchPostcode() {
        new daum.Postcode({
          oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ""; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
              extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== "" && data.apartment === "Y") {
              extraRoadAddr +=
                extraRoadAddr !== ""
                  ? ", " + data.buildingName
                  : data.buildingName;
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== "") {
              extraRoadAddr = " (" + extraRoadAddr + ")";
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if (data.autoRoadAddress) {
              var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
              guideTextBox.innerHTML =
                "(예상 도로명 주소 : " + expRoadAddr + ")";
              guideTextBox.style.display = "block";
            } else if (data.autoJibunAddress) {
              var expJibunAddr = data.autoJibunAddress;
              guideTextBox.innerHTML =
                "(예상 지번 주소 : " + expJibunAddr + ")";
              guideTextBox.style.display = "block";
            } else {
              guideTextBox.innerHTML = "";
              guideTextBox.style.display = "none";
            }
          },
        }).open();
      }
      function deleteUser(){
    	  var num=document.getElementById("num").value;
    	  var check= confirm("정말로 탈퇴하시겠습니까?");
    	  if(check){
    		location.href="MyPage/deleteUserAction.jsp?num="+num;	  
    	  }else{
    		  location.href="index.jsp?main=MyPage/memberUpdate.jsp";
    	  }
      }
    </script>
</head>
<body>
	<%
	UserDao dao=new UserDao();
	String id=(String)session.getAttribute("myId");
	String userNum=dao.getNum(id);
	UserDto dto=dao.getInfo(userNum);
	
	String email1=dto.getEmail().split("@")[0];
	String email2=dto.getEmail().split("@")[1];
	String hp1=dto.getHp().split("-")[0];	
	String hp2=dto.getHp().split("-")[1];	
	String hp3=dto.getHp().split("-")[2];	
	%>
<div id="memberForm">
		<form action="MyPage/memberUpdateAction.jsp" method="post">
			<div class="memeber__container">
				<div class="member__form">
				<input type="hidden" value="<%=dto.getUser_num()%>" name="user_num" id="num"> 
					<span>* 필수입력사항</span>
					<!--아이디-->
					<span>아이디</span>
					<input type="text" class="all__form large readonly" readonly value="<%=dto.getId()%>"/> 
						<span class="id-check"></span>
					<!--이름-->
					<span>이름 
					</span><input type="text" class="all__form large readonly" readonly value="<%=dto.getUser_name()%>"/>
					
					<!--휴대폰-->
					<span>휴대폰 * </span>
					
					<div>
					<select name="hp1" id="hp1">
							<option selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
					</select> <span>-</span> <input type="text" name="hp2" id="hp2" class="all__form small"
						pattern="\d{4}" title="숫자만 입력가능합니다" maxlength="4" required  value="<%=hp2 %>"/> <span>-</span>
						<input type="text" name="hp3" id="hp3" class="all__form small" pattern="\d{4}"
						title="숫자만 입력가능합니다" maxlength="4" required  value="<%=hp3 %>"/>
					</div>
					<!--이메일-->
					<span>이메일 *</span>
					<div>
					<input type="text" name="email1" class="all__form medium" placeholder="이메일주소" required value="<%=email1%>"/> <span>@</span> 
						<input type="text" class="all__form medium" name="email2" id="email2" placeholder="이메일주소" required value="<%=email2 %>" /> 
						<br>
						<select id="email3">
							<option disabled selected>선택하세요</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="-">직접 입력하기</option>
					</select>
					<script type="text/javascript">
					$("#hp1 option[value='<%=hp1%>']").attr("selected","true");
					$("#email3 option[value='<%=email2%>']").attr("selected","true");
					</script>
					</div>
					
				</div>

				<div class="member__form">
					
					<!-- 주소 -->
					<span>주소 </span>
					<div>
						<input type="text" id="postcode" class="all__form readonly medium" placeholder="우편번호" name="zipcode" readonly value="<%=dto.getZipcode()==null?"":dto.getZipcode() %>"/>
							<button type="button" onclick="searchPostcode()" class="button">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
								  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
								</svg>
							</button></div>
						
							 <div><input type="text" id="roadAddress" class="all__form readonly large" placeholder="도로명주소" name="road_addr" readonly value="<%=dto.getRoad_addr()==null?"":dto.getRoad_addr() %>"/>
							 <input type="text" id="jibunAddress" class="all__form readonly large" placeholder="지번주소" name="jibun_addr" readonly  value="<%=dto.getJibun_addr()==null?"":dto.getJibun_addr() %>"/> </div>
							 <span id="guide" style="color: #999; display: none"></span>
							<input type="text" id="detailAddress" class="all__form large" placeholder="상세주소" name="detail_addr" value="<%=dto.getDetail_addr()==null?"":dto.getDetail_addr()%>" />
					

					<!-- 회원약관 -->
					<div>
						<input type="checkbox" id="chk_agree" <%=dto.getAgree()==1?"checked":"" %>/> <a href="index.jsp?main=Member/agreement.jsp" target="blank">위치정보동의(선택) </a> 
						<input type="hidden" name="agree" id="agree" value="0" />
						<script type="text/javascript">
               //위치정보동의 파라미터
				$("#chk_agree").click(function () {
                  if ($(this).prop("checked")) {
                    $("#agree").val("1");
                  } else {
                    $("#agree").val("0");
                  }
                });
                
              //1.핸드폰 4자리 입력시 다음 번호칸으로 이동
            	$("#hp2").keyup(function(){
            		if($(this).val().length==4)
            			$("#hp3").focus();
            	})
            	//2. 이메일 선택시 앞칸에 이메일 주소 출력
            	$("#email3").change(function(){
            		var mail =$(this).val();
            		if(mail=="-"){
            			$("#email2").val("");
            			$("#email2").focus();
            		}else{
            			$("#email2").val(mail);
            		}
            		
            	})
            	
              </script>

					</div>
					<!--비밀번호-->
					<span>비밀번호 * </span>
					<input type="password" name="pass" id="pass" class="all__form large" placeholder="비밀번호" required pattern="(?=.*\d)(?=.*[a-z]).{6,}"  title="6자리 이상, 하나 이상의 숫자 및 소문자를 모두 포함해야합니다." /> 					
					<div>
					<button type="submit" class="button medium">회원정보수정</button>
					<button type="button" class="del-button medium" onclick="deleteUser()">회원탈퇴</button>
					</div>
					
				</div>
			</div>
		</form>
</div>
</body>
</html>