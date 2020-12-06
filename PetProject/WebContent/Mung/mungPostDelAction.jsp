<%@page import="data.dao.MungDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String post_num=request.getParameter("post_num");

	MungDao dao=new MungDao();
	
	dao.deletePost(post_num);
%>
<script>
	location.href="index.jsp?main=Mung/mungAccount.jsp";
</script>