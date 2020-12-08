<?xml version ="1.0" encoding="UTF-8"?>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.BookDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<list>
<%
	request.setCharacterEncoding("utf-8");
	String puppyNum = request.getParameter("puppyNum");
	int n = Integer.parseInt(puppyNum);
	
	String myId = (String)session.getAttribute("myId");
	BookDao bdao = new BookDao();

	List<HashMap<String,String>> list = bdao.getPuppyList(myId);

	
	if(true)
	{
		HashMap<String,String> map = list.get(n);
		System.out.println(map.get("photo"));
	%>
		<puppyNum>
			<photo><%=map.get("photo") %></photo>
			<acc_name><%=map.get("acc_name") %></acc_name>
			<breed><%=map.get("breed") %></breed>
			<age><%=map.get("age") %></age>
		</puppyNum>
	<%}
%>
	
</list>	
	
