<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.agree__container{
	justify-content: center;
	align-items: center;
	margin: 5em;
}

.tab-content{
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="agree__container">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#personal">개인정보 수집 및 이용동의</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#geo">위치정보 서비스 동의</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="personal" class="container tab-pane active"><br>
      <h3>[개인정보 수집 및 이용 동의]</h3>
      <pre>
펫앤미는 다음과 같이 개인정보를 수집 및 이용하고 있습니다.

- 수집 및 이용 목적: 회원 가입, 이용자 식별, 공지사항 전달
- 항목: ID, 비밀번호, 이메일주소
- 수집 및 이용 목적: 본인확인, 이용자 식별, 부정이용 방지, 중복가입 방지, 공지사항 전달
- 항목: 이름, 휴대폰번호, 연계정보(CI), 중복가입정보(DI) ,주소
- 보유 및 이용기간: 회원탈퇴시 까지 (법령에 특별한 규정이 있을 경우 관련 법령에 따라, 
  부정이용기록은 회원탈퇴일로부터 1년)
동의를 거부할 경우 회원가입이 불가능 합니다.
외부 계정을 이용하는 경우 이용자가 동의한 범위 내에서만 개인정보를 제공받고 처리합니다.
이벤트 등 프로모션 알림 전송을 위해 선택적으로 개인정보를 이용할 수 있습니다.

※ 그 외의 사항 및 자동 수집 정보와 관련된 사항은 개인정보처리방침을 따릅니다.</pre>
    </div>
    <div id="geo" class="container tab-pane fade"><br>
      <h3>[위치정보서비스 동의]</h3>
      <pre>다음은 펫앤미가 제공하고 있는 위치기반서비스에 적용되는 이용조건입니다. 

- 수집 항목 : 주소
- 이용 목적 : 서비스 제공
- 서비스의 내용:회원 정보에 등록된 주소를 기반으로 한 산책경로 추천 서비스
- 보유 및 이용기간 : 동의 변경시까지

동의를 거부할 경우 “산책친구”에서 위치 기반 서비스가 불가능합니다.</pre>
    </div>
    
  </div>
</div>

</body>
</html>