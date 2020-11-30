<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="data.dto.MungCommentDto"/>	
<jsp:useBean id="dao" class="data.dao.MungDao"/>	
<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertComment(dto);
	
%>
<script>
	location.href="index.jsp?main=Mung/mungAccount.jsp";
</script>
