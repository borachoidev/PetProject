<%@page import="data.dao.UserDao"%>
<%@page import="data.dao.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String myId = (String)session.getAttribute("myId");
	String dog_num=request.getParameter("dog_num");
	
	AccountDao dao=new AccountDao();
	
	// myId로 user_num 구하기
	UserDao udao = new UserDao();
	int user_num = Integer.parseInt(udao.getNum(myId));
	
	// 강아지 삭제
	dao.deleteAcc(dog_num);
	
	// 삭제한 강아지가 대표강아지이면 남은강아지 중에 한마리를 대표강아지로 선정
	if(dao.getDefault(myId).equals("empty")){
		
		int dogNum = dao.getFirstDog(user_num);
		System.out.println("dogNum:"+dogNum);
		
		dao.setDefault(dogNum);
	}
	response.sendRedirect("../index.jsp?main=MyPage/accUpdateList.jsp");

%>