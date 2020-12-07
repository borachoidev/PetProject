<%@page import="data.dto.ReviewDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<%
	ReviewDao db=new ReviewDao();
	
	MultipartRequest multi=null;
	String realFolder=getServletContext().getRealPath("/save2");
	int uploadSize=1024*1024*2;
	
	try{
		multi=new MultipartRequest(request,realFolder,
				uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String title=multi.getParameter("title");
		String id=multi.getParameter("id");
		String content=multi.getParameter("content");
		String book_num=multi.getParameter("book_num");
		
		ReviewDto dto=new ReviewDto();
		dto.setContent(content);
		dto.setId(id);
		dto.setTitle(title);
		dto.setBook_num(book_num);
		
		db.insertSmart(dto);
		int num=db.getMaxNum();
		
		String path="../index.jsp?main=Review/reviewMain.jsp?num="+num+"&pageNum=1";
		response.sendRedirect(path);
		
		

	}catch(Exception e){
		out.write("파일 업로드 오류:"+e.getMessage());
	}
%>
<body>

</body>
</html>

