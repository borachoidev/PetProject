<%@page import="data.dto.MungCommentDto"%>
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
.mung__post__imgIcon {
	color: white;
}
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
	List<MungPostDto> postList=dao.getAllPost();
	
%>
<body>
<div id="mumg__container">
	<ul id="mung__nav">
		<li class="mung__nav__acc">
			<a href="index.jsp?main=Mung/mungAccount.jsp?acc_name='<%=accId%>'">
				<img class="mung__profile" src="">
				<b><%=accId %>(<%=myId %>)</b>
			</a>
		</li>
		<li class="mung__nav__btn">
		</li>
	</ul>
	<div class="mung__post-list">
		<div class="row row-cols-1 row-cols-md-3">
<%
		for(MungPostDto dto:postList) {
			int idx=dto.getPhoto().split(",").length-1;
			String photo=dto.getPhoto().split(",")[idx];
			int likes=dto.getLikes();
			int commSize=dao.getCommentSize(dto.getPost_num());
%>
			<div class="col mb-4 ">
			    <div class="card mung__post">
			      <img src="mungSave/<%=photo %>" class="card-img-top mung__post-img">
			      <div class="card-img-overlay">
				    <p class="card-text mung__post-text">
						<svg class="mung__post-text__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
						</svg>
						<%=likes %>
				    	<svg class="mung__post-text__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M14 0a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
						</svg>
				    	<%=commSize %>
					</p>
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