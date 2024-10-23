<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<%@ include file="/WEB-INF/inc/head.jsp"%>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<style type="text/css">
	.map-container {
		position: relative;
		
		width: 1200px;
		
		margin: auto;
	}
	
	p {
		/* 	    margin: 0 0 2em 0;
		    margin-top: 0px;
		    margin-right: 0px;
		    margin-bottom: 2em;
		    margin-left: 0px; */
		margin: 3px 0 10px 8px;
	}
	
	.purpose-text{
		width: 100%;
	
		margin: auto;
	
		text-align: center;
		font-weight: bold;
		font-size: 30px;
		color: black;
	}
	
	.w-100{
		width: 100%;
	}
	
	.canvas-box {
		display: flex;
		justify-content: center;
		flex-direction: column;
	
	    width: 1000px;
	    
	    margin: auto;
	}
	.canvas-box-circle{
	    display: flex;
	    justify-content: center;
	    
	    width: 100%;
	    
	}
	.chart-circle-top{
		width: calc(100% / 2);
		
		margin: auto;
		
		text-align: center;
		color: black;
	}
	.chart-circle-under{
		width: calc(100% / 3);
		
		text-align: center;
		color: black;
	}
</style>
</head>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>
		<img src="images/저탄고집v6.png" width="200px">
		<p>건의사항</p>
		<table id="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${notice}" var="notice">
					<tr>
						<td scope="row">공지</td>
						<td><a href="${pageContext.request.contextPath}/noticeDetailView?notiNo=${notice.notiNo}">${notice.notiTitle}</a></td>
						<td>${notice.memName}</td>
						<td>${notice.notiDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<c:if test='${sessionScope.login.memAdminYn == "Y" or 
		sessionScope.login.memAdminYn == "K"}'>
			<div class="btn">
				<a href="${pageContext.request.contextPath}/noticeWriteView">공지사항 작성</a>
			</div>
		</c:if>

		<!-- Banner -->
		<div class="map-container bg-white mt-5">
		
			<div class="canvas-box">
				<div class="purpose-text mt-4 mb-2" >지역별 태양광 발전량 평균</div>
				<!-- 그래프(chart)의 크기 조정 -->
				<!-- canvas에 width, height은 별 의미 없음 -->
				<canvas id="myChart" ></canvas>
			</div>
			
			<div class="canvas-box-circle" >
				<!-- 주거용 -->
				<div class="w-100">
					<div class="purpose-text mt-3 mb-2" >주거용</div>
					
					<div class="canvas-box-circle">
						<div class="chart-circle-top">
							<canvas id="chartTwo" ></canvas>
							<p>에너지 효율 등급 현황</p>
						</div>
					</div>
					
					<div class="canvas-box-circle" >
						<div class="chart-circle-under">
							<canvas id="chartOne" ></canvas>
							<p>현 ZEB 선정 건물 현황</p>
						</div>
						<div class="chart-circle-under">
							<canvas id="chartThree" ></canvas>
							<p>ZEB 선정 기준 적합 현황</p>
						</div>
					</div>
				</div>
				
				<div class="w-100">
					<!-- 주거용 이외 -->
					<div class="purpose-text mt-4 mb-2" >주거용 이외</div>
					
					<div class="canvas-box-circle">
						<div class="chart-circle-top">
							<canvas id="chartTwoElse" ></canvas>
							<p>에너지 효율 등급 현황</p>
						</div>
					</div>
					
					<div class="canvas-box-circle" >
						<div class="chart-circle-under">
							<canvas id="chartOneElse" ></canvas>
							<p>현 ZEB 선정 건물 현황</p>
						</div>
						<div class="chart-circle-under">
							<canvas id="chartThreeElse" ></canvas>
							<p>ZEB 선정 기준 적합 현황</p>
						</div>
					</div>
				</div>
			</div>
			
			<!-- flask로 가져온 인공지능 모델 예측 그래프 -->
			<div class="canvas-box" >
				<img src="http://localhost:5000/pltimg" width="100%" >
			</div>
		</div>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>

	</div>

	<!-- chart.js 불러오기 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
		
		let v_ajax = new XMLHttpRequest(); // 태양열데이터 ajax 통신으로 불러오기
		let v_ajaxZeb = new XMLHttpRequest(); // zeb 데이터 ajax 통신으로 불러오기
		
		v_ajax.open('POST', "${pageContext.request.contextPath}/chartSolarData");
		v_ajaxZeb.open('POST', "${pageContext.request.contextPath}/chartZebData");
		
		// 요청 헤더 설정
		v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		v_ajaxZeb.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		
		// 태양열 데이터 onload
		v_ajax.onload = function(){
			// 통신 성공 시 실행
			if(v_ajax.status == 200){
				console.log(v_ajax.response);
				v_str = v_ajax.response;
				
				// 문자열로 받아 오기 때문에 이러한 과정을 거쳐야함
				v_str = v_str.replaceAll("\[", "");
				v_str = v_str.replaceAll("\]", "");
				
				let v_data = v_str.split("},");
				
				console.log(v_data)
				
				let v_solarDict = {};
				v_solarDict['region'] = [];
				v_solarDict['mean'] = [];
				
				for (d of v_data){
					d = d.replaceAll("\{", "");
					d = d.replaceAll("\}", "");
					d = d.replaceAll("\"", "");
					d = d.split(",");
					
					v_solarDict['region'].push(d[0].split(":")[1]);
					v_solarDict['mean'].push(d[1].split(":")[1]);
				}
				
				// 막대 그래프 생성
				f_draw(v_solarDict);
				
			}
			
			
		}
		
		// 태양열 데이터 ajax send
		v_ajax.send();
		
		// zeb 데이터 onload
		v_ajaxZeb.onload = function(){
			// 통신 성공 시 실행
			if (v_ajaxZeb.status == 200){
				/* [{"purposeKindName":"주거용","bldNm":null,"grdName":"2등급","wOneEnergyRequire":181.0,"crtifIsuDd":null,
				"locAddr":null,"zeb":"N","delYn":null,"mmThousP":0.0,"mmTenThousP":0.0,"mmFiftyThousP":0.0}, */
				v_str = v_ajaxZeb.response;
				
				// 문자열로 받아 오기 때문에 이러한 과정을 거쳐야함
				v_str = v_str.replaceAll("\[", "");
				v_str = v_str.replaceAll("\]", "");
				
				let v_data = v_str.split("},");
				
				let v_solarDict = {};
				v_solarDict['purposeKindName'] = [];
				v_solarDict['grdName'] = [];
				v_solarDict['wOneEnergyRequire'] = [];
				v_solarDict['zeb'] = [];
				
				for (d of v_data){
					d = d.replaceAll("\{", "");
					d = d.replaceAll("\}", "");
					d = d.replaceAll("\"", "");
					d = d.split(",");
					
					v_solarDict['purposeKindName'].push(d[0].split(":")[1]);
					v_solarDict['grdName'].push(d[2].split(":")[1]);
					v_solarDict['wOneEnergyRequire'].push(d[3].split(":")[1]);
					v_solarDict['zeb'].push(d[6].split(":")[1]);
				}

				// 원그래프 생성
				for (let i = 0; i < 2; i++){
					f_draw_circle(v_solarDict, i); // 현재 zeb 선정 현황
					f_draw_rank(v_solarDict, i); // 에너지 효율 등급 현황
					f_draw_special_rank(v_solarDict, i); // zeb 가능 건물 현황
				}
			}
		}
		
		// zeb 데이터 send
		v_ajaxZeb.send();
		
		// 지역별 태양열 발전량 평균 그래프 그리기
		function f_draw(v_solarDict){
			let ctx = document.getElementById("myChart");
			
			// datasets에 들어갈 배열을 완성시켜서 넣기
			let v_datasets = [];
			
			// v_solarDict의 모든 키값을 배열로 꺼내기
			let v_keys = Object.keys(v_solarDict);
			
			// 키값 배열에서 label 로 쓸 데이터 삭제
			v_keys.splice(v_keys.indexOf('region'), 1);
			console.log(v_keys);
			
			for (let key of v_keys){
				let v_temp = {};
				v_temp['label'] = key;
				v_temp['data'] = v_solarDict[key];
				v_temp['borderWidth'] = 2;
				
				v_datasets.push(v_temp);
			}
			
			new Chart(ctx, {
				type: 'bar',
				data: {
					labels: v_solarDict['region'],
					datasets: v_datasets
				},
				options: {
					scales: {
						y: {
							beginAtZero: true,
							min:3
						}
					}
				}
			})
		}
		
		// 현재 zeb 선정 유무
		function f_draw_circle(v_solarDict, purp) {
			let v_id = "chartOne";
			let v_purpose = "주거용";
			
			// 건물 용도가 주거용 이외 일 경우
			if (purp == 1){
				v_id += "Else";
				v_purpose += " 이외";
			}
			let ctx = document.getElementById(v_id);
			
			// datasets에 들어갈 배열을 완성시켜서 넣기
			let v_datasets = [];
			
			let v_yes = 0;
			let v_no = 0;
			for (let i = 0; i < v_solarDict['zeb'].length; i++){
				if (v_solarDict['purposeKindName'][i] == v_purpose){
					console.log(v_solarDict['purposeKindName'][i]);
					if (v_solarDict['zeb'][i] == "Y"){
						v_yes++;
					} else if(v_solarDict['zeb'][i] == "N") {
						v_no++;
					}
				}
			}
			
			new Chart(ctx, {
				type: 'pie',
				data: {
					labels: ["선정", "미선정"],
					datasets: [{
						data: [v_yes, v_no]
					}]
				}
			});
		}
		
		// 모든 에너지 효율 등급 갯수
		function f_draw_rank(v_solarDict, purp) {
			let v_id = "chartTwo";
			let v_purpose = "주거용";
			
			// 건물 용도가 주거용 이외 일 경우
			if (purp == 1){
				v_id += "Else";
				v_purpose += " 이외";
			}
			let ctx = document.getElementById(v_id);
			
			// datasets에 들어갈 배열을 완성시켜서 넣기
			let v_datasets = [];
			
			// 등급 당 건물 갯수 구하기
			let v_rankCnt = {};
			for (let i = 0; i < v_solarDict['grdName'].length; i++){
				if (v_solarDict["purposeKindName"][i] == v_purpose){
					if (v_rankCnt[v_solarDict['grdName'][i]] != null){
						v_rankCnt[v_solarDict['grdName'][i]]++;
					} else {
						v_rankCnt[v_solarDict['grdName'][i]] = 0;
					}
				}
			}
			
			let v_label = Object.keys(v_rankCnt);
			
			let v_data = [];
			for (d of v_label){
				console.log(v_rankCnt[d]);
				v_data.push(v_rankCnt[d]);
			}
			
			new Chart(ctx, {
				type: 'pie',
				data: {
					labels: v_label,
					datasets: [{
						data: v_data
					}]
				}
			});
		}
		
		// 1++ 등급만 표시
		function f_draw_special_rank(v_solarDict, purp) {
			let v_id = "chartThree";
			let v_purpose = "주거용";
			
			// 건물 용도가 주거용 이외 일 경우
			if (purp == 1){
				v_id += "Else";
				v_purpose += " 이외";
			}
			let ctx = document.getElementById(v_id);
			
			// datasets에 들어갈 배열을 완성시켜서 넣기
			let v_datasets = [];

			let v_rankCnt = {};
			for (let i = 0; i < v_solarDict['grdName'].length; i++){
				if (v_solarDict["purposeKindName"][i] == v_purpose){
					if (v_rankCnt[v_solarDict['grdName'][i]] != null){
						v_rankCnt[v_solarDict['grdName'][i]]++;
					} else {
						v_rankCnt[v_solarDict['grdName'][i]] = 0;
					}
				}
			}
			
			// 1++등급 이상
			let v_specialRank = ["1++등급", "1+++등급", "1++++등급"]
			
			let v_label = ["충족", "불충족"];
			let v_data = [0, 0];
			for (d of Object.keys(v_rankCnt)){
				console.log(d);
				console.log(v_specialRank.includes(d));
				if (v_specialRank.includes(d)){
					v_data[0] += v_rankCnt[d];
				} else {
					v_data[1] += v_rankCnt[d];
				}
			}
			
			new Chart(ctx, {
				type: 'pie',
				data: {
					labels: v_label,
					datasets: [{
						data: v_data
					}]
				}
			});
		}
		
	</script>
</body>
</html>