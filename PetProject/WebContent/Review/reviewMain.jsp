
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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>


<style type="text/css">
#cl-dashboard{display: none;}
.review__container{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	}

.owl-carousel .owl-dots.disabled, .owl-carousel .owl-nav.disabled {
    display: none;
}
</style>
    <script>
  const showing_class = "showing";
  const firstslide = document.querySelector(".slide:nth-child(1)");
  const lastslide = document.querySelector(".slide:nth-child(4)");
  const left_btn = document.querySelector(".left");
  function right_move(){
    const currentslide = document.querySelector(".showing");
    if (currentslide) {
    const nextslide = currentslide.nextElementSibling;
      currentslide.classList.remove(showing_class);
      if(nextslide != left_btn){
        nextslide.classList.add(showing_class);
      }
      else{
        firstslide.classList.add(showing_class);
      }
    }
  }
  function left_move(){
    const currentslide = document.querySelector(".showing");
    if (currentslide){
    const prevslide = currentslide.previousElementSibling;
      currentslide.classList.remove(showing_class);
      if(prevslide){
        prevslide.classList.add(showing_class);
      }
      else{
        lastslide.classList.add(showing_class);
      }
    }


  }
  
  window.onload=function(){
	  var target =document.getElementById("carouselControls").innerHTML;
	  var img_tag = /<img[^>]+\>/i;
console.log(target)
	  target = target.replace(/<img[^>]+\>/gi, "");
	  
document.getElementById("carouselControls").innerHTML=target


	  
  }

  

  </script>
</head>
<body>
<div class="review__container">
<%
ReviewDao db=new ReviewDao();
List<ReviewDto> best=db.getBestReview();
%>
<!-- best리뷰 -->
	<div id="bestReview">
		<div class="carousel slide" id="carouselControls" data-interval="false" >
		  <div class="carousel-inner">
		  <!-- 캐러셀 아이템 -->
		    <div class="carousel-item active">
			      	<div class='reviews__list-item'>
					    <header>
					    <h3 class='review__title'><%= best.get(0).getTitle()%></h3>
					    <h4 class='review__author'><%= best.get(0).getId()%></h4>
					    </header>
					    <div class='review__body'>
					   <%= best.get(0).getContent()%>
					    </div>
					</div>
		    </div>
		    <% //for 반복문
		    for(int i=1;i<best.size();i++){%>
		    <div class="carousel-item">
		      	<div class='reviews__list-item'>
				    <header>
				    <h3 class='review__title'><%= best.get(i).getTitle()%></h3>
				    <h4 class='review__author'><%= best.get(i).getId()%></h4>
				    </header>
				    <div class='review__body' >
				  <%= best.get(i).getContent()%>
				    </div>
				</div>
		    </div>
		    <% }%>
		  </div>
		  <!-- 캐러셀 이동버튼 -->
		  <a class="carousel-control-prev" href="#carouselControls" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselControls" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	
	<!-- 전체리뷰 -->
	<div id="totalReview">
	<%
		
		//페이징 처리에 필요한 변수들	
		int totalCount=db.getTotalCount(); //총 글의 갯수
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
		
		List<ReviewDto> list=db.getList(startNum,endNum);
		//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		no=totalCount-((currentPage-1)*perPage);
	%>
	 <b>총 <span style="color: red;"><%=totalCount%></span>
	 개의 글이 있습니다</b>
	 
	 <br><br>
	 <div >
	 	<table class="table ">
	 		<tr>
	 		 	<td>번호</td>
	 		 	<td>제 목</td>
	 		 	<td>작성자</td>
	 		 	<td>작성일</td> 		 	
	 		</tr>
	 		<%if(totalCount==0){
	 			%>
	 			<tr align="center" height="50">
	 				<td colspan="5">
	 				<b>등록된 글이 없습니다</b>
	 				</td>
	 			</tr>
	 		<%} %>
	 	<%for(ReviewDto dto:list)
	 	{%>
			<tr>
				<td><%=no-- %></td>
				<td>
					<a style="color: black;" 
					href="index.jsp?main=Review/content.jsp?num=<%=dto.getReview_num()%>&pageNum=<%=currentPage%>">
					<%=dto.getTitle()%></a>
				</td>	
				<td><%=dto.getId()%></td>
				<td>
					<%=dto.getWriteday()%>
				</td>
			</tr>			
	 	<%}
	 %>
	
	    </table>
	</div>    
	    <!-- 페이징처리 -->
	     <div style="width: 700px;" class="text-center">
		 <ul class="pagination">
		 <!-- 이전(첫블럭이 아니면 보이게하기) -->
		<%
		 if(startPage>1)
		 {%>
			<li>
			<a href="index.jsp?main=Review/reviewMain.jsp?pageNum=<%=startPage-1%>">
			◀</a></li> 
		 <%}
		 %>	  
		 
		 <%
		 for(int i=startPage;i<=endPage;i++)
		 {%>
			<li>
			<a 
			style="color:<%=currentPage==i?"red":"black"%>"
			href="index.jsp?main=Review/reviewMain.jsp?pageNum=<%=i%>"><%=i%></a>
			</li> 
		 <%}
		 %>	
		 <!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
		 다음블럭의 startPage 로 가려면 어떻게 주어야할까요 -->
		 <%
		 if(endPage<totalPage)
		 {%>
			<li>
			<a href="index.jsp?main=Review/reviewMain.jsp?pageNum=<%=endPage+1%>">
			▶</a></li> 
		 <%}
		 %>	 
		 </ul>	
		</div>
	</div>	

</div>
</body>
</html>
