<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>

<%@ include file="/WEB-INF/inc/head.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<style type="text/css">
	* {
	  font-family: "Noto Sans KR", serif !important;
	  font-weight: 600 !important;
	  font-style: normal !important;
	}
	.landing{
		background-color: white;
	}
	
	.map-container {
		display: flex;
		
		width: 100%;
	}
	
	p {
		/* 	    margin: 0 0 2em 0;
		    margin-top: 0px;
		    margin-right: 0px;
		    margin-bottom: 2em;
		    margin-left: 0px; */
		margin: 3px 0 10px 20px;
	}
	
	.detail-btn{
		padding-top: 2px;
		padding-bottom: 2px;
		padding-left: 4px;
		padding-right: 4px;
	
		background-color: rgba(0, 255, 0, 0.7);
		
		border: 1px solid rgba(0, 255, 0, 0.7);
		border-radius: 7px;
		
		color: white;
	}
	
	.detail-btn:hover{
		background-color: white;
		
		border-radius: 7px;
		
		color: rgba(0, 255, 0, 0.7);
		
		transition-duration: 0.5s;
	}
	
	.dashboard-style{
		text-align: center;
		
		padding-top: 6px;
		padding-bottom: 6px;
		
		background-color: yellowgreen;
		opacity : 0.7;
		color: green;
		font-size: 25px;
	}
	
	/* 원그래프 */
	.canvas-box-circle{
		display: flex;
		flex-direction: column;
	    
	    width: 100%;
	}
	.chart-circle-top{
		width: 100%;
		
		color: black;
	}
	
	
	/* 선, 막대 그래프 */
	.canvas-box {
	    width: 100%;
	    
	    padding-top: 15px;
		
		border: 1px solid green;
	}
	.ai-graph-box{
	
	    width: 100%;
		
		border: 1px solid green;
	}
	
	/* 숫자 수치 */
	.cnt-info{
		display: flex;
		flex-direction: column;
		justify-content: center;
		
		width: 100%;
		height: calc(100% / 3);
	
		color: black;
		
		border: 1px solid green;
		border-bottom: none;
	}
	
	
	.screen-left{
		display: flex;
		align-items: center;
	
		width: 25%;
		
		background-color: yellowgreen;
		
	}
	
	.screen-right{
		display: flex;
		flex-direction: column;
	
		
		width: 75%;
	}
	
	.screen-r{
		display: flex;
		
		width: 100%;
	}
	
	.screen-r-left{
		display: flex;
		flex-direction: column;
		
		width: 35%;
	}
	
	.screen-r-rignt{
		width: 65%;
	}
	
	.screen-r-bottom{
		width: 100%;
	}
	
</style>
</head>
<body class="landing is-preload" style="min-width: 1300px;">

	<!-- nav -->
	<%@ include file="/WEB-INF/inc/nav.jsp"%>
	<div id="page-wrapper">
		<div style="margin-top: 100px;"></div>
		<section>
			<div class="dashboard-style noto-sans-kr" >DASH BOARD</div>
			<div class="map-container">
				<!-- 오른쪽 원그래프 -->
				<div class="screen-left" >
					<div class="canvas-box-circle" >
						<!-- 주거용 -->
						<div class="">
							<div class="canvas-box-circle">
								<div class="chart-circle-top">
									<canvas id="chartTwo" height="300"></canvas>
								</div>
							</div>
						</div>
						
						<div class="">
							<div class="canvas-box-circle">
								<div class="chart-circle-top">
									<canvas id="chartOne" height="300"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 오른쪽 원그래프 -->
				
				
				<!-- 왼쪽 그래프 -->
				<div class="screen-right">
					<div class="screen-r">
						<div class="screen-r-left">
							<div class="cnt-info">
								<p style="font-weight: bolder" >회원 수 <a href="${pageContext.request.contextPath}/adminMemView" 
								class="detail-btn">detail</a></p>
								
								<hr color="black" width="80%"  size="5px" style="margin: 3px 0 10px 17px;" >
								<p>${infoCnt[0]} 명</p>
							</div>
							<div class="cnt-info">
								<p style="font-weight: bolder" >전체 건물 수 <a href="${pageContext.request.contextPath}/buildingView" 
								class="detail-btn">detail</a></p>
								<hr color="black" width="80%"  size="5px" style="margin: 3px 0 10px 17px;" >
								<p>${infoCnt[1]} 채</p>
							</div>
							<div class="cnt-info">
								<p style="font-weight: bolder" >ZEB 건물 수</p>
								<hr color="black" width="80%"  size="5px" style="margin: 3px 0 10px 17px;" >
								<p>${infoCnt[2]} 채</p>
							</div>
							
						</div>
						<div class="screen-r-right">
							<!-- flask로 가져온 인공지능 모델 예측 그래프 -->
							<div class="ai-graph-box" >
								<img src="http://localhost:5000/pltimg" width="100%" height="100%" >
							</div>
						</div>
						
					</div>
					<div class="screen-r-bottom">
						<div class="canvas-box" >
							<!-- 그래프(chart)의 크기 조정 -->
							<!-- canvas에 width, height은 별 의미 없음 -->
							<canvas id="myChart" width="100%" height="200" ></canvas>
						</div>
					</div>
				</div><!-- 왼쪽 그래프 -->
			</div>
		</section>

	</div>

	<!-- Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.scrollex.min.js"></script>
	<script src="js/jquery.scrolly.min.js"></script>
	<script src="js/browser.min.js"></script>
	<script src="js/breakpoints.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script>


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
				f_draw_circle(v_solarDict); // 현재 zeb 선정 현황
				f_draw_rank(v_solarDict); // 에너지 효율 등급 현황
				//f_draw_special_rank(v_solarDict, i); // zeb 가능 건물 현황
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
			
			// 단색 연두색을 모든 데이터셋에 적용
			v_datasets.forEach(dataset => {
			    dataset.backgroundColor = 'rgba(0, 255, 0, 0.2)';  // 연두색
			    dataset.borderColor = 'rgba(0, 200, 0, 1)';         // 외곽선 색상
			    dataset.borderWidth = 1;                            // 외곽선 두께
			});
			
			new Chart(ctx, {
				type: 'bar',
				data: {
					labels: v_solarDict['region'],
					datasets: v_datasets
				},
				options: {
			        responsive: true,
			        maintainAspectRatio: false, // canvas의 aspect ratio 유지 비활성화
					scales: {
						y: {
							beginAtZero: true,                
							min: 3.0,             // Y축 최소값
			                max: 4.4,            // Y축 최대값
			                ticks: {
			                    stepSize: 0.7     // Y축 눈금 간격
			                }
						}
					},
			        plugins: {
			            title: {
			                display: true,  // 제목을 표시할지 여부
			                text: '지역별 태양광 발전량 평균',  // 그래프명
			                color: 'black',  // 제목 폰트 색상 설정
			                font: {
			                    size: 18  // 제목 글꼴 크기
			                },
			                padding: {
			                }
			            }
			        }
					
				}
			})
		}
		
		// 현재 zeb 선정 유무
		function f_draw_circle(v_solarDict, purp) {
			let v_id = "chartOne";
			let v_purpose = "주거용";
			let v_purposeElse = "주거용 이외";
			
			let ctx = document.getElementById(v_id);
			
			// datasets에 들어갈 배열을 완성시켜서 넣기
			let v_datasets = [];
			
			let v_yes = 0;
			let v_no = 0;
			for (let i = 0; i < v_solarDict['zeb'].length; i++){
				if (v_solarDict['purposeKindName'][i] == v_purpose || v_solarDict['purposeKindName'][i] == v_purposeElse){
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
				},
			    options: {
			        responsive: true,
			        maintainAspectRatio: false, // canvas의 aspect ratio 유지 비활성화
			        plugins: {
			            title: {
			                display: true,  // 제목을 표시할지 여부
			                text: 'ZEB 건물 현황',  // 그래프명
			                color: 'black',  // 제목 폰트 색상 설정
			                font: {
			                    size: 18  // 제목 글꼴 크기
			                },
			                padding: {
			                	top: 30,
			                    bottom: 20 // 제목과 그래프 사이의 간격 설정
			                }
			            },
			            legend: {
			                position: 'right',  // 레이블을 오른쪽으로 옮김
			            }
			        }
			    }
			});
		}
		
		// 모든 에너지 효율 등급 갯수
		function f_draw_rank(v_solarDict) {
			let v_id = "chartTwo";
			let v_purpose = "주거용";
			let v_purposeElse = "주거용 이외";
			
			let ctx = document.getElementById(v_id);
			
			// datasets에 들어갈 배열을 완성시켜서 넣기
			let v_datasets = [];
			
			// 등급 당 건물 갯수 구하기
			let v_rankCnt = {};
			for (let i = 0; i < v_solarDict['grdName'].length; i++){
				if (v_solarDict["purposeKindName"][i] == v_purpose || v_solarDict["purposeKindName"][i] == v_purposeElse){
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
				},
			    options: {
			        responsive: true,
			        maintainAspectRatio: false, // canvas의 aspect ratio 유지 비활성화
			        plugins: {
			            title: {
			                display: true,  // 제목을 표시할지 여부
			                text: '에너지 효율 등급 현황',  // 그래프명
			                color: 'black',  // 제목 폰트 색상 설정
			                font: {
			                    size: 18  // 제목 글꼴 크기
			                },
			                padding: {
			                	top: 30,
			                    bottom: 20 // 제목과 그래프 사이의 간격 설정
			                }
			            },
			            legend: {
			                position: 'right',  // 레이블을 오른쪽으로 옮김
			            }
			        }
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
				},
			    options: {
			        plugins: {
			            legend: {
			                position: 'right',  // 레이블을 오른쪽으로 옮김
			            }
			        }
			    }
			});
		}
		
	</script>
</body>
</html>