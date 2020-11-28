
<%@page import="data.dao.AccountDao"%>
<%@page import="data.dao.UserDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
세션에 저장
아이디 myid:로그인 한아이디를 저장
아이디 저장 체크박스 상태: 체크를 하면 saveid에 yes저장, 체크를 안하면 	null
로그인에 성공시 loginok success저장
--%>

<%
//id,pass,saveid읽기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//dao선언
	
UserDao dao=new UserDao();
AccountDao adao=new AccountDao();
String accId=adao.getDefault(id);
if(accId.equals(""))
{
	accId="no";
}

System.out.println(accId+id+pass);
//loginProcess호출
int log = dao.loginProcess(id, pass);
//아이디가 DB명단에 없을 경우 1반환
//아이디는 있는데 비번이 안맞는 경우 2반환
//아이디와 비번 모두 맞는 경우 3반환

//위의 결과 3인경우만 세션에 위에 설명대로 저장및 삭제후 메인으로 index 이동
//나머지 경우는 적절한 경고창과 함께 이전페이지로 이동
switch(log){
case 1:
	%>
	<script type="text/javascript">
	alert("없는 아이디입니다.");
	history.back();
	</script>
	<%
	break;
case 2:
	%>
	<script type="text/javascript">
	alert("비밀번호가 틀렸습니다");
	history.back();
	</script>
	<%
	break;
case 3:
	session.setAttribute("myId", id);
	session.setAttribute("loginOk", "success");
	session.setAttribute("accId", accId);
	//세션유지시간
	session.setMaxInactiveInterval(60*60*3); //3시간
	response.sendRedirect("../index.jsp");
	break;
}
%>
