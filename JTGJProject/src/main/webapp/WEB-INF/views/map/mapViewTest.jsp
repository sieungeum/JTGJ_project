<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<style type="text/css">

	.map-container{
		position: relative;
		
		width: 100%;
		height: 1000px;
	}
	
	.map-detail{
		display: none;
		
		align-text: middle;
	
		position: absolute;
		width: 32%;
		height:500px;
		bottom: 50px;
		left: 30px;
		
	}
	
	p{
/* 	    margin: 0 0 2em 0;
	    margin-top: 0px;
	    margin-right: 0px;
	    margin-bottom: 2em;
	    margin-left: 0px; */
	    
	    margin: 3px 0 10px 8px;
	}
</style>
</head>
<body class="landing is-preload">
	<!-- header -->
	<%@ include file="/WEB-INF/inc/nav.jsp"%>
	
	<!-- Banner -->
	<div class="map-container bg-primary mt-5">
		<form action="${pageContext.request.contextPath}/mapViewTestDo" method="POST">
			<div class="btn btn-primary">
				지도 상세 보기
				<input class="hidden-v" type="hidden" value=1 >
			</div>
			<div class="btn btn-primary">
				지도 상세 보기2
				<input class="hidden-v" type="hidden" value=2 >
			</div>
			<div class="btn btn-primary">
				지도 상세 보기3
				<input class="hidden-v" type="hidden" value=3 >
			</div>
			<div class="btn btn-primary">
				지도 상세 보기4
				<input class="hidden-v" type="hidden" value=4 >
			</div>
			<div class="btn-primary">
				<a href="${pageContext.request.contextPath}/chartView" >
					차트보기
				</a>
			</div>
			
			<div class="map-detail bg-success" >
			</div>
		</form>
	</div>
	
	
	
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	
	<script type="text/javascript">
		let v_btn = document.querySelectorAll(".btn");
		let v_mapDetail = document.querySelector(".map-detail");
		
		let v_datas = ["purposeKindName=주거용&locAddr=서울 용산구 원효로3가 277-8",
			"purposeKindName=주거용 이외&locAddr=제주특별자치도 제주시 구좌읍 동복리 1691-1",
			"purposeKindName=주거용 이외&locAddr=제주특별자치도 서귀포시 강정동 3703-3 ",
			"purposeKindName=주거용&locAddr=부산 광역시 강서구 강동동 일원 (에코델타시티18BL)"]
		
		idx = 0;
		console.log(v_btn.length);
		for (let i = 0; i < v_btn.length; i++){
			v_btn[i].addEventListener("click", (e) => {
				e.preventDefault(); // 기본 이벤트 제거
				// XMLHttpRequest 객체 생성
 				const v_ajax = new XMLHttpRequest();
				
				// HTTP 요청 준비
				v_ajax.open('POST', '${pageContext.request.contextPath}/mapViewTestDo');
				
				// 요청 헤더 설정
				v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				
				// 전송할 데이터 설정
				const v_data = v_datas[i];
				
				// 응답 처리
				v_ajax.onload = () => {
					if(v_ajax.status == 200){
						v_mapDetail.style.display = "inline-block";
						
						// MapTestDTO 타입을 String으로 가져와 버림
						let mapInfo = v_ajax.response;

						// 사용할 데이터로 전환
						mapInfo = mapInfo.replaceAll("\{", "");
						mapInfo = mapInfo.replaceAll("\}", "");
						mapInfo = mapInfo.replaceAll("\"", "");
						mapInfo = mapInfo.replaceAll(" ", "");
						
						mapInfo = mapInfo.split(","); // 배열로 purposeKindName:주거용 이런식으로 저장 되 있음
						
						v_dict = {}
						for (let v_info of mapInfo){
							console.log(v_info.split(":")[0]);
							v_dict[v_info.split(":")[0]] = v_info.split(":")[1];
						}
						
						console.log(v_dict);
						
 						v_innerData = ""
 						v_innerData += '<p>건물용도 : ' + v_dict['purposeKindName'] + '</p>'
 						v_innerData += '<p>건물명 : ' + v_dict['bldNm'] + '</p>'
 						v_innerData += '<p>에너지 효율 등급 : ' + v_dict['grdName'] + '</p>'
 						v_innerData += '<p>1차 에너지 소요량 : ' + v_dict['wOneEnergyRequire'] + '</p>'
 						v_innerData += '<p>인증발급일자 : ' + v_dict['crtifIsuDd'] + '</p>'
 						v_innerData += '<p>건물 주소 : ' + v_dict['locAddr'] + '</p>'
 						v_innerData += '<p>ZEB 인증 유무 : ' + v_dict['zeb'] + '</p>'
 						
 						if (v_dict['zeb'] == 'N' && v_dict['grdName'].length > 4){
 	 						v_innerData += '<span>1000m^2 : ' + v_dict['mmThousP'] + '</span>'
 	 						v_innerData += '<span>10000m^2 : ' + v_dict['mmTenThousP'] + '</span>'
 	 						v_innerData += '<span>50000m^2 : ' + v_dict['mmFiftyThousP'] + '</span>'
 						}
						
						v_mapDetail.innerHTML = v_innerData;
						
					}
				};
				
				// 요청 전송
				v_ajax.send(v_data);
			});
		}
	</script>
</body>
</html>