<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//id 읽기
String id = request.getParameter("id");
//dao 선언
UserDao dao = new UserDao();
//메서드 호출
boolean find = dao.isIdSearch(id);
%>
<result><%=find?"yes":"no"%></result>
