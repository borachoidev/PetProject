<%@page import="data.dao.MapDao"%>
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
	
	.btn_add{
		width: 60px;
		height: 25px;
	}
	
	.star_frm{
		display: block;
	}
	
   	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 10px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	
</style>
</head>
<body>
<div class="search">
	<input type="text" id="roadAddress" placeholder="도로명주소">&nbsp;
	<input id="search_btn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
</div>
<div class="layer">
	<ul id="category">
        <li id="hospital" data-order="1"> 
            <span class="local_hospital"></span><br>
            동물병원
        </li>  
        <li id="cafe" data-order="2"> 
            <span class="local_cafe"></span><br>
            애견카페
        </li>  
        <li id="park" data-order="3"> 
            <span class="fas fa-dog"></span><br>
            공원
        </li>      
    </ul>
	<div class="map" id="map"></div>
</div>

<script>
	var yPos = 33.45990031884484;
	var xPos = 126.54625224494492;
	var addr = "";
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
                addr = data.roadAddress; // 최종 주소 변수
				
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("roadAddress").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(result, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                    	
                    	removeMarkers();
                    	closeOverlays();
                    	
                    	yPos = result[0].y;
                    	xPos = result[0].x;
                    	// 해당 주소에 대한 좌표를 받아서
                    	var coords = new daum.maps.LatLng(yPos, xPos);
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                        
                        alert("검색성공: " + yPos + ", " + xPos + ", " + addr);
                        
                    }
                });
            }
        }).open();
    }
	
	<%
	//session으로 userid와 loginok를 받아옵니다
	String myId = (String)session.getAttribute("myId");
	String loginOk = (String)session.getAttribute("loginOk");
	UserDao dao = new UserDao();
	UserDto dto = dao.getData(myId);
	String road_addr = dto.getRoad_addr();
	int agree = dto.getAgree();
	if(loginOk == null || loginOk.equals("no")){
		// 비로그인시 비트캠프로 이동
		%>
		
		addr = '서울특별시 서초구 서초4동 강남대로 459';
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				
				removeMarkers();
				closeOverlays();
				
				yPos = result[0].y;
	        	xPos = result[0].x;
	        	// 해당 주소에 대한 좌표를 받아서
	        	var coords = new daum.maps.LatLng(yPos, xPos);
	            // 지도 중심을 변경한다.
	            map.setCenter(coords);
	            // 마커를 결과값으로 받은 위치로 옮긴다.
	            marker.setPosition(coords);
	            
	            alert("비로그인시: " + yPos + ", " + xPos + ", " + addr);
	            
			} 
		});
		<%
	}else if(loginOk.equals("success") && myId != null){ // 로그인상태일때 본인주소로 이동
		if(agree == 1){
	%>
			addr = "<%=road_addr%>";
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
				
					removeMarkers();
					closeOverlays();
					
					yPos = result[0].y;
		          	xPos = result[0].x;
		          	// 해당 주소에 대한 좌표를 받아서
		          	var coords = new daum.maps.LatLng(yPos, xPos);
					// 지도 중심을 변경한다.
					map.setCenter(coords);
					// 마커를 결과값으로 받은 위치로 옮긴다.
					marker.setPosition(coords);
					
					alert("로그인상태: " + yPos + ", " + xPos + ", " + addr);
					
				}
			});
			
			<%
		}
		
		else{
			// 위치미동의 계정
			%>
			addr = '서울특별시 서초구 서초4동 강남대로 459';
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					
					removeMarkers();
					closeOverlays();
					
					yPos = result[0].y;
	            	xPos = result[0].x;
	            	// 해당 주소에 대한 좌표를 받아서
	            	var coords = new daum.maps.LatLng(yPos, xPos);
	                // 지도 중심을 변경한다.
	                map.setCenter(coords);
	                // 마커를 결과값으로 받은 위치로 옮긴다.
	                marker.setPosition(coords);
	                
	                alert("위치미동의계정: " + yPos + ", " + xPos + ", " + addr);
	                
				} 
			});
		<%
		}
	}
	%>
	
	// 동물병원
	recommendFacility("hospital", "동물병원");
	// 애견카페
	recommendFacility("cafe", "애견카페");
	// 공원
	recommendFacility("park", "공원");
	
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
	    markers = [],
	    overlays = [],
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	    
	// 지도에 추천 시설 마커 찍기
	function recommendFacility(category, keyword){
		document.getElementById(category).onclick = function(){
			
			var places = new kakao.maps.services.Places();
			
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			removeMarkers();
			closeOverlays();
			
		    var callback = function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		        	// 마커 이미지의 이미지 주소입니다
		            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		        	
		         	// 마커 이미지의 이미지 크기 입니다
		            var imageSize = new kakao.maps.Size(24, 35); 
		            for(var i=0; i<result.length; i++){
		            	var place_name = result[i]["place_name"];
		            	var road_address_name = result[i]['road_address_name'];
		            	var x = result[i]['x'];
		            	var y = result[i]['y'];
		            	var place_url = result[i]['place_url'];
						var mark = {title: place_name, address: road_address_name, latlng: new kakao.maps.LatLng(y, x), place_url: place_url};
						/// 마커 이미지를 생성합니다    
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					    
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: mark.latlng, // 마커를 표시할 위치
					        title : mark.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        address: mark.address,
					        place_url: place_url,
					        image : markerImage // 마커 이미지 
					    });
					    
					    // 마커가 지도 위에 표시되도록 설정합니다
					    marker.setMap(map);
					    
					    // 생성된 마커를 배열에 추가합니다
					    markers.push(marker);
					    
					 	// 일반 함수
						var closeOverlay = function() {
						    overlay.setMap(null);
						};
						
						var userScore = $("#makeStar");
					    userScore.on({
					    	onchange: function(){
					    		var userScoreNum = $(this).val();
					    		alert(userScoreNum);
					    		$(".make_star i").css({color:'#000'});
					    		$('.make_star i:nth-child(-n+' + userScoreNum + ')').css({color:'#F05522'});	
					    	}
						});
						
						var ajax = function() {
			            	var star = $("#makeStar").find("option:selected").val();
							alert(star);
							$.ajax({
								type:"post",
								url:"Walk/checkWritten.jsp",
								dataType: "xml",
								data:{"xPos":x, "yPos":y, "id":<%=myId%>},
								success: function(data){
									alert("와");
									var cnt = $(data).find("count").text();
									if(cnt == 0){
										$.ajax({
											type:"post",
											url:"Walk/addStar.jsp",
											dataType: "xml",
											data:{"xPos":x, "yPos":y, "star":star, "id":<%=myId%>},
											success: function(data){
												alert("이제 insert짜자");
											}
										});
									}else{
										alert("이미 작성했습니다");
									}
								}
							});
						};
						
						// 커스텀 오버레이에 표시할 컨텐츠 입니다
						// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
						// 별도의 이벤트 메소드를 제공하지 않습니다 
						var $wrap = $('<div class="wrap" />');
						var $info = $('<div class="info" />');
						var $title = $('<div class="title" />').text(place_name);
						var $close = $('<div class="close" title="닫기" />').click(closeOverlay);
						var $body = $('<div class="body" />');
						var $desc = $('<div class="desc" />');
						var $ellipsis1 = $('<div class="ellipsis" />').text(road_address_name);
						var $ellipsis2 = $('<div class="ellipsis" />');
						var $url = $('<a class="link" />').attr({href:place_url, target:"_blank"})
						$url = $('<a class="link" />').text("홈페이지");
						var $ellipsis3 = $('<div class="ellipsis" />').text("별점 : ");
						var $ellipsis4 = $('<div class="ellipsis" />').hide();
						$ellipsis4 = $('<div class="ellipsis" />').text(x);
						var $ellipsis5 = $('<div class="ellipsis" />').hide();
						$ellipsis5 = $('<div class="ellipsis" />').text(y);
						var $ellipsis6 = $('<div class="ellipsis" />').hide();
						$ellipsis6 = $('<div class="ellipsis" />').text("<%=myId%>");
						var $make_star = $('<div class="make_star" />')
						var $makeStar = $('<select name="star" id="makeStar" />');
						var $option1 = $('<option />').text("1점");
						$option1 = $('<option class="op" />').attr({value:"1", selected:"selected"});
						var $option2 = $('<option class="op" value="2" />').text("2점");
						var $option3 = $('<option class="op" value="3" />').text("3점");
						var $option4 = $('<option class="op" value="4" />').text("4점");
						var $option5 = $('<option class="op" value="5" />').text("5점");
						var $rating = $('<span class="rating" />').attr("data-rate","5");
						var $star1 = $('<i class="fas fa=star" />');
						var $star2 = $('<i class="fas fa=star" />');
						var $star3 = $('<i class="fas fa=star" />');
						var $star4 = $('<i class="fas fa=star" />');
						var $star5 = $('<i class="fas fa=star" />');
						var $btn_add = $('<button type="button" id="btn_add" class="btn_add btn-info" />').text("별점추가");
						$btn_add = $('<button type="button" id="btn_add" class="btn_add btn-info" />').click(ajax);
						
						$wrap.append($info);
						$info.append($title).append($body);
						$title.append($close);
						$body.append($desc);
						$desc.append($ellipsis1).append($ellipsis2).append($ellipsis3).append($ellipsis4).append($ellipsis5).append($ellipsis6);
						$ellipsis2.append($url);
						$ellipsis3.append($make_star).append($rating).append($btn_add);
						$makeStar.append($option1).append($option2).append($option3).append($option4).append($option5);
						$rating.append($star1).append($star2).append($star3).append($star4).append($star5);
						
						var content = $wrap[0];
						
				        // 마커 위에 커스텀오버레이를 표시합니다
				        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				        var overlay = new kakao.maps.CustomOverlay({
				            content: content,
				            map: map,
				            position: marker.getPosition()
				        });
				        
				  		// 마커가 지도 위에 표시되도록 설정합니다
						overlay.setMap(null);
				      
				        overlays.push(overlay);
				         
						// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
					    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    (function(marker, overlay) {
					        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
					        kakao.maps.event.addListener(marker, 'mouseover', function() {
					            // 색변경
					        });

					        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
					        kakao.maps.event.addListener(marker, 'mouseout', function() {
					            // 색변경
					        });
					        
					     	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							kakao.maps.event.addListener(marker, 'click', function() {
								closeOverlays();
							    overlay.setMap(map);
							});
					    })(marker, overlay);
						
		            }
		            
		         	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		            var bounds = new kakao.maps.LatLngBounds();    

		            for (var i = 0; i < markers.length; i++) {
		                // LatLngBounds 객체에 좌표를 추가합니다
		                bounds.extend(markers[i].getPosition());
		            }
		            map.setBounds(bounds);
		            
		        }else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		           	alert('검색 결과가 존재하지 않습니다.');
		            return;
		        }else if (status === kakao.maps.services.Status.ERROR) {

		            alert('검색 결과 중 오류가 발생했습니다.');
		            return;
		        }
		    };
		    places.keywordSearch(addr + ' ' + keyword, callback);
		};
    }
	    
	
	
	
	function closeOverlays(){
		for ( var i = 0; i < overlays.length; i++ ) {
	        overlays[i].setMap(null);
	    }
    }
	
	function removeMarkers() {
		for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }
		markers = [];
	}
	
	
</script>
</body>
</html>



































