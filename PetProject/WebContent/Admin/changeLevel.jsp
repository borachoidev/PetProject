

<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String lvl=request.getParameter("lvl");
String num=request.getParameter("num");

UserDao dao=new UserDao();
dao.updateUserLevel(num, lvl);



%>
