<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	}
	
</style>
</head>
<body>
<div class="search">
	<input type="text" id="roadAddress" placeholder="도로명주소">&nbsp;
	<input id="search_btn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
</div>
<div class="layer">
	<ul id="category">
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span><br>
            동물병원
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span><br>
            애견카페
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg park"></span><br>
            공원
        </li>      
    </ul>
	<div class="map" id="map"></div>
</div>

<script>
	var yPos = 33.45990031884484;
	var xPos = 126.54625224494492;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(yPos, xPos), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	}
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//마커를 미리 생성
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(yPos, xPos),
        map: map
    });
	
	//주소검색시 지도 새로고침
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.roadAddress; // 최종 주소 변수
				
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("roadAddress").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(result, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                    	
                    	yPos = result[0].y;
                    	xPos = result[0].x;
                    	// 해당 주소에 대한 좌표를 받아서
                    	var coords = new daum.maps.LatLng(yPos, xPos);
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                        
                        alert("검색성공: " + yPos + ", " + xPos);
                        
                    }
                });
            }
        }).open();
    }
	
	<%
	// 임의 입력
	session.setAttribute("myId", "smin9408");
	session.setAttribute("loginOk", "success");
	//session으로 userid와 loginok를 받아옵니다
	String myId = (String)session.getAttribute("myId");
	String loginOk = (String)session.getAttribute("loginOk");
	UserDao dao = new UserDao();
	UserDto dto = dao.getData(myId);
	String road_addr = dto.getRoad_addr();
	int agree = dto.getAgree();
	
	// 로그인상태일때 본인주소로 이동
	if(loginOk.equals("success") && agree == 1 && myId != null){
	%>
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('<%=road_addr%>', function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
			
				yPos = result[0].y;
            	xPos = result[0].x;
            	// 해당 주소에 대한 좌표를 받아서
            	var coords = new daum.maps.LatLng(yPos, xPos);
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords);
                
                alert("로그인상태: " + yPos + ", " + xPos);
                
			} 
		});

	<%
	// 비로그인시 비트캠프로 이동
	}else{
	%>
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('서울특별시 서초구 서초4동 강남대로 459', function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
			
				yPos = result[0].y;
            	xPos = result[0].x;
            	// 해당 주소에 대한 좌표를 받아서
            	var coords = new daum.maps.LatLng(yPos, xPos);
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords);
                
                alert("비로그인상태: " + yPos + ", " + xPos);
                
			} 
		});
	<%
	}
	%>
	
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	    
</script>
</body>
</html>



































