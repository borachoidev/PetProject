/* var mapOptions = {
    center: new naver.maps.LatLng(35.8595704, 127.256399),
    zoom: 7
};

var map = new naver.maps.Map('book__map2', mapOptions); */

/* 포인터가능? */
var HOME_PATH = window.HOME_PATH || '.';
var anyang = new naver.maps.LatLng(37.40174758186399, 126.92253099529287);
var gangnam = new naver.maps.LatLng(37.499467355716455, 127.02924321045684);
var busan = new naver.maps.LatLng(35.115135045458906, 129.04151064531175);
var seocho = new naver.maps.LatLng(37.50304259449285, 127.02433496103328);
var sinchon = new naver.maps.LatLng(37.5524665926891, 126.93782340123782);
var jongro = new naver.maps.LatLng(37.570608384554674, 126.9852925429888);


    map = new naver.maps.Map('book__map', {
        center: new naver.maps.LatLng(35.8595704, 127.256399),
        zoom: 7
    }),
    markerAanyang = new naver.maps.Marker({
        map: map,
        position: anyang
    });
    markerGangnam = new naver.maps.Marker({
        map: map,
        position: gangnam
    });
    markerBusan = new naver.maps.Marker({
        map: map,
        position: busan
    });
	markerSeocho = new naver.maps.Marker({
        map: map,
        position: seocho
    });
	markerSinchon = new naver.maps.Marker({
        map: map,
        position: sinchon
    });
	markerJongro = new naver.maps.Marker({
        map: map,
        position: jongro
    });

var contentStringAnyang = [
        '<div class="iw_inner">',
        '   <h4>Pet & Me 안양센터</h4>',
        '   <p>경기도 안양시 만안구 만안로123 펫앤미안양점<br />',
        '       031-120-2445 <br />',
        '   </p>',
        '</div>'
    ].join('');
    
var contentStringGangnam = [
    '<div class="iw_inner">',
    '   <h4>Pet & Me 강남센터</h4>',
    '   <p>서울특별시 강남구 테헤란로 5길 11 YOO빌딩 2층<br />',
    '       02-120-2445 <br />',
    '   </p>',
    '</div>'
].join('');

var contentStringBusan = [
    '<div class="iw_inner">',
    '   <h4>Pet & Me 부산센터</h4>',
    '   <p>부산광역시 동구 중앙대로123 펫앤미부산점<br />',
    '       051-120-2445 <br />',
    '   </p>',
    '</div>'
].join('');

var contentStringSeocho = [
    '<div class="iw_inner">',
    '   <h4>Pet & Me 서초본원</h4>',
    '   <p>서울특별시 서초구 강남대로459 백암빌딩 (구관건물)<br />',
    '   </p>',
    '</div>'
].join('');

var contentStringSinchon = [
    '<div class="iw_inner">',
    '   <h4>Pet & Me 신촌센터</h4>',
    '   <p>서울특별시 마포구 백범로 23 구프라자 B1<br />',
    '   </p>',
    '</div>'
].join('');

var contentStringJongro = [
    '<div class="iw_inner">',
    '   <h4>Pet & Me 종로센터</h4>',
    '   <p>서울특별시 종로구 종로 69 YMCA빌딩 7층<br />',
    '   </p>',
    '</div>'
].join('');

var infowindowAnyang = new naver.maps.InfoWindow({
    content: contentStringAnyang,
    maxWidth: 220,
    backgroundColor: "#eee",
    borderColor: "#EDCE7A",
    borderWidth: 5,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#eee",
    pixelOffset: new naver.maps.Point(20, -20)
});

var infowindowGangnam = new naver.maps.InfoWindow({
    content: contentStringGangnam,
    maxWidth: 220,
    backgroundColor: "#eee",
    borderColor: "#EDCE7A",
    borderWidth: 5,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#eee",
    pixelOffset: new naver.maps.Point(20, -20)
});

var infowindowBusan = new naver.maps.InfoWindow({
    content: contentStringBusan,
    maxWidth: 220,
    backgroundColor: "#eee",
    borderColor: "#EDCE7A",
    borderWidth: 5,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#eee",
    pixelOffset: new naver.maps.Point(20, -20)
});

var infowindowSeocho = new naver.maps.InfoWindow({
    content: contentStringSeocho,
    maxWidth: 220,
    backgroundColor: "#eee",
    borderColor: "#EDCE7A",
    borderWidth: 5,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#eee",
    pixelOffset: new naver.maps.Point(20, -20)
});

var infowindowSinchon = new naver.maps.InfoWindow({
    content: contentStringSinchon,
    maxWidth: 220,
    backgroundColor: "#eee",
    borderColor: "#EDCE7A",
    borderWidth: 5,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#eee",
    pixelOffset: new naver.maps.Point(20, -20)
});

var infowindowJongro = new naver.maps.InfoWindow({
    content: contentStringJongro,
    maxWidth: 220,
    backgroundColor: "#eee",
    borderColor: "#EDCE7A",
    borderWidth: 5,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#eee",
    pixelOffset: new naver.maps.Point(20, -20)
});

naver.maps.Event.addListener(markerAanyang, "click", function(e) {
    if (infowindowAnyang.getMap()) {
    	infowindowAnyang.close();
    } else {
    	infowindowAnyang.open(map, markerAanyang);
    }
});

naver.maps.Event.addListener(markerGangnam, "click", function(e) {
    if (infowindowGangnam.getMap()) {
    	infowindowGangnam.close();
    } else {
    	infowindowGangnam.open(map, markerGangnam);
    }
});

naver.maps.Event.addListener(markerBusan, "click", function(e) {
    if (infowindowBusan.getMap()) {
    	infowindowBusan.close();
    } else {
    	infowindowBusan.open(map, markerBusan);
    }
});

naver.maps.Event.addListener(markerSeocho, "click", function(e) {
    if (infowindowSeocho.getMap()) {
    	infowindowSeocho.close();
    } else {
    	infowindowSeocho.open(map, markerSeocho);
    }
});

naver.maps.Event.addListener(markerSinchon, "click", function(e) {
    if (infowindowSinchon.getMap()) {
    	infowindowSinchon.close();
    } else {
    	infowindowSinchon.open(map, markerSinchon);
    }
});

naver.maps.Event.addListener(markerJongro, "click", function(e) {
    if (infowindowJongro.getMap()) {
    	infowindowJongro.close();
    } else {
    	infowindowJongro.open(map, markerJongro);
    }
});