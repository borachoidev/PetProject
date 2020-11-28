<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.UserDao" />
<jsp:useBean id="dto" class="data.dto.UserDto2" />

<jsp:setProperty property="*" name="dto" />

<% 
//메서드 호출
dao.insertUser(dto);
//de
response.sendRedirect("../index.jsp?main=Home/homeMain.jsp");
%>
