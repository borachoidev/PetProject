<%@page import="data.dto.AdoptDto"%>
<%@page import="data.dao.AdoptDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //업로드할 경로 구하기
   String uploadPath=getServletContext().getRealPath("/adoptsave");
   System.out.println(uploadPath);
   //업로드할 이미지의 사이즈
   int uploadSize=1024*1024*2;
   
   MultipartRequest multi=null;
   try{
      multi=new MultipartRequest(request,uploadPath,uploadSize,
            "utf-8",new DefaultFileRenamePolicy());
      String adopt_name=multi.getParameter("adopt_name");
      String age=multi.getParameter("age");
      String breed=multi.getParameter("breed");
      String gender=multi.getParameter("gender");
      String vaccine=multi.getParameter("vaccine");
      String title=multi.getParameter("title");
      String content=multi.getParameter("content");
      String user_num=multi.getParameter("user_num");
      String photo="";
      
      Enumeration en=multi.getFileNames();
      while(en.hasMoreElements())
      {
         String name=(String)en.nextElement();
         //name에 들어있는 이미지명 가져오기
         String fileName=multi.getFilesystemName(name);
         if(fileName!=null)
         {
            if(photo.length()==0)
               photo=fileName;
            else
               photo+=","+fileName;
         }
      }
      
      //dao선언
      AdoptDao dao=new AdoptDao();
      //dto에 데이터 넣기
      AdoptDto dto=new AdoptDto();
      dto.setAdopt_name(adopt_name);
      dto.setAge(age);
      dto.setBreed(breed);
      dto.setGender(gender);
      dto.setVaccine(vaccine);
      dto.setPhoto(photo);
      dto.setContent(content);
      dto.setUser_num(user_num);
      
      //db에 추가
      dao.insertAdopt(dto);

      //다시 게시판으로 이동
      response.sendRedirect("../index.jsp?main=Adopt/adoptlist.jsp");
   }catch(Exception e){
      System.out.println("업로드 오류:"+e.getMessage());
   }
%>