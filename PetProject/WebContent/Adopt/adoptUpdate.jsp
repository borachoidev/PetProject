<%@page import="data.dao.AdoptDao"%>
<%@page import="data.dto.AdoptDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양 게시판</title>
<style type="text/css">
	td.table_row_name{
		width: 120px;
		text-align: center;
		vertical-align: middle;
	}
	
	div.main{
		width: 50vw;
		margin-left: 25vw;
		margin-right: 25vw;
		margin-top: 5vh;
	}
	
	textarea.content{
		width: 95%; height: 150px; resize: none;
	}
	
	input#check{
		cursor: pointer;
	}
   
</style>
<script type="text/javascript">
$(function(){
	var gender=$("#adopt__update__gender").attr("gender");
	console.log(gender);
	$("#adopt__update__gender option[value='"+gender+"']").prop("selected",true);
	
	var vaccine=$("#check").attr("vaccine");
	if(vaccine.match("완료")) {
		$("input:checkbox[id='check']").prop("checked",true);
	}
	
	var age=$("#adopt__update__age").attr("age");
	$("#adopt__update__age option[value='"+age+"']").prop("selected",true);
});
	
</script>
</head>
<%
String myId=(String)session.getAttribute("myId"); 
String loginOk=(String)session.getAttribute("loginOk");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String adopt_num=request.getParameter("adopt_num");

UserDao dao=new UserDao();
String user_num=dao.getNum(myId);

AdoptDao adao=new AdoptDao();
AdoptDto dto=adao.getData(adopt_num);

/* 사용자 레벨 */
UserDao udao=new UserDao();
boolean user_level=udao.getUserLevel(myId);
%>

<body>
<%
	if(loginOk!=null && user_level==true) {
%>
   <div class="main">
   <h2>분양 정보 수정</h2>
   <form action="Adopt/updateaction.jsp" method="post"
      enctype="multipart/form-data" class="form-inline">
      <input type="hidden" name="adopt_num" value="<%=dto.getAdopt_num()%>">
      <table class="adoptFrom table table-bordered">
          <tr>
               <td class="table_row_name">작성자</td>
               <td>
               <input class="all__form" type="text" name="adopt_name"  value="<%=dto.getAdopt_name()%>" required="required" disabled>
         </tr>
         <tr>
             <td class="table_row_name">견종</td>
             <td>
               <input class="all__form" type="text" name="breed" value="<%=dto.getBreed()%>"required="required">
            </td>
         </tr>
          <tr>
            <td class="table_row_name">나이</td>
            	<td>
            <select name="age" required="required" class="all__form" age="<%=dto.getAge()%>">
            <option value="0~6개월">0~6개월미만</option>
            <option value="6개월~1년">6개월~1년미만</option>
            <option value="1년~2년">1년~2년미만</option>
            <option value="2년~3년">2년~3년미만</option>
            <option value="3년~4년">3년~4년미만</option>
            <option value="4년~5년">4년~5년미만</option>
            <option value="5년~6년">5년~6년미만</option>
            <option value="6년~7년">6년~7년미만</option>
            <option value="7년 이상">7년 이상</option>
            <option value="10년 이상">10년 이상</option>
            </select></td>
         </tr>
         <tr>
            <td class="table_row_name">성별</td>
            <td>
            <select id="adopt__update__gender" class="all__form" name="gender" required="required" gender="<%=dto.getGender() %>">
            <option value="수컷">수컷</option>
            <option value="암컷">암컷</option>
            <option value="수컷(중성화)">수컷(중성화)</option>
            <option value="암컷(중성화)">암컷(중성화)</option>
            </select></td>
         </tr>
            <tr>
            <td class="table_row_name">예방접종여부</td>
			<td>
               <input type="checkbox" id="check" style="vercical-align: middle;" vaccine="<%=dto.getVaccine() %>">
               <input type="hidden" name="vaccine" id="vaccine" value="예방접종 X" />
                  <script type="text/javascript">
      $("#check").click(function(){
    	 if($(this).prop("checked")){
    		 $("#vaccine").val("예방접종 완료"); 
    	 } else{
    		 $("#vaccine").val("예방접종 X");
    	 }
      });
      </script>
            </td>
         </tr>
         <tr>
            <td class="table_row_name">사진등록</td>
            <td>
                  <input type="file" name="photo" required="required" class="all__form">
            </td>
         </tr>
         <tr>
            <td class="table_row_name">내용</td>
            <td>
               <textarea class="content" name="content" required="required" ><%=dto.getContent()%></textarea>
            </td>
         </tr>   
         <tr>
         <td>
         	<input type="hidden" name="user_num" id="user_num" value="<%=user_num%>">  
         </td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <button type="submit" class="button"
               style="width: 100px;">수정</button>
            </td>
         </tr>   
      </table>

   </form>
</div>
<%
	}else {
%>
<script type="text/javascript">
		location.href="index.jsp?main=Adopt/adoptlist.jsp";
</script>
<%		
	}
%>
</body>
</html>