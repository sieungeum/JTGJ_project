<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home-animation.css" />
<%@ include file="/WEB-INF/inc/head.jsp"%>
<style>
	.landing{
		background-image: url("images/first_screen_image.jpg");
		background-size: 100%;
	}
	
	.introduce-btn{
		font-weight: bold;
		color: black;
		margin-top: 100px;
		background-color: rgba(212, 212, 212, 0.5);
		border-radius: 20px;
		padding:10px;
		width: 20%;
		cursor: pointer;
	}
	
	.introduce-btn:hover{
		background-color: rgba(190, 190, 190, 0.5);
	}
	@media screen and (max-width: 1530px) {
	
		body{
			width: 1530px;
		}
		
		.landing{
			background-image: url("images/first_screen_image.jpg");
			background-size: 1530px;
		}
	}
	
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
	
	.canvas-box-circle{
	    display: flex;
	    justify-content: center;
	    
	    width: 100%;
	    height: 100%;
	}
	
	.chart-circle-box{
	    display: flex;
	    justify-content: center;
	    
	    width: 100%;
	    height: 50%;
	}
	.chart-circle-top{
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    
		width: 70%;
		
		margin-left: auto;
		margin-right: auto;
		
		text-align: center;
		color: black;
	}
	.chart-circle-under{
		width: calc(100% / 3);
		
		margin-left: auto;
		margin-right: auto;
		
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

		<!-- Banner -->
		<section id="banner">
			<div class="inner" style="display:flex; flex-direction:column; align-items:center;">
				<img src="images/저탄고집v6.png" width="300px">
				<ul class="actions special">
					<c:if test="${sessionScope.login == null}" >
						<li><a href="${pageContext.request.contextPath }/loginView" class="button primary">로그인하기</a></li>
					</c:if>
					<c:if test="${sessionScope.login != null}" >
					</c:if>
				</ul>
				<div class="introduce-btn" id="intBtn">
					<a href="#one">탄소중립 2050을 위한 방법<br /> 함께 알아볼까요?</a>
				</div>
					
			</div>
		</section>
		
		<!-- explain -->
		<section class="wrapper alt style2 section-box">
			<section id="one" class="explain-box">
				<div class="explain-img">
					<img id="changeImage" src="${pageContext.request.contextPath}/images/pic01.jpg" width="100%">
					<div id="chartBox" class="canvas-box-circle" style="display: none;">

						<div class="chart-circle-box">
							<div class="chart-circle-top">
								<canvas id="chartTwo"></canvas>
								<p>에너지 효율 등급 현황</p>
							</div>
						</div>
						
						<div class="chart-circle-box" >
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
				</div>
				<div class="explain-text">
					&nbsp;"지구가 뜨거워지고 있습니다."
					<br>
					<br>
					&nbsp;산업화 이전 대비 지구의 평균 온도는 이미 1.1도가 상승했습니다.
					&nbsp;2010년 ~ 2019년 연평균 CO2 배출량은 약 403억 톤이었으며, 2020년까지 전 지구 표면기온은 1.26도 상승했습니다.
					&nbsp;즉, 0.24도 더 상승하면 산업화 이전보다 1.5도 더 뜨거워지고, 이러한 흐름이 지속될 경우 IPCC 제1실무그룹은 2027년에 1.5도를 돌파할 것이라는 비관적인 전망을 하였습니다.
					<br>
					<br>
					&nbsp;지구 평균 기온이 산업화 전보다 1.5도 이상 높아지면 어떠한 인류의 노력에도 기후변화를 막을 수 없게 됩니다.
					<br>
					<br>
					&nbsp;지금부터라도 적극적인 탄소중립 실천이 필요한 시점입니다.
					
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					
					&nbsp;"건물은 에너지 관련 이산화탄소 배출량 전체의 38%를 차지합니다"
					<br>
					<br>
					&nbsp;건설산업에서 발생하는 온실가스는 전 세계 온실가스 배출량의 약 25%에 이르며, 이 중 탄소중립의 핵심 대상인 이산화탄소만 놓고 보아도 약 37%를 차지합니다.
					건물과 인프라를 구분해 전 생애주기 동안의 온실가스 배출을 비교해 보면, 건물의 온실가스 배출량이 인프라보다 약 9배 더 많습니다. 
					<br>
					<br>
					&nbsp;이는 건설산업에서 탄소중립을 달성하는 데 있어 건물 부문이 가장 중요한 이유입니다.
					<br>
					<br>
					&nbsp;특히, 건물은 준공 후 운영 단계에서 막대한 온실가스를 배출하여, 인프라에 비해 더 큰 환경적 부담을 주고 있습니다.
					
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					
					&nbsp;"제로에너지 건축물과 그린 리모델링: 건물 부문 탄소중립의 핵심"
					<br>
					<br>
					&nbsp;정부의 2050 탄소중립 시나리오에 따르면, 신축 건축물의 제로에너지 건축물 1등급 100% 달성, 그리고 기존 건축물의 그린 리모델링 100% 완수가 필요합니다. 
					이는 건물의 냉·난방 에너지 손실을 최소화하고, 자체적으로 신재생에너지를 생산해 에너지 효율을 극대화하며, 온실가스 배출을 획기적으로 줄이는 방안입니다.
					<br>
					<br>
					&nbsp;그러나 제로에너지 건축물과 그린 리모델링의 정책적 목표는 아직 충분히 실현되지 못하고 있습니다. 
					기존 건물의 개조 속도는 연간 1%에 불과하며, 정책적 지원과 인프라 부족으로 인해 기술적, 재정적 부담이 크기 때문입니다. 
					<br>
					<br>
					&nbsp;또한, 에너지 효율 등급이나 제로에너지 기준을 일반 건물주나 사용자들이 쉽게 파악할 수 없는 정보의 접근성 문제도 여전히 해결되지 않았습니다
					
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					
					&nbsp;"저탄고집은 다음의 가치를 제공합니다!"
					<br>
					<br>
					&nbsp;우리 홈페이지는 이러한 한계점을 보완하기 위해 누구나 쉽게 건물의 에너지 효율 등급과 제로에너지 건축물 여부를 확인할 수 있는 기능을 제공합니다. 
					이를 통해 정부의 탄소중립 정책 실현 과정을 모니터링하고, 사용자가 자신의 건물 정보를 입력하여 제로에너지 건축물로 전환할 가능성을 직접 계산할 수 있습니다. 
					<br>
					<br>
					&nbsp;또한, 에너지 효율을 높이기 위한 구체적인 계획을 수립하는 데 도움이 될 것입니다.
					<br>
					<br>
					&nbsp;저탄고집은 지속 가능한 미래를 위해 모든 이들이 쉽게 접근할 수 있는 탄소중립 정보를 제공합니다

					
				</div>
				<div style="clear: both;"></div>
			</section>
		</section>

<!-- 		설명 On
		<section class="wrapper alt style2">
			1
			<section id="one" class="spotlight">
				<div class="image">
					<img src="images/pic01.jpg" alt="" />
				</div>
				<div class="content">
					<a href="#two">건물 정보</a>
				</div>
			</section>
			
			2
			<section id="two" class="spotlight">
				<div class="image">
					<img src="images/pic02.jpg" alt="" />
				</div>
				<div class="content">
					<a href="#three">건물 정보</a>
				</div>
			</section>
			
			3
			<section id="three" class="spotlight">
				<div class="image">
					<img src="images/pic03.jpg" alt="" />
				</div>
				<div class="content">
					<a href="#fourth">건물 정보</a>
				</div>
			</section>
			
			4
			<section id="fourth" class="spotlight">
				<div class="image">
					<img src="images/pic02.jpg" alt="" />
				</div>
				<div class="content">
					<a href="#fifth">건물 정보</a>
				</div>
			</section>
			
			5
			<section id="fifth" class="spotlight">
				<div class="image">
					<img src="images/pic03.jpg" alt="" />
				</div>
				<div class="content">
					
				</div>
			</section>
		</section> -->

		<!-- CTA -->
		<section id="cta" class="wrapper style4">
			<div class="inner">
				<header>
					<h2>Arcue ut vel commodo</h2>
					<p>Aliquam ut ex ut augue consectetur interdum endrerit
						imperdiet amet eleifend fringilla.</p>
				</header>
				<ul class="actions stacked">
					<li><a href="#" class="button fit primary">Activate</a></li>
					<li><a href="#" class="button fit">Learn More</a></li>
				</ul>
			</div>
		</section>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>

	</div>

<!-- chart.js 불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
	
	let v_changeImage = document.querySelector("#changeImage");
	
	// 스크롤 길이 당 이미지 변경
	window.addEventListener("scroll", ()=>{
		console.log(window.scrollY);
		
		let v_chartBox = document.querySelector("#chartBox");
		
		let firstChange = 1400;
		
		if (window.scrollY < firstChange){
			v_chartBox.style.display = "none";
			v_changeImage.style.display = "block";
			v_changeImage.src = "${pageContext.request.contextPath}/images/pic01.jpg";
		}
		
		if (window.scrollY > firstChange && window.scrollY < firstChange + 900){

			v_chartBox.style.display = "none";
			v_changeImage.style.display = "block";
			
			v_changeImage.src = "${pageContext.request.contextPath}/images/pic02.jpg";

		} else if (window.scrollY > firstChange + 900 && window.scrollY < firstChange + 1900){

			v_chartBox.style.display = "none";
			v_changeImage.style.display = "block";
			
			v_changeImage.src = "${pageContext.request.contextPath}/images/pic03.jpg";
		} else if (window.scrollY > firstChange + 1900){
			v_chartBox.style.display = "block";
			v_changeImage.style.display = "none";
		}
	})
	
	
	// chart
	let v_ajaxZeb = new XMLHttpRequest(); // zeb 데이터 ajax 통신으로 불러오기
	
	v_ajaxZeb.open('POST', "${pageContext.request.contextPath}/chartZebData");
	
	// 요청 헤더 설정
	v_ajaxZeb.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
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
			for (let i = 0; i < 1; i++){
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