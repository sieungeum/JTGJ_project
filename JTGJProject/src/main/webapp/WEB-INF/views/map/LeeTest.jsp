
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>네이버지도 구현</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sj7g9t2k7p&submodules=geocoder"></script>
    <script src="./data/MarkerClustering.js"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
        }
    </style>
</head>
<body>
    <div id="map"></div>

    <script>
        // 지도 생성
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.3595704, 127.105399),
            zoom: 15
        });

        // 마커클러스링을 위해 생성된 마커들을 저장할 배열 markers
        let markers = [];

        let markerCount = 0;

        // ajax 통신
        let v_ajax = new XMLHttpRequest();

        v_ajax.open('GET', './data/cleaned_data.csv');

        // 각 컬럼의 값을 담을 객체 v_jsonData 선언
        let v_jsonData = {
            'purpose': [], 'name': [], 'grade': [],
            '1st_energy': [], 'crtif': [], 'address': [], 
            'jeb': [], 'lat' : [], 'lng' : []
        };

        v_ajax.onload = function () {

            let v_datas = v_ajax.response.replace(/\r/g, '').split('\n');
            for(let i = 1; i < v_datas.length; i++){
                let v_data = v_datas[i].split(',');
                v_jsonData['purpose'].push(v_data[0]);
                v_jsonData['name'].push(v_data[1]);
                v_jsonData['grade'].push(v_data[2]);
                v_jsonData['1st_energy'].push(v_data[3]);
                v_jsonData['crtif'].push(v_data[4]);
                v_jsonData['address'].push(v_data[5]);
                v_jsonData['jeb'].push(v_data[6]);
                v_jsonData['lat'].push(v_data[7]);
                v_jsonData['lng'].push(v_data[8]);
            }
            console.log(v_jsonData);
            
            for(let i = 0; i <= 1000; i++){
                if(i == 1000){
                    createCluster();
                    break;
                }

                if(v_jsonData['lat'][i] == null || v_jsonData['lng'][i] == null){
                    continue;
                }

                marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(v_jsonData['lat'][i], v_jsonData['lng'][i]),
                    title: v_jsonData['name'][i],
                    map: map,
                    icon: {
                        content: [
                            getMarkerIconByGrade(v_jsonData['grade'][i])
                        ].join(''),
                    },
                    draggable: false
                })

                markers.push(marker);

            }

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

            // 마커 클러스터
            // $(document).ready() => html 파일이 모두 로드되고 나면 수행됌
            function createCluster(){

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

                var markerClustering = new MarkerClustering({
                    minClusterSize: 2,
                    maxZoom: 14,
                    map: map,
                    markers: markers,
                    disableClickZoom: false,
                    gridSize: 120,
                    icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
                    indexGenerator: [10, 100, 200, 500, 1000],
                    stylingFunction: function(clusterMarker, count) {
                        $(clusterMarker.getElement()).find('div:first-child').text(count);
                    }
                });

                console.log(markerClustering);
            }
        }

        v_ajax.send()
    </script>
  
</body>
</html>