<%@page import="data.dao.UserDao"%>
<%@page import="data.dao.AccountDao"%>
<%@page import="data.dto.AccountDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//업로드할 저장 폴더의 실제 서버에서의 위치구하기
	
	String realPath=getServletContext().getRealPath("/AccSave");
	System.out.println(realPath);
	int uploadSize=1024*1024*100;
	
	
	MultipartRequest multi=null;
	try{
		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
		//입력한 데이터 읽기
		String acc_name=multi.getParameter("accName");
		String breed=multi.getParameter("accBreed");
		String weight=multi.getParameter("accWeight");
		String age=multi.getParameter("accAge");
		String gender=multi.getParameter("accGender");
		String memo=multi.getParameter("accMemo");
		String user_num=multi.getParameter("user_num");
		String photo=multi.getFilesystemName("accPhoto");
		int sel_acc=Integer.parseInt(multi.getParameter("sel_acc"));

		System.out.println(breed+weight+age+gender+memo+photo);
	
		//dto에 넣기
		AccountDto dto=new AccountDto();
		dto.setAcc_name(acc_name);
		dto.setBreed(breed);
		dto.setWeight(weight);
		dto.setAge(age);
		dto.setGender(gender);
		dto.setPhoto(photo);
		dto.setMemo(memo);
		dto.setUser_num(user_num);
		dto.setSel_acc(sel_acc);
		
		
		//dao선언
		AccountDao dao=new AccountDao();

		//메서드 호출
		dao.insertAcc(dto);

		//페이지로 이동
		response.sendRedirect("../index.jsp?main=MyPage/accUpdateList.jsp");
		
		
	}catch(Exception e){
		System.out.println("업로드 오류:"+e.getMessage());
	}
	
	
	
	

%>