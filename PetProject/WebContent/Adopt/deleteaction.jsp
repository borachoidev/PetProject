<%@page import="java.io.File"%>
<%@page import="data.dao.AdoptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num,pageNum 읽기
	String adopt_num=request.getParameter("adopt_num");
	String pageNum=request.getParameter("pageNum");

	
	AdoptDao dao=new AdoptDao();
	
	String photo=dao.getData(adopt_num).getPhoto();
	
	String realPath=getServletContext().getRealPath("/adoptsave");
	
	File file=new File(realPath+"\\"+photo);
	
	file.delete();
	
	dao.deleteAdopt(adopt_num);
	
	response.sendRedirect("../index.jsp?main=Adopt/adoptlist.jsp");
%>