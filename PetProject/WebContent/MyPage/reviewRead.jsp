<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.BookDao"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


String id=(String)session.getAttribute("myId");
/* String pageNum=request.getParameter("pageNum"); */
UserDao udao=new UserDao();
String user_num=udao.getNum(id);

ReviewDao rdao=new ReviewDao();
String num=rdao.getReview(user_num);

response.sendRedirect("../index.jsp?main=Review/content.jsp?num="+num+"&pageNum=1");


%>