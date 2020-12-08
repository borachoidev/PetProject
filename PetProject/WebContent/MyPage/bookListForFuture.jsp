<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
<style type="text/css">
   .bookList__table td{
      vertical-align: middle;
   }
</style>
</head>
<%
   String myId = (String)session.getAttribute("myId");
   BookDao dao = new BookDao();
   
   List<HashMap<String, String>> list = dao.getUserBook(myId);

%>
<body>
<div style=" width: 1200px; margin-top: 50px;">

   <h3>예약 현황</h3>
   <table class="table table-striped bookList__table">
      <tr align="center">
         <th>예약 번호</th>
         <th>이름</th>
         <th>H.P</th>
         <th>강아지 이름</th>
         <th>예약 지점</th>
         <th>예약 강좌</th>
         <th>시작일</th>
         <th>종료일</th>
         <th>예약 관리</th>
      </tr>
      <%if(list.size()==0){%>
      <tr align="center">
      <td colspan="9" align="center">
             <b>예약이 없습니다!</b>
       </td>
      </tr>
      <%}%>
      <%
      for(int i = 0; i<list.size(); i++)
      {
         HashMap<String,String> map = list.get(i);
      %>
         <tr align="center">
            <td><%=map.get("book_num") %></td>
            <td><%=map.get("user_name") %></td>
            <td><%=map.get("hp") %></td>
            <td><%=map.get("acc_name") %></td>
            <td><%=map.get("petcenter") %></td>
            <td><%=map.get("petselect") %></td>
            <td><%=map.get("startday") %></td>
            <td><%=map.get("endday") %></td>
            <td>
               <input type="hidden" value="<%=map.get("book_num") %>" class="book__num">
               <button type="button" class="book__delete button">예약 취소</button>
            </td>
         </tr>
      
      <%}
      
      %>
   </table>

</div>
<script type="text/javascript">
   $(document).on("click",".book__delete",function(){
      var num=$(this).siblings().val();
      var check = confirm("예약을 취소 하시겠습니까?");
      if(check){
         location.href="MyPage/deleteBookAction.jsp?num="+num;
      }else{
         location.onLoad();
      }
   });
</script>
</body>
</html>