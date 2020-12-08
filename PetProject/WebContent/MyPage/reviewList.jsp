<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dao.AdoptDao"%>
<%@page import="data.dto.AdoptDto"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.review__container{
		margin-top: 10%;
	}


</style>
</head>
<body>
<div class="review__container">
<%
request.setCharacterEncoding("utf-8");
String myId=(String)session.getAttribute("myId");

UserDao udao=new UserDao();
String user_num=udao.getNum(myId);


AdoptDao dao=new AdoptDao();

%>
	<div id="">
	<%
		int totalCount=dao.getMyCount(user_num); //총 글의 갯수
		int perPage=5; //한페이지당 보여지는 글의 갯수
		int perBlock=5; //한블럭당 보여지는 페이지번호의 수
		int currentPage;//현재페이지,만약 널값이면 1로 줌
		int totalPage; //총 페이지의 갯수
		int startNum;//한페이지당 보여지는 시작번호
		int endNum;//한페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작페이지번호
		int endPage; //한 블럭당 보여지는 끝페이지번호
		int no; //게시글에 붙일 시작번호
		
		//현재 페이지
		if(request.getParameter("pageNum")!=null)
			currentPage=Integer.parseInt(request.getParameter("pageNum"));
		else
			currentPage=1;
		//총 페이지수
		totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum=(currentPage-1)*perPage;
		endNum=startNum+perPage;
		//예를 들어 모두 45개의 글이 있을경우
		  //마지막 페이지는 endnum 이 45 가 되야함
		  if(endNum>totalCount)
				endNum=totalCount;
		
		//각 블럭에 보여질 시작 페이지번호와 끝 페이지 번호 구하기
		startPage= (currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//예를 들어 총 34페이지일경우
		//마지막 블럭은 30-34 만 보여야함
		if(endPage>totalPage)
		   endPage=totalPage;
		
		List<AdoptDto> list=dao.getMydogs(user_num);
		//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		no=totalCount-((currentPage-1)*perPage); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy년MM월dd일");
	 %>
	
	
	 <br><br>
	 <caption><b>내가 쓴 분양 게시판 글</b></caption>
	 	<table class="table table-striped">
	 		<tr style= "text-align:center; line-height: 10px; ">
	 		 	<td>번호</td>
	 		 	<td>내 용</td>
	 		 	<td>작성일</td>
	 		 	<td></td> 		 	
	 		</tr>
	 		<%if(totalCount==0){
	 			%>
	 			<tr align="center" height="50">
	 				<td colspan="5">
	 				<b>등록된 글이 없습니다</b>
	 				</td>
	 			</tr>
	 		<%} %>
	 	<%for(AdoptDto dto:list)
	 	{%>
			<tr style= "text-align:center;">
				<td>
					<%=dto.getAdopt_num()%></a>
				</td>	
				<td>

					<%=dto.getBreed()%>,<%=dto.getAge() %>
				<td>
					<%=sdf.format(dto.getWriteday())%>
				</td>
				<td>
					<button class="button"
					 onclick="location.href='index.jsp?main=Adopt/detailpage.jsp?adopt_num=<%=dto.getAdopt_num()%>&user_num=<%=user_num%>'">글로 이동</button>
				</td>
			</tr>	
	
	 	<%}
	 %>
	
	    </table>
	     <div style="float:right; display: block;"><b>총 <span style="color: #ffb900;"><%=totalCount%></span> 개의 글</b></div>
	  
	    <!-- 페이징처리 -->
	     <div style="width: 700px;" class="text-center">
		 <ul class="pagination">
		 <!-- 이전(첫블럭이 아니면 보이게하기) -->
		<%
		 if(startPage>1)
		 {%>
			<li>
			<a href="index.jsp?main=MyPage/reviewList.jsp?pageNum=<%=startPage-1%>">
			◀</a></li> 
		 <%}
		 %>	  
		 
		 <%
		 for(int i=startPage;i<=endPage;i++)
		 {%>
			<li>
			<a 
			style="color:<%=currentPage==i?"#ffb900":"#ddd"%>"
			href="index.jsp?main=MyPage/reviewList.jsp?pageNum=<%=i%>"><%=i%></a>
			</li> 
		 <%}
		 %>	
		 <!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
		 다음블럭의 startPage 로 가려면 어떻게 주어야할까요 -->
		 <%
		 if(endPage<totalPage)
		 {%>
			<li>
			<a href="index.jsp?main=MyPage/reviewList.jsp?pageNum=<%=endPage+1%>">
			▶</a></li> 
		 <%}
		 %>	 
		 </ul>	
		</div>
	</div>	

</div>


</body>
</html>
