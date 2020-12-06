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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c68a4aa3b82c817fb89aa2e592fe90a&libraries=services"></script>
<link rel="stylesheet" href="Walk/map.css" type="text/css">
</head>
<body>
<div id="mapcontainer">
<div class="search">
	<input type="text" id="roadAddress" placeholder="도로명주소 검색" readonly>&nbsp;
	<button id="search_btn" type="button" onclick="execDaumPostcode()" class="btn_search button">검색</button>
</div>
<div class="map_wrap">
	<ul id="category" class="category list-group list-group-horizontal">
        <li id="hospital" class="list-group-item" data-order="1"> 
        	<i class='fas fa-hospital' style='font-size:1.5rem'></i><br>
            <b>동물병원</b>
        </li>  
        <li id="cafe" class="list-group-item" data-order="2"> 
        	<i class='fas fa-coffee' style='font-size:1.5rem;'></i><br>
            <b>애견카페</b>
        </li>  
        <li id="park" class="list-group-item" data-order="3">
        	<i class='fas fa-dog' style='font-size:1.5rem;'></i><br>
            <b>공원</b>
        </li>      
    </ul>
	<div class="map" id="map"></div>
	<div class="custom_typecontrol radius_border">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="unselected_btn" onclick="setMapType('skyview')">스카이뷰</span>
    </div>
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><i class='fas fa-plus' style='position: relative; top: 5px; color: #777777; font-size:24px; vertical-align: middle;'></i></span>  
        <span onclick="zoomOut()"><i class='fas fa-minus' style='position: relative; top: 5px; color: #777777; font-size:24px; vertical-align: middle;'></i></span>
    </div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
    <div class="radius_border current_pos" onclick="panTo()">
    	<span><i class='fas fa-crosshairs' style='position: relative; top: 5px; color: #777777; font-size:24px'></i></span>
    </div>
</div>
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
    var currentMarker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(yPos, xPos),
        map: map
    });
	
	var infoWindow;
	
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
                        currentMarker.setPosition(coords);
                        
                        //alert("검색성공: " + yPos + ", " + xPos + ", " + addr);
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
	            currentMarker.setPosition(coords);
	            
	            //alert("비로그인시: " + yPos + ", " + xPos + ", " + addr);
	            
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
					currentMarker.setPosition(coords);
					
					//alert("로그인상태: " + yPos + ", " + xPos + ", " + addr);
					
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
	                currentMarker.setPosition(coords);
	                
	                //alert("위치미동의계정: " + yPos + ", " + xPos + ", " + addr);
	                
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
			
			/*
			var curr_mark = {curr_latlng: new kakao.maps.LatLng(yPos, xPos)};
			var currentMarker = new kakao.maps.Marker({
		        position: curr_mark.curr_latlng // 마커를 표시할 위치
		    });
			*/
			
		    var callback = function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		        	// 마커 이미지의 이미지 주소입니다
		            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		            
		            selectedMarker = null;
		            
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
					        image : markerImage // 마커 이미지 
					    });
					    
					    // 마커가 지도 위에 표시되도록 설정합니다
					    marker.setMap(map);
					    
					    // 생성된 마커를 배열에 추가합니다
					    markers.push(marker);
					    
						// 커스텀 오버레이에 표시할 컨텐츠 입니다
						// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
						// 별도의 이벤트 메소드를 제공하지 않습니다 
						(function($) {
							
							function getStarAverage(){
								var curr_x = $overxPos.val();
				            	var curr_y = $overyPos.val();
								$.ajax({
									type:"post",
									url:"Walk/viewStar.jsp",
									dataType: "xml",
									data:{"xPos":curr_x, "yPos":curr_y},
									success: function(data){
										var average = $(data).find("average").text();
										$starAverage.text("("+average+")");
										$star_rating.attr("data-rate",average);
										starRating();
									}
								});
							};
							
							function checkWritten(){
								var curr_x = $overxPos.val();
				            	var curr_y = $overyPos.val();
				            	var id = "<%=myId%>";
								$.ajax({
									type:"post",
									url:"Walk/checkWritten.jsp",
									dataType: "xml",
									data:{"xPos":curr_x, "yPos":curr_y, "id":id},
									success: function(data){
										var cnt = $(data).find("count").text();
										if(cnt == 1){
											$make_star.hide();
										}
									}
								});
							};
							
							// 별점추가
							var ajax = function() {
								var curr_x = $overxPos.val();
				            	var curr_y = $overyPos.val();
				            	var star = $("#makeStar").find("option:selected").val();
				            	var id = "<%=myId%>";
								$.ajax({
									type:"post",
									url:"Walk/checkWritten.jsp",
									dataType: "xml",
									data:{"xPos":curr_x, "yPos":curr_y, "id":id},
									success: function(data){
										var cnt = $(data).find("count").text();
										if(cnt == 0){
											
											$.ajax({
												type:"post",
												url:"Walk/addStar.jsp",
												dataType: "html",
												data:{"xPos":curr_x, "yPos":curr_y, "star":star, "id":id},
												success: function(data){
													$("#make_star").css("display","none");
													alert("별점을 추가했습니다");
													getStarAverage();
												}
											});
										}else{
											alert("이미 별점 작성했습니다");
										}
									}
								});
							};

							var closeOverlay = function() {
							    overlay.setMap(null);
							};
							
							var fillStars = function(){
					    		var userScoreNum = $("#makeStar option:selected").val();
					    		$(".rating i").css({color:'gray'});
					    		$('.rating i:nth-child(-n+' + userScoreNum + ')').css({color:'orange'});
					    	};
							
					    	function starRating(){
					    		var rating = $('.star_rating');
						    	var targetScore = rating.attr('data-rate');
						    	rating.each(function(){
						    		var digit = targetScore.split('.');
						    		if(digit.length > 1){
						    			for(var i=0; i<digit[0]; i++){
						    				rating.find('.star').eq(i).css({width: "100%"});
						    			}
						    			rating.find('.star').eq(digit[0]).css({width: digit[1]+'0%'});
						    		}else{
						    			for(var i=0; i<targetScore; i++){
						    				rating.find('.star').eq(i).css({width: '100%'});
						    			}
						    		}
						    	});
					    	};
					    	
							var $wrap = $('<div class="wrap" />');
							var $info = $('<div class="info" />');
							var $title = $('<div class="title" />').text(place_name);
							var $close = $('<div class="close" />').click(closeOverlay);
							var $body = $('<div class="body" />');
							var $desc = $('<div class="desc" />');
							var $ellipsis1 = $('<div class="ellipsis" />').text(road_address_name);
							var $ellipsis2 = $('<div class="ellipsis" />');
							var $url = $('<a class="link" href="' +place_url+ '" target="_blank"/>').text("홈페이지");
							var $ellipsis3 = $('<div class="ellipsis" />');
							var $grade = $('<div class="grade" />');
							var $star_rating = $('<div class="star_rating" data-rate="5">');
							var $text = $('<div class="star-wrap">별점 :&nbsp;</div>')
							var $star1 = $('<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>');
							var $star2 = $('<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>');
							var $star3 = $('<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>');
							var $star4 = $('<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>');
							var $star5 = $('<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>');
							var $starAverage = $('<div class="star-wrap" />');
							var $make_star = $('<div id="make_star" class="make_star" />');
							var $makeStar = $('<select class="makeStar" id="makeStar" />').change(fillStars);
							var $option1 = $('<option value="1" selected="selected"/>').text("1점");
							var $option2 = $('<option value="2" />').text("2점");
							var $option3 = $('<option value="3" />').text("3점");
							var $option4 = $('<option value="4" />').text("4점");
							var $option5 = $('<option value="5" />').text("5점");
							var $rating = $('<span class="rating">&nbsp;&nbsp;<i class="fas fa-star"></i>' +
							'<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>' +
							'<i class="fas fa-star"></i>&nbsp;&nbsp;</span>');
							var $star = $('<i class="fas fa-star" />');
							var $overxPos=$('<input type="hidden" value="'+x+'">');
							var $overyPos=$('<input type="hidden" value="'+y+'">');
							var $btn_add = $('<button type="button" id="btn_add" class="btn_add button" />').text("별점추가");
							$btn_add.click(ajax);
							 
							$wrap.append($info);
							$info.append($title).append($body);
							$title.append($close);
							$body.append($desc);
							$desc.append($ellipsis1).append($ellipsis2).append($ellipsis3);
							$ellipsis2.append($url);
							$ellipsis3.append($grade);
							$grade.append($star_rating);
							$star_rating.append($text).append($star1).append($star2).append($star3).append($star4).append($star5).append($starAverage);
							<%
							if(loginOk == null || loginOk.equals("no")){
								// 비로그인시 별점추가 form hide
							}else if(loginOk.equals("success")){
								// 로그인시 별점추가 form show
								%>
								checkWritten();
								$ellipsis3.append($make_star).append($overxPos).append($overyPos);
								<%
							}
							%>
							$make_star.append($makeStar).append($rating).append($btn_add);
							$makeStar.append($option1).append($option2).append($option3).append($option4).append($option5);
							
							var content = $wrap[0];
							
					        // 마커 위에 커스텀오버레이를 표시합니다
					        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					        var overlay = new kakao.maps.CustomOverlay({
					            content: content,
					            map: map,
					            position: mark.latlng
					            //position: marker.getPosition()
					        });
					        
					  		// 마커가 지도 위에 표시되도록 설정합니다
							overlay.setMap(null);
					      
					        overlays.push(overlay);
				        
							// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
						    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						    (function(marker, overlay) {
						        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
						        kakao.maps.event.addListener(marker, 'mouseover', function() {
						        	
						        });
	
						        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
						        kakao.maps.event.addListener(marker, 'mouseout', function() {
						        	
						        });
						        
						     	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
								kakao.maps.event.addListener(marker, 'click', function() {
									closeOverlays();
								    overlay.setMap(map);
								    getStarAverage();
								});
						    })(marker, overlay);
							
						})(jQuery);
		            }
		            
		         	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		            var bounds = new kakao.maps.LatLngBounds();    

		            for (var i = 0; i < markers.length; i++) {
		                // LatLngBounds 객체에 좌표를 추가합니다
		                bounds.extend(markers[i].getPosition());
		                bounds.extend(currentMarker.getPosition());
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
    };
	
	function removeMarkers() {
		for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }
		markers = [];
	};
	
	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) { 
	    var roadmapControl = document.getElementById('btnRoadmap');
	    var skyviewControl = document.getElementById('btnSkyview'); 
	    if (maptype === 'roadmap') {
	        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
	        roadmapControl.className = 'selected_btn';
	        skyviewControl.className = 'unselected_btn';
	    } else {
	        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
	        skyviewControl.className = 'selected_btn';
	        roadmapControl.className = 'unselected_btn';
	    }
	}
	
	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}
	
	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
	
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
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
	
	function panTo() {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(yPos, xPos);
	    
	    map.setLevel('3');
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);  
	}    
	
</script>
</body>
</html>

































