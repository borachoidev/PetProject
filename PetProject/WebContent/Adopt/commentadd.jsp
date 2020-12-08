<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.AdoptDao"%>
<%@page import="data.dto.AdoptDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdoptDao Dao=new AdoptDao();
	UserDto udto=new UserDto();

	request.setCharacterEncoding("utf-8");
	String adopt_num=request.getParameter("adopt_num");
	String user_num=request.getParameter("user_num");
	
	
%>

<jsp:useBean id="dto" class="data.dto.AdoptCommentDto"/>
<jsp:useBean id="dao" class="data.dao.AdoptDao"/>

<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertComment(dto);
	
	String go="../index.jsp?main=Adopt//detailpage.jsp?adopt_num="+adopt_num+"&user_num="+user_num+"#adopt__addComm";
	response.sendRedirect(go);

%>