<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>네이버지도 구현</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mrdvm3632w&submodules=geocoder"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <%-- <%@ include file="/WEB-INF/inc/head.jsp"%>  --%>
    
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
            align-items: center;
        }

        .building-detail{
            position: absolute;
            bottom: 10%;
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
        <!-- header -->
		<%-- <%@ include file="/WEB-INF/inc/nav.jsp"%> --%>

        <!-- 필터 -->
        <!-- <div class="building-filter">
            <select class="form-select" id="building-select" onchange="sortingEnergyGrade(this.value)">
                <option selected>Open this select menu</option>
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
        </div> -->

        <!-- 정보박스 -->
        <!-- <div class="building-detail">
            <div class="input-group mb-3">
                <input type="text" class="form-control me-2" placeholder="주소를 입력해주세요!" id="input_name">
                <div id="search-box" onclick="searchBuilding()"><img src="./images/search.svg"></div>
            </div>

            <div class="building-more-detail">

            </div>
        </div> -->

        <%-- <%@ include file="/WEB-INF/inc/footer.jsp"%>  --%>
    </div>

    
    <script>
        // 지도 생성
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.3595704, 127.105399),
            zoom: 4
        }); 

        // 데이터 가져오기
        fetch('http://localhost:8085/jtgzproject/getLeeTestData') // 이 경로가 컨트롤러에 정의된 경로와 일치하는지 확인
        .then(response => response.json())
        .then(data => {
            console.log(data);
        })
        .catch(error => console.error('Error:', error));


    </script>

</body>
</html>