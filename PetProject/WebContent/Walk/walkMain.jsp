<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오지도 api 앱키와 라이브러리정보를 입력해줍니다 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c68a4aa3b82c817fb89aa2e592fe90a&libraries=services"></script>
<style type="text/css">
	div.search{
	
	}
	
	div.layer{
		text-align: center; 	
	}
	
	div.map{
		width: 900px; height: 800px; 
		border-radius: 20px; 
		line-height: 800px; 
		display: inline-block;  
	}
	
</style>
</head>

<body>
<div class="search">
	<form onsubmit="searchPlaces(); return false;">
    	<input type="text" id="address" size="15" placeholder="도로명 주소">
	    <button type="submit">검색하기&nbsp;<i class='btn fas fa-search' style="gray;"></i></button>
	</form>
</div>
<div class="layer">
	<div class="map_wrap">
	    <div class="hAddr">
	        <span class="current_position">선택한 주소</span>
	        <span id="centerAddr"></span>
	    </div>
	</div>
	<div class="map" id="map"></div>
</div>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.45990031884484, 126.54625224494492), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	}
	
	<%
	// 임의 입력
	session.setAttribute("myid", "kko1234");
	session.setAttribute("loginok", "success");
	//session으로 userid와 loginok를 받아옵니다
	String myid = (String)session.getAttribute("myid");
	String loginok = (String)session.getAttribute("loginok");
	UserDao dao = new UserDao();
	UserDto dto = dao.getData(myid);
	String road_addr = dto.getRoad_addr();
	int agree = dto.getAgree();
	
	// 로그인상태일때 본인주소로 이동
	if(loginok.equals("success") && agree == 1){
	%>
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('<%=road_addr%>', function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
			
			    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			    // 결과값으로 받은 위치를 마커로 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: coords
			    });
			
			    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			    map.setCenter(coords);
			} 
		});

	<%
	// 비로그인시 비트캠프로 이동
	}else{
	%>
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('서울특별시 서초구 서초4동 강남대로 459', function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
			
			    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			    // 결과값으로 받은 위치를 마커로 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: coords
			    });
			
			    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			    map.setCenter(coords);
			} 
		});
	<%
	}
	%>
	// 지도의 중심좌표 반환
	var position = map.getCenter();
	console.log(position);
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    position.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');

	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}
	
</script>
</body>
</html>