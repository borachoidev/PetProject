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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
	i.far:hover{
		cursor:pointer;
		
	}
	i.far{
		font-size: 4px;
	}

   #adopt__detail{
   	margin-top: 5%;
   	display: flex;
   	justify-content: center;
   	flex-direction: column;
   	width: 60%;
   }
   
   #btn_likes{
   cursor: pointer;
   }
   .photo__zone{
   	width: 500px;
   	height: 368px;
   	background-size: cover;
   	background-repeat: no-repeat;
   }
   
   .adopt__likes-icon {
   	color: #c62828;
   }
   
   .adopt__comm-input {
    width: 90%;
   	margin-right: 2%;
   	padding-left: 2%;
   }
   
   .adopt__comm-form {
   	display: flex;
   	justify-content: flex-start;
   	width: 100%;
   	white-space: nowrap;
   }
   
   .adopt__detail-tb {
   	font-size: 1.2em;
   	height: 50vh;
   	width: 48%;
   	margin:2% 0;
   }
   
   .adopt__detail-tb td{
	padding: 5%;
	white-space: nowrap;
   }
   
   .adopt__post {
   	width: 100%;
   	display: flex;
   	justify-content: space-between;
   }
   
   .photo__zone {
   	width: 50%;
   	margin: 2% 0;
   	
   }
   
  .adopt__tb-title {
  	width: 20%;
  	text-align: center;
  }
  
  .adopt__content {
  	text-align: left;
  	font-size: 1.2em;
  	margin: 5% 0;
  	padding: 2% 5%;
  	width: 100%;
  	white-space: pre-wrap;
  	border: 1px solid #efefef;
  }
  
  .adopt__save-btn {
  	background: none;
  	color: #ffc107;
  	font-weight: bold;
  }
  
  .adopt__list-btn {
  	background-color: #ffc107;
  	white-space: nowrap;
  }
  
  .adopt__edit-btn {
    background-color: #ffcc80;
    white-space: nowrap;
  }
  
  .adopt__del-btn {
  	background-color: #ddd;
  	white-space: nowrap;
  }
  
  .adopt__input-form {
  	width: 100%;
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
 
 	  $("span.likes").click(function(){
    	  var adopt_num=$(this).attr("adopt_num");
    	  var a=confirm("좋아요를 누르시겠습니까?")
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
   String  comm_num=dto.getComm_num();
   int likes=dto.getLikes();
   

	AdoptDao adao=new AdoptDao();
 	List<AdoptCommentDto> alist=adao.getCommentList(dto.getAdopt_num());

   
%> 

<body>
<div id="adopt__detail">
	<header>
		<h2>분양 정보 </h2>			 
		<span class="likes"id="btn_likes"
		 style="width: 50px; font-size: 1.2em;" adopt_num="<%=adopt_num%>">
		 	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-suit-heart-fill adopt__likes-icon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
			</svg>
			좋아요&nbsp;<b><%=dto.getLikes() %></b>개
		 </span>		
	</header>
  	<main>	
	  	<div class="adopt__post">
	  		 <div class="photo__zone" style="background-image: url('adoptsave/<%=photo%>');"></div>
		  	 <%-- <img src="adoptsave/<%=photo%>">  --%>
		  	 <div class="adopt__detail-tb">    
			  	 <table class="table table-bordered">
			     <%--  <tr>
			         <td class="photo" rowspan="6" style="width: 500px;">
			              <img src="adoptsave/<%=photo%>">         
			          </td>
			       </tr> --%>
			        <tr>   
			          <td class="adopt__tb-title">작성자 </td>   
			          <td><%=dto.getAdopt_name()%></td>   
			        </tr> 
			        <tr>
			         	<td class="adopt__tb-title">견종</td>
			         	<td><%=dto.getBreed() %></td>
			         </tr>
			         <tr>		
			         	<td class="adopt__tb-title">성별 </td>   
			         	<td><%=dto.getGender() %></td>   
			         </tr>
			         <tr>		  
		         		<td class="adopt__tb-title">나이</td>  
		         		<td><%=dto.getAge() %></td>  
			         </tr>
			         <tr>		
		         		<td colspan="2"><%=dto.getVaccine() %></td>
			         </tr>
				</table>
			</div>
		</div>
	    <div class="adopt__content"> <%=dto.getContent() %></div>		
		<form action="Adopt/commentadd.jsp" method="post" class="adopt__input-form">
	     	<input type="hidden" name="adopt_num" value="<%=dto.getAdopt_num()%>">
	     	<input type="hidden" name="user_num"  value="<%=user_num%>">
	      	<input type="hidden" name=" comm_num" value="<%=dto.getAdopt_num()%>">
	      	<input type="hidden" name="id" value="<%=myId%>">
	      	<div class="form-group">
		      	<div class="adopt__comm-form">
		      	<%if(loginOk!=null){ %>
		      		<input class="all__form adopt__comm-input" id="adopt__addComm" type="text" name="content" required="required" placeholder="댓글을 입력해주세요">
		      	<%}else if(loginOk==null){ %>
		      		<input class="all__form adopt__comm-input" type="text" name="content" required="required" placeholder="댓글을 남기려면 로그인 먼저 해주세요"
		      		 readonly>
		      	<%} %>
		      		<button type="submit" class="button adopt__save-btn">저장</button>	
		      	</div>
	      	</div>  	
	      </form>
	
		<table class="table table-bordered commentlist" >
		     <%if(loginOk!=null){//이부분은 로그인 상태에서만 보이게 하기 %>
	         
		   	<%-- <div class="comment">댓글<%=alist.size() %></div> --%>
		   		<%}
		     		//반복문
		     		for(AdoptCommentDto adto:alist)
		     		{
		     			//댓글 쓴사람 이름
		     			String writer=adto.getId();
		     		%>
	     		<tr>
	    			<td>
	    				<b><%=writer%></b>&nbsp;:&nbsp;<%=adto.getContent() %>
		     		<!-- 댓글단 본인한테만 수정 삭제 아이콘 보이게 하기 -->	
		     			<span class="awriteday" style= "float: right; color: gray;"><%=adto.getWriteday()%></span>
		     		<%
		     			if(myId!=null && myId.equals(adto.getId())) {
		     		%>
		     				<span class="delete" idx="<%=adto.getIdx()%>"><i style='font-size:15px' class='far'>&#xf410;</i></span>
		     		<%	
		     			}
		     		%>
		     		</td>
		     	</tr>
		     <%}%>
		  </table>
	   	</main>		
	   		      	
     	<div>
		     <button type="button"
		       class="button adopt__list-btn" id="btn-update"
		       onclick="location.href='index.jsp?main=Adopt/adoptlist.jsp'">목록 보기</button> 
      	 <%
     	  if(myId!=null && myId.equals(id)) {
    	%>   	   
		     <button type="button"
		       class="button adopt__edit-btn" id="btn-update"
		       onclick="location.href='index.jsp?main=Adopt/adoptUpdate.jsp?adopt_num=<%=dto.getAdopt_num()%>'">수정</button> 
     	     <button type="button"
		       class="button adopt__del-btn" id="btn-del"
		       onclick="location.href='Adopt/deleteaction.jsp?adopt_num=<%=dto.getAdopt_num()%>'">삭제</button> 
		          
      	  <%
     	  }	 
	  	  %>                            
   	    </div>	 
	</div>
</body>
</html>