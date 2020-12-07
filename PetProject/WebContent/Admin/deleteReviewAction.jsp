<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String num= request.getParameter("review_num");

ReviewDao dao=new ReviewDao();
dao.deleteReview(num);
response.sendRedirect("../index.jsp?main=Admin/reviewList.jsp");
%>