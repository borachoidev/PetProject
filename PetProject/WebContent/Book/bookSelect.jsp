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
<link href="Book/bookCalendar.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.book__mainlayout{
		margin-top: 100px;
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
		background-color: #ddd;	
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
	 table{
      width: 800px;
      border: none;
   }
   th{
         background-image: linear-gradient(to right, #B2CCFF 0%, #B2CCFF 19%, #D9E5FF 60%, #D9E5FF 100%);
         width: 50px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            box-shadow: 0 3px 3px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.18);
              border-radius: 25px;
              border: none;
   }
   td{
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            box-shadow: 0 3px 3px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.18);
              border-radius: 25px;
              border: none;
     }
     .box3{
      display: flex;
      justify-content: space-around;
      border: 1px solid green;   
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
</style>
</head>
<body>
<div class="book__mainlayout">
	<jsp:include page="bookmenu.jsp"/>
	
	<div class="book__map__cal">
		<!-- 지도열리는 div -->
		<div id="book__map" style="width:500px;height:600px; border-radius: 20px;"></div>
		<!-- <div id="book__map2" style="width:500px;height:600px;"></div> -->
		
		<div class="cal__cle">
			<div class="calendarWan">
				   <span onclick="before_month();"> 이전 </span>
				   <span id="select_year" >2020</span>년
				   <span id="select_month" >12</span>월
				   <span onclick="after_month();"> 다음 </span>
				   <div id="calendarForm"></div>
			</div>
			<div class="box3">
			   <div  id="lesson11" onclick="getClass1()">1:1 레슨</div>
			   <div  id="lessongroup" onclick="getClass2()">그룹 레슨</div>
			   <div  id="hotel" onclick="getClass3()">호텔링</div>
			</div>
		</div>
	</div>
	<div class="select3" style="width: 100%; height: 200px; border: 1px solid red;">
		<form action="Book/bookpageaction2.jsp" method="post">
			<select name = "petcenter">
				<option value="서초본원">서초본원</option>
				<option value="강남센터">강남센터</option>
				<option value="신촌센터">신촌센터</option>
				<option value="종로센터">종로센터</option>
				<option value="안양센터">안양센터</option>
				<option value="부산센터">부산센터</option>
			</select>
			<!-- <div id="tmdals" name ="bookday">달력에서 날짜를 클릭해주세요</div> -->
			<input type="text" name ="startday" id="startday" placeholder="달력에서 날짜를 클릭해주세요"  required="required">
			<input type="text" name ="endday" id="endDay" placeholder="달력에서 날짜를 클릭해주세요"  required="required">
			<input type="text" name="petselect" id="petselect" placeholder="과정을 클릭해주세요" required="required"> 
			
			<button type="submit">가자잉</button>
		</form>
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
    		  document.getElementById("startday").value = year + '년 ' + month + '월 ' + date + '일';
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
    		  /* switch(month){
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
    		  var endDay = year + '년 ' + endMonth + '월 ' + endDate + '일 ';
    		  document.getElementById("endDay").value = endDay;
    	  }
      
      
      	
     	 
   }
   
   function buildCalendar(year,month){
      var s = "<table cellspacing='0' border='1'>";
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














