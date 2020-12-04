<%@page import="java.net.URLEncoder"%>
<%@page import="data.dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String petcenter = URLEncoder.encode(request.getParameter("petcenter"), "UTF-8");
	String startday = URLEncoder.encode(request.getParameter("startday"), "UTF-8");
	String endday = URLEncoder.encode(request.getParameter("endday"), "UTF-8");
	String petselect = URLEncoder.encode(request.getParameter("petselect"), "UTF-8");

	
	
	response.sendRedirect("../index.jsp?main=Book/bookAdd.jsp?petcenter="+petcenter+"&startday="+startday+"&endday="+endday+"&petselect="+petselect);
	
%>