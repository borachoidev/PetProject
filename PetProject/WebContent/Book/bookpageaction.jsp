<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String loginOk = (String)session.getAttribute("loginOk");
	
	
	
	
	response.sendRedirect("../index.jsp?main=Book/bookSelect.jsp");
	/* if(loginOk==null) */ 
	%>
		<!-- <script type="text/javascript">
		alert("먼저 로그인을 해주세요");
		history.back();
		</script> -->
	<%
	// }else{
	//	response.sendRedirect("../index.jsp?main=Book/bookSelect.jsp");
	//}
%>