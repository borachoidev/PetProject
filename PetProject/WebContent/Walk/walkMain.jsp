<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c68a4aa3b82c817fb89aa2e592fe90a"></script>
<style type="text/css">
	div.search{
		margin-bottom: 20px;
		height: 30px;
		float: right;
		margin-right: 300px;
	}
	
	div.layer{
		text-align: center; 	
	}
	
	div.map{
		width: 1500px; height: 800px; 
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
	<div class="map" id="map" ></div>
</div>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	<%
	// 로그인 임의저장
	session.setAttribute("myid", "123");
	session.setAttribute("loginok", "no");
	// * 로그인상태시 내주소로 지도 중심이동시키기
	//session으로 userid와 loginok를 받아옵니다
	String myid = (String)session.getAttribute("myid");
	String loginok = (String)session.getAttribute("loginok");
	if(loginok.equals("yes") && myid!=null){
		//UserDao dao = new UserDao();
		//UserDto dto = dao.getData(Integer.parseInt(myid));
		//String address = dto.getAddress();
		// 임의 저장
		String address = "비트캠프";
	%>
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('<%=address%>', function(result, status) {
		
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
		
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			} 
		});    
	<%
	}
	%>
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 주소-좌표간 변환 서비스 객체를 생성한다.
	var geocoder = new kakao.maps.services.Geocoder();
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        
	    }
	};
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var address = document.getElementById('address').value;

	    if (!address.replace(/^\s+|\s+$/g, '')) {
	        alert('주소를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    geocoder.addressSearch(address, callback); 
	}
	
</script>
</body>
</html>