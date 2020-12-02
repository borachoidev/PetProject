<%@page import="data.dao.MungDao"%>
<%@page import="data.dto.MungCommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String comm_num=request.getParameter("comm_num");
	String content=request.getParameter("content");
	String dog_num=request.getParameter("dog_num");

	MungDao dao=new MungDao(); 
	MungCommentDto dto=new MungCommentDto();
	dto.setComm_num(comm_num);
	dto.setContent(content);
	dto.setDog_num(dog_num);
	
	dao.insertComment(dto);
%>
