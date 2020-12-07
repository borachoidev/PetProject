<%@page import="data.dao.AdoptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adopt_num=request.getParameter("adopt_num");

	AdoptDao dao=new AdoptDao();
	
	dao.adoptUpdateLikes(adopt_num);
	
	/* int likes=dao.getData(adopt_num).getLikes();  */

/* <?xml version="1.0" encoding="UTF-8"?> */
%>
<%-- <likes><%=likes%></likes> --%>