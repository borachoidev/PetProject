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
	form.frm{
		margin-top: 150px;
			
	}
</style>
<script type="text/javascript">
   $(function(){
      
   })

</script>
</head>
<%
   String adopt_num=request.getParameter("adopt_num");

   AdoptDao dao=new AdoptDao();
   AdoptDto dto=dao.getData(adopt_num);

   
   String photo=dto.getPhoto();
   String id=dto.getId();
   String breed=dto.getBreed();
   String gender=dto.getGender();
   String age=dto.getAge();
   String vaccine=dto.getVaccine();
   String content=dto.getContent();
%> 

<body>
<form id="frm">
   <table style="width: 500px;">
      <tr>
         <td style="width: 500px;">
            <div class="photo">
               <img src="adoptsave/<%=photo%>">         
            </div>
         </td>  
      </tr>  
      <tr>
      <td style="width: 500px;" valign="top" >
         <h5>이름 : <%=dto.getId()%></h5>   
         <h5>견종 : <%=dto.getBreed() %></h5>
         <h5>성별 : <%=dto.getGender() %></h5>
         <h5>나이 : <%=dto.getAge() %>개월</h5>
         <h5><%=dto.getVaccine() %> </h5>
         <span> <%=dto.getContent() %></span>
      </td>
      </tr>
      </table>
      <div>
         <button type="button"
         class="btn btn-info btn-lg" id="btn-del"
         style="width: 100px;"
         onclick="location.href='Adopt/deleteaction.jsp?adopt_num=<%=dto.getAdopt_num()%>'">글 삭제</button>   
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


</form>
</body>
</html>