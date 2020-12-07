<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800,900" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
html {
  font-family: 'Nunito', sans-serif;
  height: 100%;
}
body {
  margin: 0px;
  height: 100%;
}
.wrapper {
  height: auto;
  min-height: 100%;
  overflow: hidden;
}
.side-menu {
  width: 200px;
  float: left;
  background: #FAF4C0;
  height: auto;
  min-height: 100%;
  margin-bottom: -5000px; 
  padding-bottom: 5000px; 
}
.logo {
  background: #FFCD12;
  color: #ffffff;
  font-size: 27px;
  font-weight: bold;
  padding: 10px 0px 0px 10px;
  height: 45px;
}

.main-section {
  height: 100%;
}
a {
  text-decoration: none;
  color: #e1e2fa;
}

.main-section{
  background: #F6F6F6;
  height:100%;
  margin-bottom: -5000px;
  padding-bottom: 5000px;
  margin-left: 250px;
}

.card {
  margin: 25px;
  padding: 15px;
  width: 250px;
  background: #fff;
  float: left;
  box-shadow: 0 6px 20px 0px #D5D5D5;
}
.card-content {
  color: #32325d;
  font-weight: 600;
  font-size: 20px;
  
}
.author {
  color: #999999;
  font-size: 36px;
  margin-top: 20px;
  
}
.status {
  width: 30px;
  height: 8px;
  border-radius: 10px;
  background: #FFBB00;
  margin-bottom: 15px; 
}

.section-title {
  margin-left: 25px;
  margin-top: 10px;
  font-size: 24px;
  color: #3a3a63;
}
</style>

<script type="text/javascript">
</script>

<%

String id=(String)session.getAttribute("myId");
%>
<title>펫앤미 - 관리자 페이지</title>
</head>
  <body>
  
    <div class="wrapper">
      <div class="side-menu">
        <div class="logo">
        	<b>관리자페이지</b>
        </div>
        
        
      </div>
      <div class="main-content">
        <div class="main-section">
        <div><br><br><br><br><br></div>
          <div class="card">
            <div class="status"></div>
            <div class="card-content">회원관리
            </div>
            <div class="author"><a href="index.jsp?main=Admin/memberList.jsp"><i class="fa fa-user-circle-o" aria-hidden="true"></i></div>
          </div>
          <div class="card">
            <div class="status"></div>
            <div class="card-content">예약관리
            </div>
            <div class="author"><a href="index.jsp?main=Admin/bookingList.jsp"><i class="fa fa-server" aria-hidden="true"></i></div>
          </div>
            <div class="card">
            <div class="status"></div>
            <div class="card-content">후기글 관리
            </div>
            <div class="author"><a href="index.jsp?main=Admin/reviewList.jsp"><i class="fa fa-desktop" aria-hidden="true"></i></div>
          </div>
            </div>
          </div>
        </div>
     
</body>
</html>