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
.memeber__main {
	height: 100%;
}

.memeber__container {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.member__form {
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
	width: 20em;
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

button {
	padding: .5em 1em;
	margin: .4em .15em;
	border: 1px solid #ccc;
	border-color: #dbdbdb #d2d2d2 #b2b2b2 #d2d2d3;
	cursor: pointer;
	color: #464646;
	border-radius: 7em;
	vertical-align: middle;
	font-size: 1em;
	line-height: 1.25em;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#f2f2f2));
}

.readonly {
	background-color: #ebebeb;
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

      //JQuery Function
      $(function () {
        //id중복체크
        $("#id").keypress(function () {
          $(".id-check").text("");
        });
        $("#id").blur(function () {
          var id = $(this).val();
          if ($("#id").val().trim().length == 0) {
            $(this).val("");
            return;
          }
          console.log(id);
          $.ajax({
            type: "get",
            url: "Member/idcheckxml.jsp",
            dataType: "xml",
            data: {
              id: id,
            },
            success: function (data) {
              if ($(data).text() === "yes") {
                $(".id-check")
                  .css("color", "#FF7E79")
                  .html("이미사용중인아이디입니다.");
                $("#id").val("").focus();
              } else {
                $(".id-check")
                  .css("color", "#7A81FF")
                  .html("사용 가능한 아이디입니다.");
              }
            },
          });
        });
		//비밀번호 조건체크
        $("#pass").keyup(validatePassword);

        function validatePassword() {
          var password = $("#pass").val();

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
      });
    </script>
</head>
<body>
	<!-- 반응형을 위한 div 만들기 -->
	<div class="memeber__main">
		<form action="Member/insertMember.jsp" method="post">
			<div class="memeber__container">
				<div class="member__form">
					<span>* 필수입력사항</span>
					<!--아이디-->
					<label>아이디 *
					<input type="text" name="id" id="id" class="m_form" placeholder="영문소문자, 숫자 포함한 5-16글자" pattern="^([a-z0-9]){5,16}$" title="영문소문자 혹은 숫자를 포함한 5글자이상으로 입력해주세요" required />
					<span class="id-check"></span>
					</label>

					<!--비밀번호-->
					<label>비밀번호 *
					<input type="password" name="pass" id="pass" class="m_form" placeholder="비밀번호" required />
					<!--
					비밀번호패턴
					 pattern="(?=.*\d)(?=.*[a-z]).{6,}"  title="6자리 이상, 하나 이상의 숫자 및 소문자를 모두 포함해야합니다."  
					 -->
					</label> 
					<span class="pass-check"></span>
					<input type="password" class="m_form" placeholder="비밀번호확인" required />
					<!--이름-->
					<label>이름 *
					<input type="text" name="user_name" class="m_form" placeholder="이름" title="한글만 입력가능합니다" required />
					</label>
					<!--휴대폰-->
					<label for="hp">휴대폰 *
						<select name="hp1">
							<option selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select> 
						<span>-</span> 
						<input type="text" name="hp2" class="m_form" pattern="\d{4}" title="숫자만 입력가능합니다" maxlength="4" required />
						<span>-</span> 
						<input type="text" name="hp3" class="m_form" pattern="\d{4}" title="숫자만 입력가능합니다" maxlength="4" required />
					</label>
				</div>

				<div class="member__form">
					<!--이메일-->
					<label>이메일 *
						<input type="text" name="email1" class="m_form" placeholder="이메일주소" required /> 
						<span>@</span>
						<input type="text" class="m_form" id="email2" placeholder="이메일주소" required /> 
						<select id="email3">
							<option disabled selected>선택하세요</option>
							<option value="google.com">google.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="-">직접 입력하기</option>
					</select>
					</label>
					<!-- 주소 -->
					<div>
						<label for="address">주소 
							<input type="text" id="postcode" class="m_form readonly" placeholder="우편번호" name="zipcode" readonly />
							<button type="button" onclick="searchPostcode()">우편번호 찾기</button>
							<br/> 
							<input type="text" id="roadAddress" class="m_form readonly" placeholder="도로명주소" name="road_addr" readonly /> 
							<input type="text" id="jibunAddress" class="m_form readonly" placeholder="지번주소" name="jibun_addr" readonly /> 
							<span id="guide" style="color: #999; display: none"></span>
							<input type="text" id="detailAddress" class="m_form" placeholder="상세주소" name="detail_addr" />
						</label>
					</div>

					<!-- 회원약관 -->
					<div>
						<input type="checkbox" required /> 
						<a href="index.jsp?main=Member/agreement.jsp" target="blank">이용약관동의(필수)</a> 
						<input type="checkbox" required /> 
						<a href="index.jsp?main=Member/agreement.jsp" target="blank">개인정보취급방침 동의(필수)</a> 
						<input type="checkbox" id="chk_agree"/> 위치정보동의(선택) 
						<input type="hidden" name="agree" id="agree" value="0"/>
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
					<button type="submit">회원가입</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
