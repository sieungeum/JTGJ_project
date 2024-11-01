<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <%@ include file="/WEB-INF/inc/head.jsp"%>
    <title>네이버지도 구현</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sj7g9t2k7p&submodules=geocoder"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   
   <script src="js/MarkerClustering.js"></script>
   <script src="js//TL_SCCO_CTPRVN.js"></script>
   <script src="js//custom_overlay.js"></script>

    <style>
        *{
            margin:0;
            padding:0;
        }
        a{
        	text-decoration: none;
        }

        html,
        body{
            width:100%;
            height:100%;
        }

        #map{
            width:100%;
            height:100%;
            position: relative;
            z-index: 0;
        }
        
        .icon-info{
            position: absolute;
            right: 1%;
            top: 10%;
            width: 15%;
            height: 15%;
            z-index: 10;
            background-color: rgb(255, 255, 255, 0.8);
            padding: 5px;
            border-radius: 5px;
        }

        .icon-info-detail{
            display: flex;
            align-items: center;
            height: calc(100% / 5);
            font-weight: bolder;
            font-size: 10px;
        }

        .building-filter{
            position: absolute;
            width: 35%;
            height: 10%;
            top: 12%;
            left: 1%;
            z-index: 10; 
            display: flex;
            flex-direction: column;
        }

        .building-detail{
            position: absolute;
            top: 37%;
            left: 1%;
            width: 35%;
            height: 50%;
            background-color: #FFFFFF;
            z-index: 10; 
            border-radius: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 15px;
            opacity: 80%;
            font-weight: bolder;
            overflow: auto;
        }

        .building-detail div{
            width: 94%;
        }

        .building-more-detail{
            display: flex;
            width:110%;
            flex-direction: column;
        }

        .info-detail{
            display: flex;
            margin-bottom: 2px;
            margin-top: 10px;
        }

        .title{
            width:40%;
            font-size:14px;
            font-weight:bolder;
        }

        .content{
            font-size:14px;
            width: 70%;
        }

        .need-energy{
            font-size:12px;
            
        }

        .need-energy p {
            color:red;
            display:inline;
        }

        #search-box{
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        
        .custom-overlay {
            position: absolute;
            background-color: rgb(250, 250, 250, 0.9);
            padding: 5px;
            border-radius: 5px;
            font-size: 10px;
            font-weight: bolder;
        }
        
        .building-list{
            font-size:13px; 
            margin-bottom:8px; 
            cursor:pointer;
            border-radius:10px;
            background-color:#EEEEEE;
        }

        .building-list:hover{
            color: greenyellow;
        }
    </style>
</head>
<body class="landing is-preload">
    <%@ include file="/WEB-INF/inc/nav.jsp"%>
    <div id="map" style="font-size: 10px;">
    	 <div class="icon-info">
            <div class="icon-info-detail"><img style="background-color:#04B431;border-radius:100%;" src="./images/emoji-sunglasses.svg">&nbsp;1++++ / 1+++ 등급</div>
            <div class="icon-info-detail"><img style="background-color:#64FE2E;border-radius:100%;" src="./images/emoji-heart-eyes.svg">&nbsp;1++ / 1+ 등급</div>
            <div class="icon-info-detail"><img style="background-color:#F4FA58;border-radius:100%;" src="./images/emoji-smile.svg">&nbsp;1 / 2 등급</div>
            <div class="icon-info-detail"><img style="background-color:#FF8000;border-radius:100%;" src="./images/emoji-neutral.svg">&nbsp;3 / 4 등급</div>
            <div class="icon-info-detail"><img style="background-color:#FF0000;border-radius:100%;" src="./images/emoji-frown.svg">&nbsp;5 / 6 등급</div>
        </div>
    
        <!-- 필터 -->
        <div class="building-filter">
            <div class="d-flex">
                <!-- onchange="sortingEnergyGrade(this.value)" -->
                <select class="form-select mb-2 me-1" style="width:70%;" id="building-select">
                    <option selected value="-1">Open this select menu</option>
                    <option value="0">전체보기</option>
                    <option value="1++++등급">1++++등급</option>
                    <option value="1+++등급">1+++등급</option>
                    <option value="1++등급">1++등급</option>
                    <option value="1+등급">1+등급</option>
                    <option value="1등급">1등급</option>
                    <option value="2등급">2등급</option>
                    <option value="3등급">3등급</option>
                    <option value="4등급">4등급</option>
                    <option value="5등급">5등급</option>
                    <option value="6등급">6등급</option>
                </select>
                
                 <div class="btn btn-warning mb-2" style="width:30%;" onclick="f_reduction()">지도축소</div>
            </div>
            <div class="mb-2"><input type="text" class="form-control me-2" placeholder="주소를 입력해주세요!" id="input_name"></div>
            <div class="btn btn-primary mb-2" onclick="searchBuilding()">조회하기</div>
        </div>

        <!-- 정보박스 -->
        <div class="building-detail">
            <div class="building-more-detail"></div>
        </div>

      <%@ include file="/WEB-INF/inc/footer.jsp"%>
    </div>
    
    <script>
        // 지도 생성
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(36.34, 127.77),
            zoom: 7
        }); 
   
        // 마커클러스링을 위해 생성된 마커들을 저장할 배열 markers
        let markers = [];
        let infoWindows = [];
        let activeInfoWindow = null;
        let markerClustering;
        const CHUNK_SIZE = 300;

        // 건물의 정보를 넣을 div
        let v_buildingDetail = document.getElementsByClassName('building-more-detail');

        // 줌 8 이하 시 나타나는 커스텀 오버레이를 담을 배열
        let overlays = [];
        
        // promise 로 먼저 실행
         // chunk 이용 -> 각각의 마커 생성시 일일이 map에 적용하지 않음
        function loadMarkersInChunks(v_jsonData, startIndex = 0){
            return new Promise((resolve) => {
               let endIndex = Math.min(startIndex + CHUNK_SIZE, v_jsonData['address'].length);

                  for(let i = startIndex; i < endIndex; i++){
                      if(!v_jsonData['lat'][i] || !v_jsonData['lng'][i]) continue;

                      let marker = new naver.maps.Marker({
                          position: new naver.maps.LatLng(v_jsonData['lat'][i], v_jsonData['lng'][i]),
                          title: v_jsonData['name'][i],
                          icon: {
                              content: getMarkerIconByGrade(v_jsonData['grade'][i])
                          },
                          draggable: false,
                          grade: v_jsonData['grade'][i],
                          address: v_jsonData['address'][i],
                          zeb: v_jsonData['zeb'][i]
                      });

                      // 인포윈도우 추가
                      var contentString = [
                          '<div class="infoWindow-box" style="padding:5px;">',
                          '   <div style="text-align:center;"><h4>' + v_jsonData['name'][i] +'</h4></div>',
                          '   <div style="text-align:center;font-size:15px;"><p>' + v_jsonData['address'][i] + '</p></div>',
                          '</div>'
                      ].join('');                      

                      infoWindow = new naver.maps.InfoWindow({
                          content: contentString
                      });

                      infoWindows.push(infoWindow);
                      
                      // 마커 클릭 이벤트 추가
                      naver.maps.Event.addListener(marker, "click", function() {
                         // 발전량 추가
                         if(marker['zeb'] == 'N' && marker['grade'].length > 4) {
                            v_buildingDetail[0].innerHTML = 
		                        '<div class="info-detail"><div class="title">목적</div> <div class="content">' + v_jsonData['purpose'][i] + '</div></div>' +
		                        '<div class="info-detail"><div class="title">건물이름</div> <div class="content">' + v_jsonData['name'][i] + '</div></div>' +
		                        '<div class="info-detail"><div class="title">주소</div> <div class="content">' + v_jsonData['address'][i] + '</div></div>' +
		                        '<div class="info-detail"><div class="title">에너지효율등급</div> <div class="content">' + v_jsonData['grade'][i] + '</div></div>' +
		                        '<div class="info-detail"><div class="title">1차 에너지 소요량</div> <div class="content">' + v_jsonData['1st_energy'][i] + '</div></div>' +
		                        '<div class="info-detail"><div class="title">인증일자</div> <div class="content">' + v_jsonData['crtif'][i] + '</div></div>' +
		                        '<div class="info-detail"><div class="title">그린에너지건축물</div> <div class="content">' + v_jsonData['zeb'][i] + '</div></div>' +
		                        '<div style="margin-top:20px;margin-bottom:5px;font-size: 15px;color:green">해당 건물이 자립하기 위해서는...</div>' +
		                        '<div class="need-energy">' +
                                '1000m<sup>2</sup> <p>' + v_jsonData['mm_thous_p'][i] + '</p>의 태양광패널이 필요합니다!<br>' +
                                '10000m<sup>2</sup> <p>' + v_jsonData['mm_ten_thous_p'][i] + '</p>의 태양광패널이 필요합니다!<br>' +
                                '50000m<sup>2</sup> <p>' + v_jsonData['mm_fifty_thous_p'][i] + '</p>의 태양광패널이 필요합니다!</div>';
                         } else {
                              v_buildingDetail[0].innerHTML = 
	                              '<div class="info-detail"><div class="title">목적</div> <div class="content">' + v_jsonData['purpose'][i] + '</div></div>' +
	                              '<div class="info-detail"><div class="title">건물이름</div> <div class="content">' + v_jsonData['name'][i] + '</div></div>' +
	                              '<div class="info-detail"><div class="title">주소</div> <div class="content">' + v_jsonData['address'][i] + '</div></div>' +
	                              '<div class="info-detail"><div class="title">에너지효율등급</div> <div class="content">' + v_jsonData['grade'][i] + '</div></div>' +
	                              '<div class="info-detail"><div class="title">1차 에너지 소요량</div> <div class="content">' + v_jsonData['1st_energy'][i] + '</div></div>' +
	                              '<div class="info-detail"><div class="title">인증일자</div> <div class="content">' + v_jsonData['crtif'][i] + '</div></div>' +
	                              '<div class="info-detail"><div class="title">그린에너지건축물</div> <div class="content">' + v_jsonData['zeb'][i] + '</div></div>';
                         }
                	  });

                      markers.push(marker);
                      regionSort(marker);
                  }

                  // 다음 청크로 이동
                  if(endIndex < v_jsonData['address'].length){
                      requestAnimationFrame(() => loadMarkersInChunks(v_jsonData, endIndex).then(resolve));
                  } else{
                      // 모든 마커가 생성된 후 클러스터링
                      console.log('모든 마커 생성 완료');
                      resolve(); // 모든 마커 로드 후 resolve 호출
                  }               
            });
        }

        /* 행정구역 작업 */ 
        // 행정구역별 마커를 저장할 배열 선언
        // 각 지역의 배열 안에는 그 지역에 해당하는 마커들이 들어감
        let region_marker_count = {
            '서울특별시' : [], '부산광역시' : [], '대구광역시' : [], '인천광역시' : [],
            '광주광역시' : [], '대전광역시' : [], '울산광역시' : [], '세종특별자치시' : [],
            '경기도' : [], '강원도' : [], '충청북도' : [], '충청남도' : [],
            '전라북도' : [], '전라남도' : [], '경상북도' : [], '경상남도' : [],
            '제주특별자치도' : [], '기타' : []
        }         
         
     	// 행정구역별 중심좌표를 배열로 저장
        const regions = [
            { name: "서울특별시", coords: [37.5888, 126.9888] },
            { name: "부산광역시", coords: [35.2796, 129.0756] },
            { name: "대구광역시", coords: [35.8888, 128.5955] },
            { name: "인천광역시", coords: [37.7563, 126.3052] },
            { name: "광주광역시", coords: [35.2095, 126.9526] },
            { name: "대전광역시", coords: [36.3504, 127.3845] },
            { name: "울산광역시", coords: [35.6384, 129.3114] },
            { name: "세종특별자치시", coords: [36.5871, 127.2817] },
            { name: "경기도", coords: [37.367, 127.590] },
            { name: "강원도", coords: [37.755, 128.509] },
            { name: "충청북도", coords: [36.9357, 127.7914] },
            { name: "충청남도", coords: [36.8184, 126.8009] },
            { name: "전라북도", coords: [35.8204, 127.3088] },
            { name: "전라남도", coords: [34.8160, 126.6630] },
            { name: "경상북도", coords: [36.5760, 128.8056] },
            { name: "경상남도", coords: [35.5083, 128.3021] },
            { name: "제주특별자치도", coords: [33.4384, 126.5381] }
        ];

        // 행정구역 분류 함수
        // 마커가 인자로 들어감
        function regionSort(address){
            // address undefined 또는 null이 아닌지 확인
            if (address['address'] && typeof address['address'] === 'string') {
                if (address['address'].includes('서울') && !address['address'].includes('경기')) {
                    region_marker_count['서울특별시'].push(address);
                } else if (address['address'].includes('경기') && !address['address'].includes('경기장')) {
                    region_marker_count['경기도'].push(address);
                } else if (address['address'].includes('부산') && (!address['address'].includes('경남') && !address['address'].includes('전남'))) {
                    region_marker_count['부산광역시'].push(address);
                } else if (address['address'].includes('대구')) {
                    region_marker_count['대구광역시'].push(address);
                } else if (address['address'].includes('인천')) {
                    region_marker_count['인천광역시'].push(address);
                } else if (address['address'].includes('광주')) {
                    region_marker_count['광주광역시'].push(address);
                } else if (address['address'].includes('대전') && !address['address'].includes('강원')) {
                    region_marker_count['대전광역시'].push(address);
                } else if (address['address'].includes('울산')) {
                    region_marker_count['울산광역시'].push(address);
                } else if (address['address'].includes('세종')) {
                    region_marker_count['세종특별자치시'].push(address);
                } else if (address['address'].includes('강원')) {
                    region_marker_count['강원도'].push(address);
                } else if (address['address'].includes('제주')) {
                    region_marker_count['제주특별자치도'].push(address);
                } else if (address['address'].includes('충청북도') || address['address'].includes('충북')) {
                    region_marker_count['충청북도'].push(address);
                } else if (address['address'].includes('충청남도') || address['address'].includes('충남')) {
                    region_marker_count['충청남도'].push(address);
                } else if (address['address'].includes('전라남도') || address['address'].includes('전남')) {
                    region_marker_count['전라남도'].push(address);
                } else if (address['address'].includes('전라북도') || address['address'].includes('전북')) {
                    region_marker_count['전라북도'].push(address);
                } else if (address['address'].includes('경상북도') || address['address'].includes('경북')) {
                    region_marker_count['경상북도'].push(address);
                } else if (address['address'].includes('경상남도') || address['address'].includes('경남')) {
                    region_marker_count['경상남도'].push(address);
                } else {
                    region_marker_count['기타'].push(address);
                }
            } else {
                console.log("유효하지 않은 데이터 : " + address);
            }
        }        
        
        // v_json 데이터를 지도에 추가
        map.data.addGeoJson(v_json);

        // GeoJSON Feature별로 마커 추가
        let new_markers = [];
        
        /* 클러스터링 작업 */
        // 마커 클러스터 생성 함수
        function createCluster(applyMarker){

            console.log('클러스터링 실행');

            var htmlMarker1 = {
            content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-1.png);background-size:contain;"></div>',
            size: N.Size(40, 40),
            anchor: N.Point(20, 20)
            },
            htmlMarker2 = {
                content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-2.png);background-size:contain;"></div>',
                size: N.Size(40, 40),
                anchor: N.Point(20, 20)
            },
            htmlMarker3 = {
                content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-3.png);background-size:contain;"></div>',
                size: N.Size(40, 40),
                anchor: N.Point(20, 20)
            },
            htmlMarker4 = {
                content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-4.png);background-size:contain;"></div>',
                size: N.Size(40, 40),
                anchor: N.Point(20, 20)
            },
            htmlMarker5 = {
                content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-5.png);background-size:contain;"></div>',
                size: N.Size(40, 40),
                anchor: N.Point(20, 20)
            };

            if(markerClustering){
                markerClustering.map = null;
                markerClustering = null;
            }

            markerClustering = new MarkerClustering({
                minClusterSize: 2,
                maxZoom: 15,
                map: map,
                markers: applyMarker,
                gridSize: 100,
                icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
                indexGenerator: [10, 50, 100, 300, 500],
                averageCenter: true,
                stylingFunction: function(clusterMarker, count) {
                    $(clusterMarker.getElement()).find('div:first-child').text(count);
                    
                    // 클러스터 마커 클릭 이벤트 추가
                    naver.maps.Event.addListener(clusterMarker, 'click', function() {
                        // `markerClustering._clusters` 배열에서 클릭된 클러스터 객체 찾기
                        const cluster = markerClustering._clusters.find(c => c._clusterMarker === clusterMarker);

                        if (cluster) {
                            const clusterMembers = cluster.getClusterMember();
                        
                            v_buildingDetail[0].innerHTML = '';
                            for(let i = 0; i < clusterMembers.length; i++){
                                let lng = clusterMembers[i]['position']['x'];
                                let lat = clusterMembers[i]['position']['y'];
                                let address = clusterMembers[i]['address'];
                                let name = clusterMembers[i]['title'];

                                let content = '<div class="building-list" onclick="moveToMarker(' + lat + ', ' + lng + ', \'' + name + '\', \'' + address + '\')">' + (i + 1) + '. ' + address + '</div>';
                                v_buildingDetail[0].innerHTML += content;
                            }
                        }
                    });
                }
            });
            
            map.refresh();
        }
        
        // 클러스터 항목 클릭시 해당 마커로 이동
        function moveToMarker(lat, lng, name, address){
            let target = new naver.maps.LatLngBounds(
                new naver.maps.LatLng(lat, lng)
            );

            map.panToBounds(target);
        }

        // 지도 축소 버튼
        function f_reduction(){
            map.setZoom(7);
            v_buildingDetail[0].innerHTML = '';
            activeInfoWindow.close();
        }
        
        // 마커와 클러스터링 제거 함수
        function clearMarkersAndClusters(hideOnly = false){
            if(markerClustering){
                markerClustering.map = null;
                markerClustering = null;
            }

            markers.forEach(function(marker){
               if(hideOnly){
                  marker.setVisible(false); // 마커 숨기기
               } else {
                  marker.setMap(null); // 마커 제거   
               }
            });
        }
        
       // 에너지 등급에 따른 마커 이미지 html/css 
        function getMarkerIconByGrade(grade) {
            if (grade == '1++++등급' || grade == '1+++등급') {
                return '<div><img src="./images/emoji-sunglasses.svg" style="background-color:#04B431;border-radius:100%;"></div>';
            } else if (grade == '1++등급' || grade == '1+등급') {
                return '<div><img src="./images/emoji-heart-eyes.svg" style="background-color:#64FE2E;border-radius:100%;"></div>';
            } else if (grade == '1등급' || grade == '2등급') {
                return '<div><img src="./images/emoji-smile.svg" style="background-color:#F4FA58;border-radius:100%;"></div>';
            } else if (grade == '3등급' || grade == '4등급') {
                return '<div><img src="./images/emoji-neutral.svg" style="background-color:#FF8000;border-radius:100%;"></div>';
            } else if (grade == '5등급' || grade == '6등급') {
                return '<div><img src="./images/emoji-frown.svg" style="background-color:#FF0000;border-radius:100%;"></div>';
            } else {
                return '<div><img src="./images/question-diamond.svg" style="background-color:#EEEEEE;border-radius:100%;"></div>';
            }
        }        
       
        // 커스텀 오버레이 
        map.data.forEach(function(feature) {
            let geometry = feature['_raw']['geometry'];

            if (geometry['type'] === 'Polygon') {
                let coordinates = geometry['coordinates'];
                let region = feature['property_CTP_KOR_NM'];
                let position;
                for(let i = 0; i < regions.length; i++){
                    if(region == regions[i]['name']){
                        position = new naver.maps.LatLng(regions[i]['coords'][0], regions[i]['coords'][1]);
                        break;
                    }
                }

                // 중심 좌표에 마커 추가
                let marker = new naver.maps.Marker({
                    position: position,
                    title: feature.getProperty('CTP_ENG_NM') // GeoJSON 속성에서 이름 가져옴
                });
                new_markers.push(marker); // 마커 배열에 저장
            }
        });

        // GeoJSON 스타일 설정 (폴리곤 스타일링)
        map.data.setStyle(function(feature) {
            return {
                fillColor: '#FFFFFF',   // 폴리곤 채우기 색상
                fillOpacity: 0.3,       // 채우기 불투명도
                strokeColor: '#00FF82', // 경계선 색상
                strokeWeight: 4,        // 경계선 두께
                strokeOpacity: 0.7      // 경계선 불투명도
            };
        });
        
        // 검색 기능
        let v_inputName = document.getElementById('input_name');
        let v_buildingSelect = document.getElementById('building-select');
        let isSearching = false; // true 일 시 검색함수 실행
        function searchBuilding(){
           v_buildingDetail[0].innerHTML = "";
            isSearching = true;
            let selectGrade = v_buildingSelect.value; // 선택된 에너지 등급
            let inputAddress = v_inputName.value.trim(); // 주소값

            // 기존 region_marker_count 와 markers 필터링
            // (1) markers 필터링
            let filteredMarkers = markers.filter(marker => {
                let addressMatches = marker.address.includes(inputAddress);
                let gradeMatches = marker.grade === selectGrade || selectGrade === "0"; // 0은 전체보기
                return addressMatches && gradeMatches;
            });
        
            // (2) region_marker_count 필터링
            let filteredRegionMarkerCount = {};
            for (let region in region_marker_count) {
                filteredRegionMarkerCount[region] = region_marker_count[region].filter(marker => {
                    return filteredMarkers.includes(marker);
                });
            }

            // 줌 레벨에 따른 오버레이 및 클러스터 처리
            let zoomLevel = map.getZoom();
            if (zoomLevel < 9){
                clearMarkersAndClusters(); // 기존 마커 제거
                // 오버레이의 content를 filteredRegionMarkerCount에 맞춰 업데이트
                overlays.forEach(overlay => {
                	console.log(overlay._element.css);
                    let regionName = overlay._element.text().split(':')[0]; // 지역 이름 추출
                    let newCount = filteredRegionMarkerCount[regionName] ? filteredRegionMarkerCount[regionName].length : 0;

                    // 기존 지역 이름 유지하고 content만 변경
                    overlay._element.html(regionName + ": " + newCount);
                    overlay.setMap(map); // 오버레이 다시 표시
                });
                            
            } else {
                // 클러스터링 작업
                clearMarkersAndClusters() // 기존 마커 제거
                overlays.forEach(overlay => overlay.setMap(null)); // 커스텀 오버레이 표시
                createCluster(filteredMarkers);
            }
        }
        
        // loadMarkersInChunks() 함수 실행 후 나머지 기능 실행
        async function mainProgram(){
           await loadMarkersInChunks(v_jsonData);
           
           console.log('데이터 불러오기 완료!');      
           
           // 행정 마커 추가
           map.data.forEach(function(feature) {
                let geometry = feature['_raw']['geometry'];

                if (geometry['type'] === 'Polygon') {
                    let coordinates = geometry['coordinates'];
                    let region = feature['property_CTP_KOR_NM'];
                    let count = 0;
                    let position;
                    
                    // 지역명이 같다면 위도, 경도 저장
                    for(let i = 0; i < regions.length; i++){
                        if(region == regions[i]['name']){
                            position = new naver.maps.LatLng(regions[i]['coords'][0], regions[i]['coords'][1]);
                            break;
                        }
                    }

                    // 지역명이 같다면 마커의 개수 저장
                    for(let key in region_marker_count){
                        if(region.includes(key)){
                            count = region_marker_count[key].length;
                            break;
                        }
                    }

                    // 중심 좌표에 마커 추가
                    let marker = new naver.maps.Marker({
                        position: position,
                        title: feature.getProperty('CTP_ENG_NM') // GeoJSON 속성에서 이름 가져옴
                    });

                    // 오버레이 생성
                    let overlay = new CustomOverlay({
                        position: position,
                        map: map,
                        content: region + ': ' + count,
                    });

                    overlays.push(overlay);
                    new_markers.push(marker); // 마커 배열에 저장
                }
            });           
           
           
            // GeoJSON 스타일 설정(폴리곤 스타일링)
            map.data.setStyle(function(feature) { 
                return {
                    fillColor: '#FFFFFF', // 폴리곤 색상 채우기
                    fillOpacity: 0.3, // 채우기 불투명도
                    strokeColor: '#00FF82', // 경계선 색상
                    strokeWeight: 4, // 경계선 두께
                    strokeOpacity: 0.7 // 경계선 불투명도
                };
            });

            // 줌 레벨에 따른 마커/클러스터링 처리
            naver.maps.Event.addListener(map, 'zoom_changed', function() {
                let zoomLevel = map.getZoom();

                if(isSearching){
                    // 검색 중이면 기존 이벤트 중단 -> searchAllBuilding 호출
                    searchBuilding();
                } else{
                if(zoomLevel < 9){
                        // 마커와 클러스터링 제거
                        clearMarkersAndClusters();
                        
                        // 줌 레벨이 8 이하일 때 마커 및 GeoJSON 다시 표시
                        overlays.forEach(overlay => overlay.setMap(map)); // 커스텀 오버레이 표시
                    }else{
                        // 줌 레벨이 8을 초과하면 마커 제거 및 GeoJSON 숨기기
                        overlays.forEach(overlay => overlay.setMap(null)); // 커스텀 오버레이 표시
                        createCluster(markers);                     
                    }
                }
                
            });        
            
            // 인포윈도우
            for(let i = 0; i < markers.length; i++){
                let infoWindow = infoWindows[i];
                let marker = markers[i];

                naver.maps.Event.addListener(marker, 'click', function(){
                    if(infoWindow.getMap()){
                        infoWindow.close();
                        activeInfoWindow = null;
                    } else{
                        infoWindow.open(map, marker);
                        activeInfoWindow = infoWindow;
                    }
                });
            }
        }
        

        
        // Ajax로 데이터 받아오기
        let xhr = new XMLHttpRequest();
        xhr.open('GET', '/getAllInfo', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        
       // 각 컬럼의 값을 담을 객체 v_jsonData 선언
        let v_jsonData = {
            'purpose': [], 'name': [], 'grade': [],
            '1st_energy': [], 'crtif': [], 'address': [],
            'zeb': [], 'mm_thous_p' : [], 'mm_ten_thous_p' : [], 
            'mm_fifty_thous_p' : [], 'lat': [], 'lng': []
        };

        
        // 요청이 완료되었을 때 실행할 콜백
        xhr.onload = function(){
           if(xhr.status >= 200 && xhr.status < 300){
              // 서버에서 받은 JSON 데이터를 파싱
              let data = JSON.parse(xhr.responseText);
              
              for(let i = 0; i < data.length; i++){
                 v_jsonData['purpose'].push(data[i]['purposeKindName']);
                 v_jsonData['name'].push(data[i]['bldNm']);
                 v_jsonData['grade'].push(data[i]['grdName']);
                 v_jsonData['1st_energy'].push(data[i]['wOneEnergyRequire']);
                 v_jsonData['crtif'].push(data[i]['crtifIsuDd']);
                 v_jsonData['address'].push(data[i]['locAddr']);
                 v_jsonData['zeb'].push(data[i]['zeb']);
                 v_jsonData['mm_thous_p'].push(data[i]['mmThousP']);
                 v_jsonData['mm_ten_thous_p'].push(data[i]['mmTenThousP']);
                 v_jsonData['mm_fifty_thous_p'].push(data[i]['mmFiftyThousP']);
                 v_jsonData['lat'].push(data[i]['lat']);
                 v_jsonData['lng'].push(data[i]['lng']);
              }
                 
                 console.log(v_jsonData);
                 
                 // 마커 로드 후 프로그램 진행
                 mainProgram();
           } else{
              console.error('서버에 데이터를 가져오지 못했습니다.');
           }
        };
        
        // 에러가 발생했을 시..
        xhr.onerror = function(){
           console.error('서버 요청 중 에러가 발생했습니다.');
        };
        
        // 요청 전송
        xhr.send();
        
    </script>

</body>
</html>