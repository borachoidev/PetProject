<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num=request.getParameter("reviewNum");
String pageNum=request.getParameter("pageNum");

ReviewDao dao=new ReviewDao();
dao.deleteReview(num);

response.sendRedirect("../index.jsp?main=Review/reviewMain.jsp?pageNum="+pageNum);

%>