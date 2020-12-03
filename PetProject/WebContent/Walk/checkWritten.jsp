<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dao.MapDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String xPos = request.getParameter("xPos");
	String yPos = request.getParameter("yPos");
	String id = request.getParameter("id");
	
	MapDao mdao = new MapDao();
	int count = mdao.isWritten(xPos, yPos, id);
%>
<count><%=count %></count>
