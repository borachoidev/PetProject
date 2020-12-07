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
   
</style>
</head>
<%
String myId=(String)session.getAttribute("myId"); 
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String adopt_num=request.getParameter("adopt_num");

UserDao dao=new UserDao();
String user_num=dao.getNum(myId);

AdoptDao adao=new AdoptDao();
AdoptDto dto=adao.getData(adopt_num);

%>

<body>
   <div class="">
   <form action="Adopt/updateaction.jsp" method="post"
      enctype="multipart/form-data" class="form-inline">
      <table class="" style="width: 600px;">
         <tr>
            <td>
               <span>이름</span>
               <input type="text" name="adopt_name"  value="<%=dto.getAdopt_name()%>" style="width: 75px;"required="required">
            </td>
         </tr>
         <tr>
            <td>
               <span>견종</span>
               <input type="text" name="breed" value="<%=dto.getBreed()%>" style="width: 75px;" required="required">
            </td>
         </tr>
          <tr>
            <td>
            	<span>나이</span>
            <select name="age" required="required">
         	<option disabled selected value>나이를 선택해 주세요</option>
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
            <td>
               <span>성별</span>
            <select name="gender" required="required">
            <option disabled selected value>성별을 선택해 주세요</option>   
            <option value="수컷">수컷</option>
            <option value="암컷">암컷</option>
            <option value="수컷(중성화)">수컷(중성화)</option>
            <option value="암컷(중성화)">암컷(중성화)</option>
            </select></td>
         </tr>
            <tr>
            <td>
               <span>예방접종</span>
               <input type="checkbox" id="check">
               <input type="hidden" name="vaccine" id="vaccine" value="0" />
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
            <td>
               <div class="form-group">
                  <span>사진등록</span>
                  <input type="file" name="photo" 
                  required="required">
               </div>
            </td>
         </tr>
         <tr>
            <td>
               <textarea name="content" required="required" value="<%=dto.getContent()%>"
               style="width: 600px; height: 150px;"></textarea>
            </td>
         </tr>   
         <tr>
         <td>
         	<input type="hidden" name="user_num" id="user_num" value="<%=user_num%>">  
         </td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <button type="submit" class="btn btn-info"
               style="width: 100px;">수정</button>
            </td>
         </tr>   
      </table>

   </form>
</div>
</body>
</html>