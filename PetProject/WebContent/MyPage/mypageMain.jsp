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
<title>펫앤미 - 마이페이지</title>
</head>
<div class="myPage jumbotron">
  <h1>마이페이지</h1>
</div>

<div class="list-group">
  <a href="index.jsp?main=MyPage/accAdd.jsp" class="myAdd list-group-item">반려동물 등록</a>
  <a href="index.jsp?main=MyPage/accUpdateList.jsp" class="myAdj list-group-item">반려동물 정보수정 및 삭제</a>
  <a href="index.jsp?main=MyPage/bookList.jsp" class="myBook list-group-item">수강내역</a>
  <a href="index.jsp?main=MyPage/bookListForFuture.jsp" class="myReco list-group-item">예약현황</a>
  <a href="index.jsp?main=MyPage/reviewList.jsp" class="myReview list-group-item">내 글관리</a>
  <a href="index.jsp?main=MyPage/memberUpdate.jsp" class="myUserInfo list-group-item">회원정보수정 및 탈퇴</a>
</div>

</body>
</html>