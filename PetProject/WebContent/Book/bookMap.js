/* var mapOptions = {
    center: new naver.maps.LatLng(35.8595704, 127.256399),
    zoom: 7
};

var map = new naver.maps.Map('book__map2', mapOptions); */

/* 포인터가능? */
var HOME_PATH = window.HOME_PATH || '.';
var anyang = new naver.maps.LatLng(37.40174758186399, 126.92253099529287);
var gangnam = new naver.maps.LatLng(37.49796325218076, 127.02752734839295);
var busan = new naver.maps.LatLng(35.115135045458906, 129.04151064531175);


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

var contentStringAnyang = [
        '<div class="iw_inner">',
        '   <h3>Pet & Me 안양점</h3>',
        '   <p>경기도 안양시 만안구 만안로123 펫앤미안양점<br />',
        '       031-120-2445 <br />',
        '   </p>',
        '</div>'
    ].join('');
    
var contentStringGangnam = [
    '<div class="iw_inner">',
    '   <h3>Pet & Me 강남점</h3>',
    '   <p>서울특별시 강남구 강남로123 펫앤미강남점<br />',
    '       02-120-2445 <br />',
    '   </p>',
    '</div>'
].join('');

var contentStringBusan = [
    '<div class="iw_inner">',
    '   <h3>Pet & Me 부산점</h3>',
    '   <p>부산광역시 동구 중앙대로123 펫앤미부산점<br />',
    '       051-120-2445 <br />',
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