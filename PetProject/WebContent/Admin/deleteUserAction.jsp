<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String num= request.getParameter("num");

UserDao dao=new UserDao();
dao.deleteUser(num);
response.sendRedirect("../index.jsp?main=Admin/memberList.jsp");
%>