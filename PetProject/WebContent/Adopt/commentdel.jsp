<%@page import="data.dao.AdoptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//idx 읽기
	String idx=request.getParameter("idx");
	//dao 선언
	AdoptDao adao=new AdoptDao();
	//삭제
	adao.deleteComment(idx);
%>