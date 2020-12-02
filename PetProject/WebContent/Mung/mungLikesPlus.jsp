<%@page import="data.dao.MungDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String post_num=(String)request.getParameter("post_num");

	MungDao dao=new MungDao();
	
	dao.plusLikes(post_num);
%>