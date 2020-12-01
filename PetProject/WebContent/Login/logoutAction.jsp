<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%session.removeAttribute("loginOk"); 
session.removeAttribute("myId"); 
session.removeAttribute("accId"); 
response.sendRedirect("../index.jsp");
%>
