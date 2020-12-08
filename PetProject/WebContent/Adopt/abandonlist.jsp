<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.AdoptCommentDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="api.data.AbandonDto"%>
<%@page import="java.util.List"%>
<%@page import="api.data.Abandon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	img.photo:hover{
		opacity: 0.5;
	}
	
   img.photo{
      width: 200px;
      height: 230px;
      margin-bottom: 5px;
   }
 
   #adopt__container {
      display: flex;
      justify-content: center;
      flex-direction: column;
   }
  .footer{
	  display: flex;
	  justify-content: flex-end ;
	  flex-direction: row;
	  margin: 0px 0px;
   }
   #btn__add{
   	 display: inline;
   }
   
   .adopt__main{
display: flex;
flex-direction: column;
width:100%;
align-items: center;
justify-content: center;
}
.section1{
background-image: url('Image/back7.jpg');
width: 100%;
background-size: 100%;
    background-attachment: fixed;
    background-repeat: no-repeat;
}
.item {
	height: 20vh;
	width:100%;
	background-color: white;
 
}
.item:nth-child(1){
    background-color: transparent;
    height: 50vh;
    width:100%;
  }
  
.program{
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;

}

.program__description
{
width:60%;
color:#797979;}  

.program__title h1{
color:#ffb900;
}

.program__title h2{
color:#797979;
}

.adopt__day {
	font-size: 0.9em;
	color: gray;
}
</style>
<title>Insert title here</title>
<script>
   $(function(){
      $("a.godetail").click(function(e){
         e.preventDefault();        
         var getDesertionNo=$(this).attr("DesertionNo");
         location.href="index.jsp?main=Adopt/detailpage2.jsp?desertionNo="+getDesertionNo;
      });
   });
</script>
</head>
<%
//dao 선언

request.setCharacterEncoding("utf-8");
Abandon dao = new Abandon();
ArrayList<AbandonDto> list=dao.getAbandonList();
/* 
//세션으로 부터 key, value 가져오기
int totalCount=60;
int perPage=8;//한페이지당 보여질 글의 갯수
int perBlock=3;//한블럭당 출력할 페이지의 갯수
int totalPage;//총 페이지의 갯수
int startPage;//각 블럭당 시작페이지 번호
int endPage;//각 블럭당 끝페이지 번호
int start;//각 블럭당 불러올 글의 시작번호
int end;//각 블럭당 불러올 글의 끝 번호
int currentPage;//현재 보여질 페이지번호
//현재 페이지 번호 구하기
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
start=(currentPage-1)*perPage;

//마지막 글 번호는 총 글수와 같은 번호여야 한다
int no=totalCount-(currentPage-1)*perPage;
 */
//출력할 목록 가져오기

/* List<AdoptDto> list=dao.getAlldogs(start, perPage); */
 
/* String adopt_num=request.getParameter("adopt_num"); */

/* AdoptDto adto=dao.getData(adopt_num); */

%>
<body>
<div class="adopt__main">
<div class="section1">
		   <div class="item"><!-- 사진표시를 위한div --></div>
		   <div class="item program" id="program1">
			   <div  class="program__title"><h1>ADOPT</h1> <h2>유기견분양</h2></div>
			  	<div class="program__description animate__animated " id="programDescription1">
			   사지말고 입양하세요. 반려동물과 함께 한다는 것은 생각보다 많은 책임감이 필요합니다. 유기견 아이들은 한 번 상처를 받은 아이들이기 때문에 사람에 대해 거부감이 있을 수 있으며, 새로운 가족에게 적응하기에 시간이 필요합니다.
			    </div>
		</div>    
</div>
	<div id="adopt__container">
		<header>
			<div id="category">
			<h2>
			<button type="button" class="btn btn-outline-warning" onclick="location.href='index.jsp?main=Adopt/adoptlist.jsp'">가정 분양 게시판</button>
			<button type="button" class="btn btn-outline-warning" onclick="location.href='index.jsp?main=Adopt/abandonlist.jsp'">유기견 분양 게시판</button>
			</h2>
			</div>
		</header>
		<main>
			<div class="board">
	   			<table class="adopttable table table-bordered" style="width: 800px;">   
			      <tr>
			      <%
			      int e=0;
			      for(AbandonDto dto:list)
			      {
			         String photo=dto.getPopfile().split(",")[0]; 
				     String year=dto.getNoticeSdt().substring(0,4);
				     String month=dto.getNoticeSdt().substring(4,6);
				     String day=dto.getNoticeSdt().substring(6);
			      %> 
			         <td>
			         <a desertionNo="<%=dto.getDesertionNo()%>"
			            style="cursor:pointer;" class="godetail">
			            <img src="<%=photo%>" class="photo">
			            <br> <%=dto.getKindcd().replace("[개]","")%> <%=dto.getAge()%>     
			            <br><span class="adopt__day"><%=year+"."+month+"."+day%></span>       
			         </a>
			         </td>
			         <%
			         if((e+1)%5==0)
			         {%>
			       </tr>
	     	       <tr>
			         <%}e++;}%>   
	     		   </tr>
	    		</table>
				<%-- <!-- 페이징 처리 --> 
					<div class="footer">
						<%
						if(totalCount>0)
						{%>
						<ul class="pagination" style="width:500px;">
						<%
							//이전
							if(startPage>1)
							{%>
								<li><a href="index.jsp?main=Adopt/abandonlist.jsp?pageNum=<%=startPage-1%>">
								이전</a></li>
							<%}
							for(int i=startPage;i<=endPage;i++)
							{
								String url="index.jsp?main=Adopt/abandonlist.jsp?pageNum="+i;
								
								if(e==currentPage)
								{%>
										<a href="<%=url%>"><%=i%>&nbsp;</a>
									<%}else{%>
										<a href="<%=url%>"><%=i%>&nbsp;</a>
									<%}
							}						
							//다음 
							if(endPage<totalPage)
							{%>
								<a href="index.jsp?main=Adopt/abandonlist.jsp?pageNum=<%=endPage+1%>">
								다음</a>
							<%}
						%>
							</ul>	
										
						</div>
					<%}
					%>
					</div> --%>
		
			</div>
		</main>
		</div>
</div>		
</body>
</html>