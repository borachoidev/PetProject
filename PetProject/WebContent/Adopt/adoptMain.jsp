<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
   #adoptmain__container {
      display: flex; 
      justify-content: center;
      flex-direction: row;
   }

</style>
<title>Insert title here</title>
</head>
<body>
<div id="adoptmain__container">
	<div style="width : 700px; margin:0 auto;">
		<span style= "text-align : center"><h3>가정 분양 게시판</h3></span>
		<a href='index.jsp?main=Adopt/adoptlist.jsp'><img style="width:100%" src="Image/adopt.jpg"></a>
			
	</div>	
	<div style="width : 700px; margin:0 auto;">
		<span style= "text-align : center"><h3>유기 분양 게시판</h3></span>
		<a href='index.jsp?main=Adopt/abandonlist.jsp'><img style="width: 100%" src="Image/adopt2.jpg"></a>
			
	</div>	
</div>
</body>
</html>

<!-- <div style="width:원하는 가로폭; margin:0 auto;">
<a href="#"><img style="width:50%" src="1번"></a>
<a href="#"><img style="width:50%" src="2번"></a>
</div> -->