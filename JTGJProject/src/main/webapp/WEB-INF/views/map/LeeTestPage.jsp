<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>네이버지도 구현</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sj7g9t2k7p&submodules=geocoder"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="js/MarkerClustering.js"></script>
    
    <style>
        *{
            margin:0;
            padding:0;
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
        }

        .building-filter{
            position: absolute;
            width: 25%;
            height: 10%;
            top: 20px;
            left: 20px;
            z-index: 10; 
            display: flex;
            flex-direction: column;
        }

        .building-detail{
            position: absolute;
            bottom: 5%;
            left: 20px;
            width: 25%;
            height: 75%;
            background-color: #EEEEEE;
            z-index: 10; 
            border-radius: 10px;
            padding: 20px;
            opacity: 80%;
            font-weight: bolder;
        }

        .building-detail div{
            width: 94%;
        }

        #search-box{
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="map">
    	<!-- 필터 -->
        <div class="building-filter">
            <div>
                <!-- onchange="sortingEnergyGrade(this.value)" -->
                <select class="form-select mb-2" id="building-select">
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
            </div>
            <div class="mb-2"><input type="text" class="form-control me-2" placeholder="주소를 입력해주세요!" id="input_name"></div>
            <div class="btn btn-primary mb-2" onclick="searchBuilding()">조회하기</div>
        </div>

        <!-- 정보박스 -->
        <div class="building-detail">
            <div class="building-more-detail"></div>
        </div>
    </div>

    
    <script>
        // 지도 생성
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(36.34, 127.77),
            zoom: 7
        }); 
	
     	// 마커클러스링을 위해 생성된 마커들을 저장할 배열 markers
        let markers = [];
        let markerClustering;
        const CHUNK_SIZE = 500;

        // 건물의 정보를 넣을 div
        let v_buildingDetail = document.getElementsByClassName('building-more-detail');
        
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
                minClusterSize: 10,
                maxZoom: 14,
                map: map,
                markers: applyMarker,
                disableClickZoom: false,
                gridSize: 200,
                icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
                indexGenerator: [50, 100, 200, 300, 500],
                averageCenter: true,
                stylingFunction: function(clusterMarker, count) {
                    $(clusterMarker.getElement()).find('div:first-child').text(count);
                }
            });
            map.refresh();
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
     
		// chunk 이용 -> 각각의 마커 생성시 일일이 map에 적용하지 않음
        function loadMarkersInChunks(v_jsonData, startIndex = 0){
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

                // 마커 클릭 이벤트 추가
                naver.maps.Event.addListener(marker, "click", function() {
                	// 발전량 추가
                	if(marker['zeb'] == 'N' && marker['grade'].length > 4){
                		v_buildingDetail[0].innerHTML = 
    				        '목적: ' + v_jsonData['purpose'][i] + '<br>' +
    				        '건물이름: ' + v_jsonData['name'][i] + '<br>' +
    				        '주소: ' + v_jsonData['address'][i] + '<br>' +
    				        '에너지효율등급: ' + v_jsonData['grade'][i] + '<br>' +
    				        '1차 에너지 소요량: ' + v_jsonData['1st_energy'][i] + '<br>' +
    				        '인증일자: ' + v_jsonData['crtif'][i] + '<br>' +
    				        '그린에너지건축등급: ' + v_jsonData['zeb'][i] + '<br>' +
                			'1000m^2 : ' + v_jsonData['mm_thous_p'][i] + '<br>' +
                			'10000m^2 : ' + v_jsonData['mm_ten_thous_p'][i] + '<br>' +
                			'50000m^2 : ' + v_jsonData['mm_fifty_thous_p'][i];
                	} else{
               			v_buildingDetail[0].innerHTML = 
       				        '목적: ' + v_jsonData['purpose'][i] + '<br>' +
       				        '건물이름: ' + v_jsonData['name'][i] + '<br>' +
       				        '주소: ' + v_jsonData['address'][i] + '<br>' +
       				        '에너지효율등급: ' + v_jsonData['grade'][i] + '<br>' +
       				        '1차 에너지 소요량: ' + v_jsonData['1st_energy'][i] + '<br>' +
       				        '인증일자: ' + v_jsonData['crtif'][i] + '<br>' +
       				        '그린에너지건축등급: ' + v_jsonData['zeb'][i] + '<br>';
                	}
                	
				    
				});

                markers.push(marker);
            }

            // 다음 청크로 이동
            if(endIndex < v_jsonData['address'].length){
                requestAnimationFrame(function() {
                    loadMarkersInChunks(v_jsonData, endIndex);
                });
            } else{
                // 모든 마커가 생성된 후 클러스터링
                console.log('모든 마커 생성 완료');
                createCluster(markers);
            }
        }
		
        // 검색 기능
        let v_inputName = document.getElementById('input_name');
        let v_buildingSelect = document.getElementById('building-select');
        function searchBuilding(){
            console.log("검색기능 클릭");
            v_buildingDetail[0].innerHTML = "";

            let inputValue = v_inputName.value;
            let selectValue = v_buildingSelect.value;

            let firstMarkers = [];
            let secMarkers = [];

            if(selectValue == "-1"){
                alert('정확한 조건을 선택해주세요!');
                v_inputName.value = "";
                return;
            }

            // markers 배열에 저장된 마커들 삭제 
            for(let i = 0; i < markers.length; i++){
                markers[i].setMap(null);
            }

            // input으로 marker들 1차 선별
            for(let i = 0; i < markers.length; i++){
                if(markers[i]['address'].includes(inputValue)){
                    firstMarkers.push(markers[i]);
                }
            }

            console.log(firstMarkers);

            console.log(selectValue);
            // select로 2차 선별
            if(selectValue == 0){
                for(let i = 0; i < firstMarkers.length; i++){
                    secMarkers.push(firstMarkers[i]);
                }
            } else{
                for(let i = 0; i < firstMarkers.length; i++){
                    if(firstMarkers[i]['grade'] == selectValue){
                        secMarkers.push(firstMarkers[i]);
                    }
                }
            }

            createCluster(secMarkers);  // 필터링된 마커로 클러스터링
            map.setZoom(7);

            v_inputName.value = "";
        }

        
        // Ajax로 데이터 받아오기
        let xhr = new XMLHttpRequest();
        xhr.open('GET', '/jtgzproject/getAllInfo', true);
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
                 
                 loadMarkersInChunks(v_jsonData);
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