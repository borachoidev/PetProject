<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String petcenter = URLEncoder.encode(request.getParameter("petcenter"), "UTF-8");
String startday = URLEncoder.encode(request.getParameter("startday"), "UTF-8");
String endday = URLEncoder.encode(request.getParameter("endday"), "UTF-8");
String petselect = URLEncoder.encode(request.getParameter("petselect"), "UTF-8");
String user_name = URLEncoder.encode(request.getParameter("user_name"), "UTF-8");
String hp = URLEncoder.encode(request.getParameter("hp"), "UTF-8");
String dog_name = URLEncoder.encode(request.getParameter("dog_name"), "UTF-8");
%>
<jsp:useBean id="dao" class="data.dao.BookDao" />
<jsp:useBean id="dto" class="data.dto.BookDto" />

<jsp:setProperty property="*" name="dto" />

<%
	dao.insertBook(dto);

	response.sendRedirect("../index.jsp?main=Book/bookInfo.jsp?petcenter="+petcenter+"&startday="+startday+"&endday="+endday+"&petselect="+petselect+"&user_name="+user_name+"&hp="+hp+"&dog_name="+dog_name);
	

%>