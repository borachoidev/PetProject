<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.MungPostDto"%>
<%@page import="data.dao.MungDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");

	//세션데이터 얻기
	String myId=(String)session.getAttribute("myId");
	String accId=(String)session.getAttribute("accId");

	//업로드할 경로 (mongSave 폴더)
	String uploadPath=getServletContext().getRealPath("/mungSave");
	
	//업로드할 이미지파일 사이즈(20mb)
	int uploadSize=1024*1024*20;
	
	//이미지파일 담을 리스트
	ArrayList<String> imgArr=new ArrayList<String>();
	
	
	//데이터 읽어오기
	MultipartRequest multi=null;
	try {
		multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String photo="";
		//file타입인 요소만 name값을 얻는다
		Enumeration en=multi.getFileNames();
		while(en.hasMoreElements()) {
			String name=en.nextElement().toString();
			String fileName=multi.getFilesystemName(name);
			if(fileName!=null) {
				if(photo.length()==0) {
					photo=fileName;
				}else {
					photo+=","+fileName;
				}
			}	
		}
		String content=multi.getParameter("content").replaceAll("\\p{Z}", "");;		
		String tag=multi.getParameter("tag");	
		
		//데이터 DB에 추가
		MungDao dao=new MungDao();
		MungPostDto dto=new MungPostDto();
		
		String user_num=dao.getUser(myId).toString();
		String dog_num=dao.getAccount(accId).toString();
		
		dto.setPhoto(photo);
		dto.setContent(content);
		dto.setTag(tag);
		dto.setDog_num(dog_num);
		dto.setUser_num(user_num);
		
		dao.insertPost(dto);
		
		//계정 페이지로 이동
		String accPram=  URLEncoder.encode(accId, "UTF-8");
		String url="../index.jsp?main=Mung/mungAccount.jsp?acc_name="+accPram;
		response.sendRedirect(url);
		
	} catch(Exception e) {
		System.out.println("업로드 오류: "+e.getMessage());
	}
%> 
%>