<%@page import="data.dao.AdoptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");

	AdoptDao adao=new AdoptDao();
	
	adao.deleteComment(idx);

%>