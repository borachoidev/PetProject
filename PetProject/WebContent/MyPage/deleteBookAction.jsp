<%@page import="data.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String num = request.getParameter("num");

BookDao dao = new BookDao();
dao.deleteBook(num);

response.sendRedirect("../index.jsp?main=MyPage/bookListForFuture.jsp");





%>