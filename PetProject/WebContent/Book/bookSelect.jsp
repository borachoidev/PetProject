<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q9fkpoa62h"></script>

<title>Insert title here</title>
<style type="text/css">
	.book__mainlayout{
		margin-top: 30px;
	}
	.book__choice{
		display: flex;
		justify-content: space-between;
	}
	.book__choice li{
		list-style-type: none;
		padding:20px 130px;
	}
	.book__choice2{
		background-color: #FFB61E;	
		position: relative;
	}
	.book__choice2:after{
		top: 0; /*말풍선꼭지위치 위아래*/
		right: 9.99%; /*말풍선위치 좌우*/
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-color: transparent transparent transparent #FFB61E ; /*말풍선 꼭지방향*/
		border-width: 31.8px; /*말풍선 꼭지 사이즈*/
		margin-right: -28%; /*말풍선 상세위치 조정*/
		z-index: 50;
	}
	
	.book__choice3 a, .book__choice4 a{
		pointer-events: none;
	} 
	.book__map__cal{
		display: flex;
		justify-content: space-between;
	}
	#calview{
	}
	.calendar__table{
		width: 360px;
		border: none;
	}
	.calendar__table th{
		background-image: linear-gradient(to right, #FFB61E 0%, #FFB61E 19%, #FFDF24 60%, #FFDF24 100%);
		width: 50px;
		height: 50px;
		text-align: center;
		font-size: 20px;
		border-radius: 50px;
		border: none;
		font-size: 0.9em;
	}
	.calendar__table td{
		width: 50px;
		height: 50px;
		text-align: center;
		font-size: 20px;
		box-shadow: 0 1px 1px rgba(0,0,0,0.16), 0 3px 3px rgba(0,0,0,0.10);
		border-radius: 100px;
		border: none;
		font-size: 0.9em;
	}
	.book__box3{
	}
	#lesson11{
		width: 200px;
		height: 100px;
		border: 1px solid red;
	}
	#lessongroup{
		width: 200px;
		height: 100px;
		border: 1px solid red;
	}
	#hotel{
		width: 200px;
		height: 100px;
		border: 1px solid red;
	}
	#back_btn a {
		color: white;
	}
	#book__selectbox{
		display: flex;
		justify-content: space-between;
	}
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	String onelesson = request.getParameter("onelesson");
	
%>
<body>
<div class="book__mainlayout">
	<jsp:include page="bookmenu.jsp"/>
	
	<div class="book__map__cal" style="border: 3px solid purple;">
		<!-- 지도열리는 div -->
		<div id="book__map" style="width:500px;height:560px; border-radius: 20px; border: 1px solid red;" ></div>
		<div id="book__bigselectbox" style="border: 15px solid tomato;">
			<div id="book__selectbox" style="border: 20px solid blue;  height: 400px;">
				<div class="book__calendar" style="border: 10px solid green;">
					<div class="calendarWan">
						   <span onclick="before_month();" style="cursor: pointer; padding: 5px;"> 이전 </span>
						   <span id="select_year" >2020</span>년
						   <span id="select_month" >12</span>월
						   <span onclick="after_month();" style="cursor: pointer; padding: 5px;"> 다음 </span>
						   <div id="calendarForm"></div>
					</div>
				</div>
				<div class="book__box3" style="border: 10px solid black;">
				   <div  id="lesson11" onclick="getClass1()">1:1 레슨</div>
				   <div  id="lessongroup" onclick="getClass2()">그룹 레슨</div>
				   <div  id="hotel" onclick="getClass3()">호텔링</div>
				</div>
			</div>
			<div class="select3" style="width: 100%; border: 1px solid red;">
				<form action="Book/bookpageaction2.jsp" method="post">
					<select name = "petcenter">
						<option value="서초본원">서초본원</option>
						<option value="강남센터">강남센터</option>
						<option value="신촌센터">신촌센터</option>
						<option value="종로센터">종로센터</option>
						<option value="안양센터">안양센터</option>
						<option value="부산센터">부산센터</option>
					</select>
					<input type="text" name ="startday" id="startday" placeholder="달력에서 날짜를 클릭해주세요"  required="required">
					<input type="text" name ="endday" id="endDay" placeholder="달력에서 날짜를 클릭해주세요"  required="required">
					<input type="text" name="petselect" id="petselect" value="<%=onelesson %>" required="required" readonly="readonly" > 
					<br>
					<button type="button" id="back_btn" class="button"><a href="index.jsp?main=Book/bookMain.jsp">Back</a></button>
					<button type="submit" class="button">예약하기</button>
					
				</form>
			</div>
		</div>
	</div>
	
</div>




<script src="Book/bookMap.js"></script>
<script type="text/javascript">
   document.addEventListener("DOMContentLoaded", function() {
       buildCalendar(year,month);
   });

   var today = new Date();
   var date = new Date();
   var year = today.getFullYear();
   var month = today.getMonth();
   
   function getValue(date){
      year = document.getElementById("select_year").innerHTML;
      month = document.getElementById("select_month").innerHTML;
      date = date.innerHTML;
      var endMonth = parseInt(month) + 1;
      var endDate = date;
      
      if(year==today.getFullYear() && month == today.getMonth()+1 && date<today.getDate())
    	  {
    	  	alert("현재날짜 이후로 선택해 주세요");
    	  }else if(year < today.getFullYear())
    	  {
    		alert("현재날짜 이후로 선택해 주세요");
    	  }else if(year == today.getFullYear() && month < today.getMonth()+1){
    		alert("현재날짜 이후로 선택해 주세요");  
    	  }else{
    		  document.getElementById("startday").value = year + '/' + month + '/' + date;
    		  if(month == 12)
    	      	{
    	      		var endMonth = 1;
    	      		var year = parseInt(year) + 1;
    	      	}
    		  if(month == 1 && date > 28)
  	      		{
    			  if(year%4==0 && year%100!=0 || year%400==0)
    				  var endDate = 29;
    			  else
    				  var endDate = 28;
  	      		}
    		  if(month == 3 && date > 30)
	      		{
  			  		var endDate = 30;
	      		}
    		  if(month == 5 && date > 30)
	      		{
			  		var endDate = 30;
	      		}
    		  if(month == 8 && date > 30)
	      		{
			  		var endDate = 30;
	      		}
    		  if(month == 10 && date > 30)
	      		{
			  		var endDate = 30;
	      		}
    		  /* switch(month){ 이건 왜 안되징
    		  case 1:
    			  if(year%4==0 && year%100!=0 || year%400==0)
    				  var endDate = 29;
    			  else
    				  var endDate = 28;
    			  break;
    		  case 3 && date > 30: case 5 && date > 30: case 8 && date > 30: case 10 && date > 30:
    			  var endDate = 30;
    			  break;
    		  default:
    		  	  break;
    		  } */
    		  var endDay = year + '/' + endMonth + '/' + endDate;
    		  document.getElementById("endDay").value = endDay;
    	  }
      
      
      	
     	 
   }
   
   function buildCalendar(year,month){
      var s = "<table class='calendar__table' cellspacing='0' border='1'>";
      s+="<tr><th>일</th><th>월</th><th> 화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr><tr>";
      var date = new Date();
      date.setFullYear(year,month,1);
      
      var day = date.getDay();//1일의 요일
      
      for(var i = 0; i<day; i++){
         s+='<td></td>';
      }
      while(date.getMonth()==month){
         if(date.getDate()!=1&&date.getDay()==0){
            s+='</tr><tr>';
         }
         s+='<td onclick="getValue(this)">'+date.getDate()+'</td>';
         date.setDate(date.getDate()+1);
      }
      var days = date.getDay();
      
      if(days!=0){
         var last = 6-days+1;
         for(var i =0; i<last; i++){
            s+='<td></td>';
         }
      }
      s+='</tr></table>';
      var calendarForm = document.getElementById("calendarForm");
      calendarForm.innerHTML = s;
   }
   
   function before_month(){

       var year= window.document.getElementById("select_year");
       var month= window.document.getElementById("select_month");

       if(month.innerHTML==1){
           month.innerHTML=12;
           year.innerHTML= parseInt(year.innerHTML)-1;
       }else{
           month.innerHTML=parseInt(month.innerHTML)-1;
       }

       buildCalendar(year.innerHTML,parseInt(month.innerHTML)-1);

   }

   function after_month(){

       var year= window.document.getElementById("select_year");
       var month= window.document.getElementById("select_month");

       if(month.innerHTML==12){
           month.innerHTML=1;
           year.innerHTML=parseInt(year.innerHTML)+1;
       }else{
           month.innerHTML=parseInt(month.innerHTML)+1;
       }
       buildCalendar(year.innerHTML,parseInt(month.innerHTML)-1);

   }
</script>
<script type="text/javascript">
   function getClass1(){
      mumu = document.getElementById("lesson11").innerHTML;
      document.getElementById("petselect").value = mumu;
   }
   function getClass2(){
      mumu = document.getElementById("lessongroup").innerHTML;
      document.getElementById("petselect").value = mumu;
   }
   function getClass3(){
      mumu = document.getElementById("hotel").innerHTML;
      document.getElementById("petselect").value = mumu;
   }
   
</script>
</body>
</html>






