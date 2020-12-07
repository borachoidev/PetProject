<%@page import="data.dto.AdoptCommentDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.AdoptDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.AdoptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.adopt__main{
display: flex;
flex-direction: column;
width:100%;
align-items: center;
justify-content: center;
}
.section1{
background-image: url('Image/back6.jpg');
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

   img.photo{
      width: 200px;
      height: 230px;
   }
 
   #adopt__container {
      display: flex;
      justify-content: center;
      flex-direction: column;
   }
  div.footer{
	  display: flex;
	  justify-content: flex-end ;
	  flex-direction: row;
	  margin: 0px 0px;
   }
   #adopt__add{
   	 display: inline;
   }
</style>
<title>Insert title here</title>
<script>
   $(function(){
      $("a.godetail").click(function(e){
         e.preventDefault();        
         var adopt_num=$(this).attr("adopt_num");
         var user_num=$(this).attr("user_num");
         location.href="index.jsp?main=Adopt/detailpage.jsp?adopt_num="+adopt_num+"&user_num="+user_num;
      });
   });
</script>
</head>
<%
//dao 선언
AdoptDao dao=new AdoptDao();
//세션으로 부터 key, value 가져오기
int totalCount=dao.getTotalCount();
int perPage=10;//한페이지당 보여질 글의 갯수
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
endPage=startPage+perBlock+1;
//마지막 블럭은 endPage를 totalPage로 해놔야한다
if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 불러올 글 번호 구하기
//예: 1페이지: 1~2, 2페이지:3~4...
start=(currentPage-1)*perPage;

//마지막 글 번호는 총 글수와 같은 번호여야 한다
int no=totalCount-(currentPage-1)*perPage;

//출력할 목록 가져오기
List<AdoptDto> list=dao.getAlldogs(start, perPage);

/* String adopt_num=request.getParameter("adopt_num"); */

/* AdoptDto adto=dao.getData(adopt_num); */

%>
<body>
<div class="adopt__main">
<div class="section1">
		   <div class="item"><!-- 사진표시를 위한div --></div>
		   <div class="item program" id="program1">
			   <div  class="program__title"><h1>ADOPT</h1> <h2>가정분양</h2></div>
			  	<div class="program__description animate__animated " id="programDescription1">
			   펫앤미에서 새 식구를 만나보세요.
			    </div>
		</div>    
</div>
	<div id="adop__container">
		<header>
			<div id="category">
			<h1>
			<button type="button" class="btn btn-outline-light text-dark" onclick="location.href='index.jsp?main=Adopt/adoptlist.jsp'">가정 분양 게시판</button>
			<button type="button" class="btn btn-outline-light text-dark" onclick="location.href='index.jsp?main=Adopt/abandonlist.jsp'">유기견 분양 게시판</button>
			</h1>
			</div>
		</header>
		<main>
			<div class="board">
	   			<table class="adopttable table table-bordered" style="width: 800px;">   
			      <tr>
			      <%
			      SimpleDateFormat sdf=new SimpleDateFormat("yyyy년MM월dd일");
			      NumberFormat nf=NumberFormat.getCurrencyInstance();
			      int e=0;
			      for(AdoptDto dto:list)
			      {
			         String photo=dto.getPhoto().split(",")[0]; 
			         List<AdoptCommentDto> alist=dao.getCommentList(dto.getAdopt_num());
			      %> 
			         <td>
			         <a adopt_num="<%=dto.getAdopt_num()%>"
			            user_num="<%=dto.getUser_num()%>"
			            style="cursor:pointer;" class="godetail">
			            <img src="adoptsave/<%=photo%>" class="photo">
			            <br><%=dto.getBreed()%> <%=dto.getAge()%>개월 분양 [<%=alist.size() %>]        
			            <br><%=sdf.format(dto.getWriteday()) %> 💛:<%=dto.getLikes() %>         
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
				<!-- 페이징 처리 --> 
					<div class="footer">
						<%
						if(totalCount>0)
						{%>
						<ul class="pagination">
						<%
							//이전
							if(startPage>1)
							{%>
								<li class="page-item disabled"><a class="page-link" 
								href="index.jsp?main=Adopt/adoptlist.jsp?pageNum=<%=startPage-1%>">Previous</a></li>
							<%}
							for(int i=startPage;i<=endPage;i++)
							{
								String url="index.jsp?main=Adopt/adoptlist.jsp?pageNum="+i;
								
								if(e==currentPage)
								{%>
									<li class="page-item"><a class="page-link" href="<%=url%>"><%=i%></a></li>
									<%}else{%>
										<a href="<%=url%>"><%=i%>&nbsp;</a>
									<%}
							}						
							//다음 
							if(endPage<totalPage)
							{%>
								<li class="page-item"><a class="page-link" 
								href="index.jsp?main=Adopt/adoptlist.jsp?pageNum=<%=endPage+1%>">Next</a></li>
							<%}
						%>
							</ul>	
						<div id="adopt__add">
						  <button type="button" class="btn btn-outline-primary"style="width: 110px;"
						  onclick="location.href='index.jsp?main=Adopt/adoptForm.jsp?'">강아지 등록</button>
						   <%String loginOk=(String)session.getAttribute("loginOk");	
							String myId=(String)session.getAttribute("myId"); 
							if(loginOk==null){%>
							<script>
							$("#btn_add").hide();
							</script>
						<%}else{
							if(loginOk.equals("success")){%>
							<script>
							$("#btn_add").show();
							</script>
							<%}
						}
						%>
						</div>
					<%}
					%>
					</div>
		
			</div>
		</main>
		</div>
</div>		
</body>
</html>