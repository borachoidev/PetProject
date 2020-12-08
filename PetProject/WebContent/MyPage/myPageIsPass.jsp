<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String myId=(String)session.getAttribute("myId");
	String pass=request.getParameter("pass");
	String new_pass=request.getParameter("new_pass");
	
	UserDao dao=new UserDao();
	boolean isPass=dao.isIdPassCheck(myId, pass);
	
	if(isPass) {
		dao.changePass(new_pass, myId);
		response.sendRedirect("../index.jsp?main=MyPage/mypageMain.jsp");	
	}else {
%>
<script>
		alert("비밀번호가 일치하지 않습니다.")
		history.back();
</script>	
<%		
	}
%>