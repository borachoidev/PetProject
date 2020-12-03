<%@page import="data.dao.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String dog_num=request.getParameter("dog_num");
	
	AccountDao dao=new AccountDao();
	
	dao.deleteAcc(dog_num);
	
	response.sendRedirect("../index.jsp?main=MyPage/accUpdateList.jsp");

%>