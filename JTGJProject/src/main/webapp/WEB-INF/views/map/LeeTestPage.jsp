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
<!--     <script src="./data/MarkerClustering.js"></script> -->
    
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
            <div class="building-more-detail">

            </div>
        </div>
    </div>

    
    <script>
        // 지도 생성
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.3595704, 127.105399),
            zoom: 4
        }); 

        
        
        // Ajax로 데이터 받아오기
        let xhr = new XMLHttpRequest();
        xhr.open('GET', '/jtgzproject/getAllInfo', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        
        // 요청이 완료되었을 때 실행할 콜백
        xhr.onload = function(){
        	if(xhr.status >= 200 && xhr.status < 300){
        		// 서버에서 받은 JSON 데이터를 파싱
        		let data = JSON.parse(xhr.responseText);
        		console.log(data);
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