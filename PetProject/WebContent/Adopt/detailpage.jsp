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
   
</style>
<script type="text/javascript">
   $(function(){
      $("span.adelete").click(function(){
    	  var a=confirm("삭제하려면[확인]을 눌러주세요")
    	  if(a){
    		  var idx=$(this).attr("idx");
    		  $.ajax({
    			  type:"get",
    			  dataType:"html",
    			  url:"Adopt/commentdel.jsp",
    			  data:{"idx":idx},
    			  success:function(data){
    				  location.reload();
    			  }
    		  });
    	  }
      });
      $("span.aupdate").click(function(){
    	 var idx=$(this).attr("idx");
    	 //
    		 
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
   
   
   System.out.println(id+myId+user_num);
   
	AdoptDao adao=new AdoptDao();
 	List<AdoptCommentDto> alist=adao.getCommentList(dto.getAdopt_num());

   
%> 

<body>

   <table style="width: 1000px; border: 1px solid;">
      <tr>
         <td class="photo" rowspan="7" style="width: 500px;">
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
         		<td><%=dto.getContent() %></td>
         </tr>
</table>


<div>
<table>
  	<tr>
  		<td>
  		   댓글<%=alist.size()%>
  		</td>
  	</tr>	   
     <%if(loginOk!=null){//이부분은 로그인 상태에서만 보이게 하기 %>
     <tr>
     <td>
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
     			<span class="glyphicon glyphicon-pencil a update"
     			idx="<%=adto.getIdx()%>"></span>
     			
     			<span class="glyphicon glyphicon-remove adelete"
     			idx="<%=adto.getIdx()%>"></span>
     		<%	
     		}
     		%>
			<span class="awriteday">
     			<%=adto.getWriteday()%></span>
     		<br>
     		
     	</div> 
     </div>
     </td>
     </tr>
 
     	<%}
     }
     %>
 </table>
</div>

     <form action="Adopt/commentadd.jsp" method="post" class="form-inline">
     	<input type="hidden" name="adopt_num" value="<%=dto.getAdopt_num()%>">
     	<input type="hidden" name="user_num"  value="<%=user_num%>">
      	<input type="hidden" name="comm_num" value="<%=dto.getAdopt_num()%>">
      	<input type="hidden" name="id" value="<%=myId%>">
      	<div class="form-group">
      	<input type="text" name="content" class="form-control"
      		required="required" placeholder="댓글을 입력해주세요"
      		style="width:200px;">
      		<button type="submit" class="btn btn-sm">저장</button>	
      	</div>  	
      </form>
     
      	
     	 <div>
      	 <%
     	  if(myId!=null && myId.equals(id)){
    		%>   	   
     		 <button type="button"
		       class="btn btn-info btn-lg" id="btn-del"
		       style="width: 100px;"
		       onclick="location.href='Adopt/deleteaction.jsp?adopt_num=<%=dto.getAdopt_num()%>'">글 삭제</button>  
      	  <%}	 
	  	  %>                            
   		 </div>
 <!-- Modal -->  	
 <div class="container">
  <h2></h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="width:100px;">
    댓글 수정
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  

</body>
</html>