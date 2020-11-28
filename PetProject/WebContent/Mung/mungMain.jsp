<%@page import="data.dao.AccountDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.MungPostDto"%>
<%@page import="data.dao.MungDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* bg-dark text-white */
</style>
<script type="text/javascript">
$(function() {
	$(".mung_post")
});
</script>
</head>
<%
	String myId=(String)session.getAttribute("myId");
	String accId=(String)session.getAttribute("accId");
	String loginOk=(String)session.getAttribute("loginOk");
	
	MungDao dao=new MungDao();
	List<MungPostDto> list=dao.getAllPost();
	
%>
<body>
<div id="mumg__container">
	<ul id="mung__nav">
		<li class="mung__nav-acc">
			<a href="index.jsp?main=Mung/mungAccount.jsp">
				계정
			</a>
		</li>
		<li class="mung__nav-menu">
		</li>
	</ul>
	<div class="mung__post-list">
		<div class="row row-cols-1 row-cols-md-3">
<%
		for(MungPostDto dto:list) {
%>
			<div class="col mb-4 ">
			    <div class="card mung__post-img">
			      <img src="..." class="card-img-top" alt="...">
			      <div class="card-img-overlay">
				    <p class="card-text">Last updated 3 mins ago</p>
				  </div>
			    </div>
			</div>
<%		
		}
%>
		</div>
	</div>	
</div>
</body>
</html>