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
		margin-top: 1.5%;
		width:100%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		
	}
	
.paging{
display: flex;
flex-direction:row;
justify-content: flex-end; 
width:70%;

}
.review__tb caption{
caption-side: top;}
.review__tb{
width:70%;
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

	<%
		int totalCount=dao.getMyCount(user_num); //총 글의 갯수
		int perPage=10; //한페이지당 보여지는 글의 갯수
		int perBlock=3; //한블럭당 보여지는 페이지번호의 수
		int currentPage;//현재페이지,만약 널값이면 1로 줌
		int totalPage; //총 페이지의 갯수
		int startNum;//한페이지당 보여지는 시작번호
		int endNum;//한페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작페이지번호
		int endPage; //한 블럭당 보여지는 끝페이지번호
		int no; //게시글에 붙일 시작번호
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null)
			currentPage=1;//페이지 번호가 없을경우 무조건 1페이지로 간다
		else
			currentPage=Integer.parseInt(pageNum);
		//총 페이지 구하기
		//나머지가 있을경우에는 1페이지 더 추가
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
		//시작페이지와 끝페이지 구하기
		//예:한페이지당 3개만 볼 경우 현재 페이지가 2라면 sp:1, ep:3
		//현재 페이지가 7이라면 sp:3, ep:9
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//마지막 블럭은 endPage를 totalPage로 해놔야한다
		if(endPage>totalPage)
			endPage=totalPage;

		//각 페이지에서 불러올 글 번호 구하기
		//예: 1페이지: 1~2, 2페이지:3~4...
		startNum=(currentPage-1)*perPage;
		endNum=startNum+perPage-1;

		//마지막 글 번호는 총 글수와 같은 번호여야 한다
		if(endNum>totalCount)
			endNum=totalCount;
		
		List<AdoptDto> list=dao.getMydogs(user_num,startNum,endNum);
		//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy년MM월dd일");
	 %>
	
	
	 <br><br>

	 	<table class="table review__tb">
	 	 <caption><b>내가 쓴 분양 게시판 글</b></caption>
	 		<tr style= "text-align:center; line-height: 10px; ">
	 		 	<td style="vertical-align: center;">번호</td>
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
				<td style="vertical-align: middle;">
					<%=dto.getAdopt_num()%>
				</td>	
				<td style="vertical-align: middle;">

					<%=dto.getBreed()%>,<%=dto.getAge() %>
				<td style="vertical-align: middle;">
					<%=sdf.format(dto.getWriteday())%>
				</td>
				<td style="vertical-align: middle;">
					<button class="button"
					 onclick="location.href='index.jsp?main=Adopt/detailpage.jsp?adopt_num=<%=dto.getAdopt_num()%>&user_num=<%=user_num%>'">글로 이동</button>
				</td>
			</tr>	
	
	 	<%}
	 %>
	
	    </table>
	    
	    <div class="paging">
	    
	  
	    <!-- 페이징처리 -->
	     <div class="text-center"  style= "width: 50%;text-align:center;">
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
			style="color:<%=currentPage==i?"#F9690E":"#FFA400"%>"
			href="index.jsp?main=MyPage/reviewList.jsp?pageNum=<%=i%>">&nbsp;<%=i%></a>
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
		 <div><b>총 <span style="color: #ffb900;"><%=totalCount%></span> 개의 글</b></div>
		</div>


</div>


</body>
</html>
