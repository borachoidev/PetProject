<%@page import="data.dto.MapDto"%>
<%@page import="data.dao.MapDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String xPos = request.getParameter("xPos");
	String yPos = request.getParameter("yPos");
	String id = request.getParameter("id");
	int star = Integer.parseInt(request.getParameter("star"));
	
	MapDto mdto = new MapDto();
	mdto.setXpos(xPos);
	mdto.setYpos(yPos);
	mdto.setId(id);
	mdto.setStar(star);
	
	MapDao mdao = new MapDao();
	mdao.insertStar(mdto);
%>