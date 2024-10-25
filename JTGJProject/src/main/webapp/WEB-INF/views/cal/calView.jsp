<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>계산기</title>

<%@ include file="/WEB-INF/inc/head.jsp"%>

<style>
div {
	margin: 0;
	padding: 0;
}

.landing {
	background-image: url("images/photovoltaic-2814504_1920.jpg");
	background-size: 100%;
}

.container {
	background-color: white;
	border-top: solid 10px #03C75A;
	border-bottom: solid 10px #03C75A;
	border-radius: 25px;
	margin-bottom: 50px;
	margin-top: 200px;
}

.bigBox {
	margin: auto;
	width: 90%;
}

.calculator h2, .calculator p, .calculator label {
	color: black; /* 글자 색을 검정색으로 설정 */
	margin: 0;
	padding: 0;
}

.container h2 {
	color: black; /* 글자 색을 검정색으로 설정 */
	margin: 0;
	padding: 0;
}

.col {
	color: black;
}

.title {
	color: #78D451;
	font-size: 80px;
	font-weight: bold;
	margin: auto;
	padding: 50px;
	padding-left: 70%;
}

.calculator {
	display: none; /* 기본적으로 계산기는 숨김 */
	padding-top: 50px;
	padding-bottom: 10%;
}

.box {
	color: black;
	width: 250px;
	height: 15px;
	background-color: white;
	border-color: black;
	border-radius: 25px;
	text-align: center;
}

.box2 {
	color: black;
	width: 300px;
	background-color: white;
	border-color: black;
	border-radius: 25px;
	text-align: center;
}

.coment {
	padding-left: 50%;
	font-size: 12px;
}

.coment2 {
	margin: 0;
	padding-left: 70%;
	font-size: 12px;
}

.main {
	display: flex; /* 수평으로 배치 */
	justify-content: center; /* 중앙 정렬 */
	border: solid 5px #03C75A;
	align-items: center;
	margin: auto;
	border-radius: 30px;
}

.main2 {
	display: flex;
	justify-content: center;
	border: solid 5px #03C75A;
	align-items: center;
	margin: auto;
	border-radius: 30px;
	flex-direction: column;
}

.mini {
	padding: 50px;
}

.miniEl {
	border-right: solid 1px #03C75Aff;
	padding: 50px;
}

.mini2 {
	display: flex; /* 수평으로 배치 */
	justify-content: center; /* 중앙 정렬 */
	align-items: center;
	padding: 20px;
}

.miniBox {
	padding-right: 20%;
}

.total {
	margin: auto;
	font-size: 30px;
	background-color: #03C75A;
	color: white;
	justify-content: center; /* 중앙 정렬 */
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 30px;
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0; /* 기본 여백 제거 */
}

.btn {
	background-color: #00B050;
	color: white;
}

.chobtn {
	background-color: #00B050;
	color: white;
}

.urlbtn {
	margin: 20px;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
}

.urlbtn button {
	background-color: #2E75B6;
}

.calbtn {
	background-color: #78D451;
	color: white;
	border-radius: 10px;
	height: 60px;
}

.calfi {
	font-size: 30px;
	font-weight: bold;
	color: aqua;
}

.btnbox {
	margin: 10px;
	padding-right: 70%;
	padding-bottom: 0;
	margin-bottom: 0;
}

.btn:hover {
	background-color: #BCCF86;
}

input::placeholder {
	color: grey !important;
}
</style>

<script>
function showCalculator(calcNumber) {
    // 모든 계산기 숨기기
    document.querySelectorAll('.calculator').forEach(calc => calc.style.display = 'none'); 
    // 선택한 계산기만 보이기
    document.getElementById('calculator' + calcNumber).style.display = 'block'; 
    
    // 모든 버튼 초기화
    document.querySelectorAll('button').forEach(button => {
        button.style.backgroundColor = ''; // 기본 배경색으로 되돌리기
        button.style.transform = ''; // 기본 크기로 되돌리기
    });

    // 선택된 버튼 스타일 변경
    const selectedButton = document.querySelector('button[onclick="showCalculator(' + calcNumber + ')"]');
    if (selectedButton) {
        selectedButton.style.backgroundColor = '#DBF19C'; // 선택된 버튼 강조
        selectedButton.style.transform = 'scale(0.95)'; // 클릭 효과
    }

    // 3번 계산기 선택 시 주거용 버튼 강조
    if (calcNumber === 3) {
        selectBuildingType('residential'); // 주거용 버튼 강조
    }
    
}

        // 1번 계산기: 탄소배출량 계산기
        
        let electricityResult = 0;
		let gasResult = 0;
		
		function calculateElectricity() {
		    const inputValue = parseFloat(document.getElementById('inputValue').value);
		    
		    electricityResult = (inputValue || 0) * 0.4781;
		    document.getElementById('result').innerHTML = '전기 탄소배출량: <span style="font-size: 50px; color: skyblue;"><br>' + electricityResult.toFixed(2) + '</span> kg/월';
		    calculateTotal();
		}
		
		function calculateGas() {
		    const inputValue2 = parseFloat(document.getElementById('inputValue2').value);
		    
		    gasResult = (inputValue2 || 0) * 2.176;
		    document.getElementById('result2').innerHTML = '가스 탄소배출량: <span style="font-size: 50px; color: skyblue;"><br>' + gasResult.toFixed(2) + "</span> kg/월";
		    calculateTotal();
		}
		
		function calculateTotal() {
		    const total = electricityResult + gasResult;
		    document.getElementById('result3').innerHTML = '<span style="color: white; font-size: 40px;">총 탄소배출량: <span style="color: #123FBA; font-size: 60px;">' + total.toFixed(2) + "</span> kg/월</span>";
		}

        // 2번 계산기: 간단한 계산기
         function calculateSelfSufficiency() {
            const production = parseFloat(document.getElementById('production').value);
            const consumption = parseFloat(document.getElementById('consumption').value);
            
            

            const selfSufficiencyRate = (production / consumption) * 100;
            
            let rating = '';

            if (selfSufficiencyRate >= 100) {
                rating = '1등급';
            } else if (selfSufficiencyRate >= 80) {
                rating = '2등급';
            } else if (selfSufficiencyRate >= 60) {
                rating = '3등급';
            } else if (selfSufficiencyRate >= 40) {
                rating = '4등급';
            } else if (selfSufficiencyRate >= 20) {
                rating = '5등급';
            }else {
                rating = '부적합';
            }
            document.getElementById('result4').innerHTML = '<span style="color: white; font-size: 25px;">에너지 자립률(ZEB): <span style="font-size: 60px; color: #454BFF;">' + rating + '</span></span>';
        }
        
        <!-- 3번 계산기-->
        let selectedBuildingType = 'residential'; // 기본값

        function selectBuildingType(type) {
            selectedBuildingType = type;
            
            // 버튼 스타일 변경 (선택된 버튼 강조)
            document.getElementById('residentialBtn').style.backgroundColor = type === 'residential' ? '#03C75A' : '#B0B0B0'; // 회색
            document.getElementById('commercialBtn').style.backgroundColor = type === 'commercial' ? '#03C75A' : '#B0B0B0'; // 회색
        }

        window.onload = function() {
            selectBuildingType('residential'); // 페이지 로드 시 주거용 버튼 강조
        };
        
        function basicCalculator() {
            const num1 = parseFloat(document.getElementById('num1').value); // 난방
            const num11 = parseFloat(document.getElementById('num11').value); // 난방면적
            const num2 = parseFloat(document.getElementById('num2').value); // 냉방
            const num22 = parseFloat(document.getElementById('num22').value); // 냉방 면적
            const num3 = parseFloat(document.getElementById('num3').value); // 급탕
            const num33 = parseFloat(document.getElementById('num33').value); // 급탕 면적
            const num4 = parseFloat(document.getElementById('num4').value); //조명
            const num44 = parseFloat(document.getElementById('num44').value); // 조명 면적
            const num5 = parseFloat(document.getElementById('num5').value); // 환기
            const num55 = parseFloat(document.getElementById('num55').value); // 환기 면적

            
            let total = 0; // 총합 초기화
            let count = 0; // 입력된 값의 수

            // 계산을 위한 총합
            if (!isNaN(num1) && !isNaN(num11) && num11 > 0) {
                total += num1 / num11;
                count++;
            }
            if (!isNaN(num2) && !isNaN(num22) && num22 > 0) {
                total += num2 / num22;
                count++;
            }
            if (!isNaN(num3) && !isNaN(num33) && num33 > 0) {
                total += num3 / num33;
                count++;
            }
            if (!isNaN(num4) && !isNaN(num44) && num44 > 0) {
                total += num4 / num44;
                count++;
            }
            if (!isNaN(num5) && !isNaN(num55) && num55 > 0) {
                total += num5 / num55;
                count++;
            }

            // 최종 결과 계산
            const result5 = count > 0 ? (total * 2.75) : 0; // 입력된 값이 있을 경우에만 계산
            
            
            
            let rating2 = '';
            
            if (selectedBuildingType === 'residential') {
                if (result5 < 60) {
                    rating2 = '1+++등급';
                } else if (result5 < 90) {
                    rating2 = '1++등급';
                } else if (result5 < 120) {
                    rating2 = '1+등급';
                } else if (result5 < 150) {
                    rating2 = '1등급';
                } else if (result5 < 190) {
                    rating2 = '2등급';
                } else if (result5 < 230) {
                    rating2 = '3등급';
                } else if (result5 < 270) {
                    rating2 = '4등급';
                } else if (result5 < 320) {
                    rating2 = '5등급';
                } else if (result5 < 370) {
                    rating2 = '6등급';
                } else if (result5 < 420) {
                    rating2 = '7등급';
                } else {
                    rating2 = '부적합';
                }
            } else { // 비주거용 기준
                if (result5 < 80) {
                    rating2 = '1+++등급';
                } else if (result5 < 140) {
                    rating2 = '1++등급';
                } else if (result5 < 200) {
                    rating2 = '1+등급';
                } else if (result5 < 260) {
                    rating2 = '1등급';
                } else if (result5 < 320) {
                    rating2 = '2등급';
                } else if (result5 < 380) {
                    rating2 = '3등급';
                } else if (result5 < 450) {
                    rating2 = '4등급';
                } else if (result5 < 520) {
                    rating2 = '5등급';
                } else if (result5 < 610) {
                    rating2 = '6등급';
                } else if (result5 < 700) {
                    rating2 = '7등급';
                } else {
                    rating2 = '부적합';
                }
            }
           
            document.getElementById('result6').innerHTML = '<span style="color: white; font-size: 25px;">연간 단위면적당 1차에너지소요량: ' + result5.toFixed(2) + '(kWh/㎡년)</span>';
            
            document.getElementById('result5').innerHTML = '<span style="color: white; font-size: 25px;">에너지 효율 등급: </span><span style="font-size: 60px; color: #454BFF;">' + rating2 + '</span>';
        }
        
    </script>


</head>
<%@ include file="/WEB-INF/inc/nav.jsp"%>
<body class="landing">
	<div class="container">
<div>
	<div class="title">계산기</div>
</div>
		<div class="bigBox">
			<h2 style="margin-top: 30px;">계산기 선택</h2>
			<button class="btn" onclick="showCalculator(1)">탄소배출량 계산기</button>
			<button class="btn" onclick="showCalculator(2)">건물 에너지
				자립률계산기</button>
			<button class="btn" onclick="showCalculator(3)">에너지효율등급 계산기</button>

			<!-- 1번 계산기: 탄소배출량 계산기 -->
			<div id="calculator1" class="calculator">
				<h2>탄소배출량 계산기</h2>
				<div class="main">
					<div class="miniEl">
						<h2>
							<p style="margin-left: 10px;">전기(kwh/월)</p>
						</h2>
						<input class="box" type="number" id="inputValue"
							placeholder="월간 전기 사용량">
						<button class="calbtn" onclick="calculateElectricity()">계산하기</button>
						<div>
							<h2>
								<p id="result" class="result"></p>
							</h2>
						</div>
					</div>
					<div class="mini">
						<h2>
							<p style="margin-left: 30px;">가스(m³/월)</p>
						</h2>
						<input class="box" type="number" id="inputValue2"
							placeholder="월간 가스 사용량">
						<button class="calbtn" onclick="calculateGas()">계산하기</button>
						<h2>
							<p id="result2" class="result"></p>
						</h2>
					</div>
				</div>
				<div class="coment">
					<p class="coment">(전기 탄소배출량: 전기사용량 * 0.4781, 가스 탄소배출량: 가스사용량 *
						2.176)</p>
				</div>
				<div class="total">
					<h2>
						<p id="result3" class="result"></p>
					</h2>
				</div>
			</div>

			<!-- 2번 계산기: 에너지자립률(ZEB) -->
			<div id="calculator2" class="calculator">
				<h2>건물 에너지 자립률 계산기</h2>
				<div class="main">
					<div class="mini" style="padding: 0;">
						<h2>
							<p>자체 생산 에너지 (kWh/년)</p>
						</h2>
						<input type="number" id="production" class="box"
							style="width: 300px; margin: 20px;" placeholder="연간 에너지 생산량 입력">
					</div>

					<div class="mini">
						<h2>
							<p>소비 에너지 (kWh/년)</p>
						</h2>
						<input type="number" id="consumption" class="box"
							style="width: 300px; margin: 20px;" placeholder="연간 에너지 소비량 입력">
					</div>
					<button class="calbtn" style="margin: 20px;"
						onclick="calculateSelfSufficiency()">계산하기</button>
				</div>
				<div class="coment">
					<p>(해당 계산은 예상 등급이며, 실제 측정 결과와 다를 수 있습니다.)</p>
				</div>
				<div class="total">
					<h2>
						<p id="result4" class="result4"></p>
					</h2>
				</div>
				<div class="urlbtn">
					<button
						onclick="window.open('https://zeb.energy.or.kr/BC/BC03/BC03_07_001.do');">ZEB
						인증 신청하러 바로가기!</button>
				</div>
			</div>

			<div>
				<div id="calculator3" class="calculator">
					<h2>에너지효율등급 계산기</h2>
					<div class="main2">
						<div class="btnbox">
							<button class="btn" id="residentialBtn"
								onclick="selectBuildingType('residential')">주거용 건물</button>
							<button class="btn" id="commercialBtn"
								onclick="selectBuildingType('commercial')">주거용 외 건물</button>
						</div>
						<div class="mini2">
							<div class="miniBox">
								<label for="num1">난방에너지 소요량</label> <input type="number"
									id="num1" class="box2" placeholder="연간 난방에너지 소요량">
							</div>
							<div>
								<label for="num11">난방에너지가 요구되는 바닥면적</label> <input type="number"
									id="num11" class="box2" placeholder="난방 바닥면적">
							</div>
						</div>
						<div class="mini2">
							<div class="miniBox">
								<label for="num2">냉방에너지 소요량</label> <input type="number"
									id="num2" class="box2" placeholder="연간 냉방에너지 소요량">
							</div>
							<div>
								<label for="num22">냉방에너지가 요구되는 바닥면적</label> <input type="number"
									id="num22" class="box2" placeholder="냉방 바닥면적">
							</div>
						</div>
						<div class="mini2">
							<div class="miniBox">
								<label for="num3">급탕에너지 소요량</label> <input type="number"
									id="num3" class="box2" placeholder="연간 급탕에너지 소요량">
							</div>
							<div>
								<label for="num33">급탕에너지가 요구되는 바닥면적</label> <input type="number"
									id="num33" class="box2" placeholder="급탕 바닥면적">
							</div>
						</div>
						<div class="mini2">
							<div class="miniBox">
								<label for="num4">조명에너지 소요량</label> <input type="number"
									id="num4" class="box2" placeholder="연간 조명에너지 소요량">
							</div>
							<div>
								<label for="num44">조명에너지가 요구되는 바닥면적</label> <input type="number"
									id="num44" class="box2" placeholder="조명 바닥면적">
							</div>
						</div>
						<div class="mini2">
							<div class="miniBox">
								<label for="num5">환기에너지 소요량</label> <input type="number"
									id="num5" class="box2" placeholder="연간 환기에너지 소요량">
							</div>
							<div>
								<label for="num55">환기에너지가 요구되는 바닥면적</label> <input type="number"
									id="num55" class="box2" placeholder="환기 바닥면적">
							</div>
						</div>
						<button class="calbtn" onclick="basicCalculator()">계산하기</button>
					</div>
					<div class="coment">
						<p>(전기에너지 기준)(해당 계산은 예상 등급이며, 실제 측정 결과와 다를 수 있습니다.)</p>
					</div>
					<div class="total">
						<h2>
							<p id="result6" class="result5"></p>
							<p id="result5" class="result5"></p>
						</h2>
					</div>
					<div class="urlbtn">
						<button class="btn"
							onclick="window.open('https://beec.energy.or.kr/BC/BC02/BC02_04_002.do');">인증
							신청하러 바로가기!</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
        // 초기화: 첫 번째 계산기를 표시
        showCalculator(1);
    </script>
</body>
<%@ include file="/WEB-INF/inc/footer.jsp"%>
</html>
