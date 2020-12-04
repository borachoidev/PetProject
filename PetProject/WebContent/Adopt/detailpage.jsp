<%@page import="data.dto.AdoptCommentDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.AdoptDto"%>
<%@page import="data.dao.AdoptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #adopt__detail{
   	display: flex;
   	justify-content: center;
   	flex-direction: column;
   }
</style>
<script type="text/javascript">
   $(function(){
      $("span.delete").click(function(){
    	  var a=confirm("삭제하려면[확인]을 눌러주세요")
    	  if(a){
    		  var idx=$(this).attr("idx");
    		  $.ajax({
    			  type:"get",
    			  dataType:"html",
    			  url:"Adopt/commetndel.jsp",
    			  data:{"idx":idx},
    			  success:function(data){
    				  location.reload();
    			  }
    		  });
    	  }
      });
 
 	  $("button.likes").click(function(){
    	  var adopt_num=$(this).attr("adopt_num");
    	  var a=confirm("좋아요")
    	  if(a){
    		  $.ajax({
    		 	 type:"get",
	    		  dataType:"html",
	    		  url:"Adopt/adoptlikes.jsp",
	    		  data:{"adopt_num":adopt_num},
	    		  success:function(data){
    			  	location.reload();
    			  }
    		 });
    	 }
      });
   })

</script>
</head>
<%  
   String adopt_num=request.getParameter("adopt_num");
   String user_num=request.getParameter("user_num");
   String myId=(String)session.getAttribute("myId");
   String loginOk=(String)session.getAttribute("loginOk");
   
   AdoptDao dao=new AdoptDao();
   AdoptDto dto=dao.getData(adopt_num);
   
   UserDao udao=new UserDao();
   UserDto udto=udao.getInfo(user_num);

   String id=udto.getId();//글쓴이 id
   
   String photo=dto.getPhoto();
   String breed=dto.getBreed();
   String gender=dto.getGender();
   String age=dto.getAge();
   String vaccine=dto.getVaccine();
   String content=dto.getContent();
   String adopt_name=dto.getAdopt_name();
   String comm_num=dto.getComm_num();
   int likes=dto.getLikes();
   
   
   
	AdoptDao adao=new AdoptDao();
 	List<AdoptCommentDto> alist=adao.getCommentList(dto.getAdopt_num());

   
%> 

<body>
	<div id="adopt__detail">
		<header>
			<h2>분양 정보</h2>
		</header>
	  	<main>	
	  	 <table style="width: 1000px;">
	      <tr>
	         <td class="photo" rowspan="6" style="width: 500px;">
	               <img src="adoptsave/<%=photo%>">         
	          </td>
	       </tr>
	       <tr>   
	          <td>이름 : <%=dto.getAdopt_name()%></td>   
	        </tr> 
	        <tr>
	         		<td>견종 : <%=dto.getBreed() %></td>
	         </tr>
	         <tr>		
	         		<td>성별 : <%=dto.getGender() %></td>   
	         </tr>
	         <tr>		  
	         		<td>나이 : <%=dto.getAge() %>개월 </td>  
	         </tr>
	         <tr>		
	         		<td><%=dto.getVaccine() %></td>
	         </tr>
	         <tr>		
	         		<td><pre><%=dto.getContent() %></pre></td>
	         </tr>
	</table>
	<table>
		<ul>
			 <button type="button" class="likes"id="btn_likes"
			 style="width: 50px;" adopt_num="<%=adopt_num%>">💛</button><%=dto.getLikes() %>			         
	   	<%-- <div class="comment">댓글<%=alist.size() %></div> --%>
	     <%if(loginOk!=null){//이부분은 로그인 상태에서만 보이게 하기 %>
	     <div>
	     	<div class="commentlist">
	     		<%
	     		//반복문
	     		for(AdoptCommentDto adto:alist)
	     		{
	     			//댓글 쓴사람 이름
	     			String writer=adto.getId();
	     		%>
	     		<%=writer%>:<%=adto.getContent() %>
	     		<!-- 댓글단 본인한테만 수정 삭제 아이콘 보이게 하기 -->	
	     		<%
	     		if(myId!=null && myId.equals(id))
	     		{
	     		%>
	     			<span class="awriteday">
	     			<%=adto.getWriteday()%></span>
	     			<span class="glyphicon glyphicon-remove delete"
	     			idx="<%=adto.getIdx()%>">삭제</span>
	     		<%	
	     		}
	     		%>

	     		<br>
	     		
	     	</div> 
	     </div>
	 	</ul>
	     	<%}
	     }
	     %>
	</div>
	     <form action="Adopt/commentadd.jsp" method="post" class="form-inline">
	     	<input type="hidden" name="adopt_num" value="<%=dto.getAdopt_num()%>">
	     	<input type="hidden" name="user_num"  value="<%=user_num%>">
	      	<input type="hidden" name="comm_num" value="<%=dto.getAdopt_num()%>">
	      	<input type="hidden" name="id" value="<%=myId%>">
	      	<div class="form-group">
	      	<span>
	      		<input type="text" name="content" required="required" placeholder="댓글을 입력해주세요"
	      		style="width:500px;">
	      	</span>	
	      	<span>
	      		<button type="submit">저장</button>	
	      	</span>
	      	</div>  	
	      </form>
	     </table>
	      	
	     	 <div>
	      	 <%
	     	  if(myId!=null && myId.equals(id)){
	    		%>   	   
	     	     <button type="button"
			       class="btn btn-info btn-lg" id="btn-del"
			       style="width: 100px;"
			       onclick="location.href='Adopt/deleteaction.jsp?adopt_num=<%=dto.getAdopt_num()%>'">글 삭제</button> 
			     <button type="button"
			       class="btn btn-info btn-lg" id="btn-update"
			       style="width: 100px;"
			       onclick="location.href='Adopt/adoptUpdate.jsp?adopt_num=<%=dto.getAdopt_num()%>'">글 수정</button> 
			          
	      	  <%}	 
		  	  %>                            
	   		 </div>
	   	</main>			 
	</div>
</body>
</html>