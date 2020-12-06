<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String accId=request.getParameter("accId");

	session.setAttribute("accId", accId);
%>
<script>
	location.href="index.jsp?main=Mung/mungAccount.jsp"
</script>