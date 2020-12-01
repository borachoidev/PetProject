<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.UserDao" />
<jsp:useBean id="dto" class="data.dto.UserDto2" />

<jsp:setProperty property="*" name="dto" />

<% 
String pass=request.getParameter("pass");
String id=(String)session.getAttribute("myId");
boolean checkIdPass=dao.isIdPassCheck(id, pass);
//메서드 호출
if(checkIdPass){
	dao.updateUser(dto);
	response.sendRedirect("../index.jsp?main=MyPage/mypageMain.jsp");
}else{%>
<script type="text/javascript">
alert("비밀번호가 맞지 않습니다");
history.back();
</script>
<% }

%>
