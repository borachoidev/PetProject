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
   img.photo{
      width: 200px;
      height: 230px;
   }
   div.thumnail{
      margin-left: 20px;
   }
   
</style>
<title>Insert title here</title>
<script>
   $(function(){
      $("a.godetail").click(function(e){
         e.preventDefault();
         
         var adopt_num=$(this).attr("adopt_num");
         location.href="index.jsp?main=Adopt/detailpage.jsp?adopt_num="+adopt_num;
      });
   });
</script>
</head>
<%
//dao 선언
AdoptDao dao=new AdoptDao();
//세션으로 부터 key, value 가져오기

int totalCount=dao.getTotalCount();
int perPage=8;//한페이지당 보여질 글의 갯수
int perBlock=10;//한블럭당 출력할 페이지의 갯수
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

//출력할 목록 가져오기
List<AdoptDto> list=dao.getAlldogs(start, perPage);

%>
<body>
<div>
	<caption>가정 분양 게시판</caption>
   <table class="adopttable table table-bordered" style="width: 800px;">
         <td>
          <button type="button" class="btn btn-info"style="width: 150px;"
          onclick="location.href='index.jsp?main=Adopt/adoptForm.jsp'">강아지 등록</button>
         </td>
      <tr>
      <%
      NumberFormat nf=NumberFormat.getCurrencyInstance();
      int e=0;
      for(AdoptDto dto:list)
      {
         String photo=dto.getPhoto().split(",")[0];
      
      %> 
         <td>
         <div class="thumnail">
         <a adopt_num="<%=dto.getAdopt_num()%>"
            style="cursor:pointer;" class="godetail">
            <img src="adoptsave/<%=photo%>" class="photo">

            <%=dto.getBreed()%> <%=dto.getAge()%>개월 분양
            
         </a>
         </div>
         </td>
         <%
         if((e+1)%4==0)
         {%>
            </tr>
            <tr>
         <%}
         e++;
         
      }
      %>   
      </tr>
   </table>
</div>
<!-- 페이징 처리 -->
<%
if(totalCount>0)
{%>
<div style="width: 800px;text-align: center;">
	<ul class="pagination">
	<%
		//이전
		if(startPage>1)
		{%>
			<li><a href="index.jsp?main=Adopt/adoptlist.jsp?pageNum=<%=startPage-1%>">
			이전</a></li>
		<%}
		for(int i=startPage;i<=endPage;i++)
		{
			String url="index.jsp?main=Adopt/adoptlist.jsp?pageNum="+i;
			
			if(e==currentPage)
			{%>
				<li class="active">
					<a href="<%=url%>"><%=i%></a></li>
				<%}else{%>
					<li><a href="<%=url%>"><%=i%></a></li>
				<%}
		}				

			
		//다음 
		if(endPage<totalPage)
		{%>
			<li><a href="index.jsp?main=Adopt/adoptlist.jsp?pageNum=<%=endPage+1%>">
			다음</a></li>
		<%}
	%>
	
	</ul>
</div>	
<%}
%>
</body>
</html>