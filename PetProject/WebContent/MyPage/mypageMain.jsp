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

#myPage__container {
   display: flex;
   justify-content: space-between;
   flex-direction: column;
   width: 70vw;
   height: 70vh;
   margin: 5% 15%;
}

.myPage__info-btn {
   border: none;
}

.myPage__box {
   width: 100%;
   height: 35%;
   display: flex;
   justify-content: space-between;
   flex-direction: row;
   align-content: center;
   
  
}

.myPage__my-menu {
   display: flex;
   justify-content: flex-start;
   flex-direction: column;
   width: 50%;
   height: 100%;
   border: 1px solid #EAEAEA;
   margin: 0 2%;
   padding: 2%;
   
  border-bottom: 2px solid #ffc400;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.10),
     0px 5px 10px rgba(0,0,0,0.05),
     0px 10px 10px rgba(0,0,0,0.05),
     0px 20px 10px rgba(0,0,0,0.05);
}

.myPage__info-box img {
   width: 60px;
   height: 60px;
   margin-right: 10%;
}

.myPage__info-btn {
   white-space: nowrap;
   background-color: #bb4d00;
}

.myPage__info-box {
   display: flex;
   justify-content: center;
   flex-direction: row;
   width: 50%;
   height: 100%;
   border: 1.5px solid #efebe9;
   margin: 0 2%;
   padding: 2%;
   align-items: center;
   font-size: 0.9em;
   border-bottom: 2px solid #ffc400;
   box-shadow: 0px 0px 10px rgba(0,0,0,0.10),
     0px 5px 10px rgba(0,0,0,0.05),
     0px 10px 10px rgba(0,0,0,0.05),
     0px 20px 10px rgba(0,0,0,0.05);
}

.myPage__box p {
   font-size: 0.9em;
}

.myPage__box a {
   font-weight: bold;
}
</style>
<title>펫앤미 - 마이페이지</title>
</head>
<div id="myPage__container">
   <h1>마이페이지</h1>
  <div class="myPage__box row">
     <div class="col myPage__info-box">
        <img src="Image/favicon.png">
      <a href="index.jsp?main=MyPage/myInfoUpdate.jsp"><button class="myPage__info-btn">내 정보 관리</button></a>
        <a href="index.jsp?main=MyPage/accUpdateList.jsp"><button class="myPage__info-btn">반려견 정보 관리</button></a>
     </div>
     <div class="col myPage__my-menu">
           <a href="index.jsp?main=MyPage/bookListForFuture.jsp">예약현황&nbsp;&gt;</a><br>
           <p>
              예약현황을 확인해 보세요
           </p>
     </div> 
  </div> 
  <div class="myPage__box row">
        <div class="col myPage__my-menu">
           <a href="index.jsp?main=MyPage/bookList.jsp">수강내역&nbsp;&gt;</a><br>
           <p>
              수강내역을 확인해 보세요 <br>
              과거 수강내역 및 후기글 등록을 도와드립니다
           </p>
        </div>
        <div class="col myPage__my-menu">
           <a href="index.jsp?main=MyPage/reviewList.jsp">내 글관리&nbsp;&gt;</a><br>
           <p>
              간편하게 내가 쓴 글을 관리할 수 있습니다
           </p>
        </div>
  </div>
</div>

<div class="list-group">
 
  
  
</div>

</body>
</html>