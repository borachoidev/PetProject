<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3391999e3ec830519ed5007fbea0bef5&libraries=services"></script>
<link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<title>Insert title here</title>
<style type="text/css">
.intro__container{
display: flex;
flex-direction: column;
width: 100%;
justify-content: center;
align-items: center;

}
.layout__main{
margin-bottom:0px; 
}
.section1, .section2 {
    background-position: center center;
    background-size: 100%;
    background-attachment: fixed;
    background-repeat: no-repeat;
}
.section1{
background-image: url('Image/back2.jpg');
}
.section2{
background-image: url('Image/back3.jpg');
}


.item {
	height: 17em;
	width:100%;
	background-color: white;
 
}
.item:nth-child(1){
    background-color: transparent;
    height: 27em;
  }
  
.program{
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;

}


.location__info{
padding:1em;
}

.map{
	width:600px;
	height:400px;
	border: 1px solid #dedede ;
}

.program__title h1{
color:#ffb900;
}

.program__title h2{
color:#797979;
}

.program__description {
color:#797979;
width:60%;
}


</style>
<script type="text/javascript">
document.addEventListener('scroll', function() {
    var currentScrollValue = document.documentElement.scrollTop;
    var proDes1 =document.getElementById("programDescription1");
    var proDes2 =document.getElementById("programDescription2");
    console.log('currentScrollValue is ' + currentScrollValue);
    if(currentScrollValue<577){
    	proDes1.classList.add('animate__fadeInUp');
    	proDes2.classList.remove('animate__fadeInUp');
    	
    	
    }else if(currentScrollValue>=577&&currentScrollValue<1294){
    	proDes2.classList.add('animate__fadeInUp');
    	proDes1.classList.remove('animate__fadeInUp');
    }else{
    	proDes2.classList.remove('animate__fadeInUp');
    }
    
    });//scollEvent 종료

    

</script>
</head>
<body>
<!-- 센터소개 -->
<div class="intro__container">
	<div id="introUs">
	  <div class="section1">
		   <div class="item"><!-- 사진표시를 위한div --></div>
		   <div class="item program" id="program1">
			   <div  class="program__title"><h1>KINDERGARTEN</h1> <h2>반려견유치원</h2></div>
			  	<div class="program__description animate__animated " id="programDescription1">
			   펫앤미에서 운영하는 강아지 유치원은 다양한 프로그램과 관리 시스템으로 많은 견주분들의 사랑을 받고 있습니다. 
			   강이지 피트니스부터, 수영, 산책과 같은 동적인 프로그램부터, 간식 찾기, 미각 놀이와 같은 교육적 프로그램 또한, 
			   강아지 생일파티, 야외소풍까지 다양한 프로그램을 통해 견주들뿐만 아니라 강아지들을 위한 프로그램이 운영되고 있습니다.
			    </div>
		</div>    
	</div>
	   <div class="section2">
		    <div class="item"><!-- 사진표시를 위한div --></div>
		     <div class="item program" id="program2">
			    <div class="program__title"><h1>PICKUP SERVICE</h1> <h2>픽업서비스</h2></div>
			  	<div class="program__description animate__animated " id="programDescription2">
			 	 펫앤미에서는 픽업 서비스를 지원하고 있습니다. 아이들을 안전하게 태우고 집에서부터 펫앤미까지, 
			    또 펫앤미에서 집까지 운행하는 픽업 서비스로 견주분들의 편의를 제공하고 있습니다. 물론 언제나 안전 운전으로 반려견들의 안전은 잊지 않고 운행합니다. 
			    (강남, 서초 지점 한정, 그중 일부 지역은 제외)
			    </div>
		     </div>
	  </div>
	</div>
	<!-- 위치안내 -->
	<div id="introLocation">
		<!-- 센터tab -->
		<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#seocho">서초 본원</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#gangnam">강남 센터</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#shinchon">신촌 센터</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#jongro">종로 센터</a></li>
		</ul>
		
	<div class="tab-content">	
		<!-- tab 내용1 -->
		<div class="container tab-pane active location__info" id="seocho">
			<div id="map1"  class="map"></div>
			<div>
				<table class='table'>
					<tr>
						<th>주소</th>
						<td>서울특별시 서초구 강남대로459 백암빌딩 (구관건물)</td>
					</tr>
					<tr>
						<th>지하철</th>
						<td>(신논현역) 9호선 6번출구 – 강남역 방향 도보 3분<br>
							(강남역) 2호선 10번출구 – 신논현역 방향 도보 7분</td>
					</tr>
					<tr>
						<th>버스</th>
						<td>(하차) 신논현역,구교보타워사거리/ 신논현역,씨티은행</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- tab 내용2 -->
		<div class="container tab-pane fade location__info" id="gangnam">
			<div id="map2" class="map" ></div>
			<div>
				<table class='table'>
					<tr>
						<th>주소</th>
						<td>서울특별시 강남구 테헤란로 5길 11 YOO빌딩 2층</td>
					</tr>
					<tr>
						<th>지하철</th>
						<td>(강남역) 2호선 12번출구 도보 5분</td>
					</tr>
					<tr>
						<th>버스</th>
						<td>(하차) 강남역12번출구, 강남역.역삼세무서</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- tab 내용3 -->
		<div class="container tab-pane fade location__info" id="shinchon">
			<div id="map3" class="map"></div>
			<div>
				<table class='table'>
					<tr>
						<th>주소</th>
						<td>서울특별시 마포구 백범로 23 구프라자 B1</td>
					</tr>
					<tr>
						<th>지하철</th>
						<td>(신촌역) 2호선 6번출구 도보 8분</td>
					</tr>
					<tr>
						<th>버스</th>
						<td>(하차) 신촌로터리, 서강대학교</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- tab 내용4 -->
		<div class="container tab-pane fade location__info" id="jongro">
			<div id="map4" class="map"></div>
			<div>
				<table class='table'>
					<tr>
						<th>주소</th>
						<td>서울특별시 종로구 종로 69 YMCA빌딩 7층</td>
					</tr>
					<tr>
						<th>지하철</th>
						<td>(종각역) 1호선 8,11번출구 도보 3분</td>
					</tr>
					<tr>
						<th>버스</th>
						<td>(하차) 종로 2가</td>
					</tr>
				</table>
			</div>
		</div>
</div>	
	
	<script>
	
	/* 서초본원 map */

var mapContainer1 = document.getElementById('map1'),
    mapOption1 = {  
        center: new kakao.maps.LatLng(37.503121, 127.024447),
        level: 3
    };
var map1 = new kakao.maps.Map(mapContainer1, mapOption1);
var markerPosition1  = new kakao.maps.LatLng(37.503121, 127.024447); 
var marker1 = new kakao.maps.Marker({
    position: markerPosition1
});
marker1.setMap(map1);

/* 강남센터 map */
    
var mapContainer2 = document.getElementById('map2'),
    mapOption2 = { 
        center: new kakao.maps.LatLng(37.499472, 127.029247),
        level: 3
    };
var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
var markerPosition2  = new kakao.maps.LatLng(37.499472, 127.029247); 
var marker2 = new kakao.maps.Marker({
    position: markerPosition2
});
marker2.setMap(map2);

/* 신촌센터 map */

var mapContainer3 = document.getElementById('map3'),
    mapOption3 = { 
        center: new kakao.maps.LatLng(37.552647, 126.937730),
        level: 3
    };
var map3 = new kakao.maps.Map(mapContainer3, mapOption3);
var markerPosition3  = new kakao.maps.LatLng(37.552647, 126.937730); 
var marker3 = new kakao.maps.Marker({
    position: markerPosition3
});
marker3.setMap(map3);

/* 종로센터 map */

var mapContainer4 = document.getElementById('map4'),
    mapOption4 = { 
        center: new kakao.maps.LatLng(37.570280, 126.986455),
        level: 3
    };
var map4 = new kakao.maps.Map(mapContainer4, mapOption4);
var markerPosition4  = new kakao.maps.LatLng(37.570280, 126.986455); 
var marker4 = new kakao.maps.Marker({
    position: markerPosition4
});
marker4.setMap(map4);


$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show');
  setTimeout(function(){
	  map2.relayout();
	  map2.setCenter(new daum.maps.LatLng(37.499472, 127.029247));
	  map3.relayout();
	  map3.setCenter(new daum.maps.LatLng(37.552647, 126.937730));
	  map4.relayout();
	  map4.setCenter(new daum.maps.LatLng(37.570280, 126.986455));
	}, 0);  
});


	</script>
	

</div>
<jsp:include page="../Layout/footer.jsp"/>
</div>
	
</body>
</html>