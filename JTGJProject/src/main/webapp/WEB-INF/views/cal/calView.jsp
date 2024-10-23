<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>계산기</title>
<style>
div {
	margin: 0;
	padding: 0;
}

.container{
	
}

.title{
	font-size: 40px;
	padding-left: 45%;
}

.calculator {
	display: none; /* 기본적으로 계산기는 숨김 */
}

.box {
	color: white;
	width: 250px;
	height: 15px;
	background-color: black;
	border-color: white;
}

.box2 {
	color: white;
	width: 300px;
	height: 40px;
	background-color: black;
	border-color: white;
}

.calculator {
	padding-top: 50px;
}

.coment {

	padding-left: 100px;
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
}

.mini {
	padding: 50px;
}

.mini2 {
	padding: 20px;
}

.miniBox{
	padding-bottom: 30px;
}

.total {
	font-size: 30px;
	background-color: green;
}

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0; /* 기본 여백 제거 */
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
        selectedButton.style.backgroundColor = 'lightgray'; // 선택된 버튼 강조
        selectedButton.style.transform = 'scale(0.95)'; // 클릭 효과
    }
}

        // 1번 계산기: 탄소배출량 계산기
        function calculateElectricity() {
            const inputValue = parseFloat(document.getElementById('inputValue').value);
            
            const result = inputValue * 0.4781;
            document.getElementById('result').innerText = '전기 탄소배출량: ' + result.toFixed(2) + " kg/월";
            calculateTotal();
        }

        function calculateGas() {
            const inputValue2 = parseFloat(document.getElementById('inputValue2').value);
            
            const result2 = inputValue2 * 2.176;
            document.getElementById('result2').innerText = '가스 탄소배출량: ' + result2.toFixed(2) + " kg/월";
            calculateTotal();
        }

        function calculateTotal() {
            const total = (parseFloat(document.getElementById('inputValue').value) || 0) * 0.4781 + 
                          (parseFloat(document.getElementById('inputValue2').value) || 0) * 2.176;
            document.getElementById('result3').innerText = '총 탄소배출량: ' + total.toFixed(2) + " kg/월";
        }

        // 2번 계산기: 간단한 계산기
         function calculateSelfSufficiency() {
            const production = parseFloat(document.getElementById('production').value);
            const consumption = parseFloat(document.getElementById('consumption').value);
            
            if (isNaN(production) || isNaN(consumption) || consumption <= 0) {
                alert("올바른 값을 입력하세요.");
                return;
            }

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
            document.getElementById('result4').innerText = '에너지 자립률(ZEB): ' + rating;
        }
        
        <!-- 3번 계산기-->
        let selectedBuildingType = 'residential'; // 기본값

        function selectBuildingType(type) {
            selectedBuildingType = type;
            
            // 버튼 스타일 변경 (선택된 버튼 강조)
            document.getElementById('residentialBtn').style.backgroundColor = type === 'residential' ? 'lightgray' : '';
            document.getElementById('commercialBtn').style.backgroundColor = type === 'commercial' ? 'lightgray' : '';
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
           
            document.getElementById('result6').innerText = '연간 단위면적당 1차에너지소요량: ' + result5.toFixed(2) + '(kWh/㎡년)';
            
            document.getElementById('result5').innerText = '에너지 효율 등급: ' + rating2;
        }
        
    </script>


</head>
<%@ include file="/WEB-INF/inc/nav.jsp"%>
<div>
	<img src="images/저탄고집v6.png" width="200px">
	<div class="title">
		<h2>계산기</h2>
	</div> 
</div>
<body>
	<div class="container">
	<h1>계산기 선택</h1>
	<button onclick="showCalculator(1)">탄소배출량 계산기</button>
	<button onclick="showCalculator(2)">건물 에너지 자립률 계산기</button>
	<button onclick="showCalculator(3)">에너지효율등급 계산기</button>

	<!-- 1번 계산기: 탄소배출량 계산기 -->
	<div id="calculator1" class="calculator">
		<h3>탄소배출량 계산기</h3>
		<div class="main">
			<div class="mini">
				<h2>
					<p>전기(kwh/월)</p>
				</h2>
				<input class="box" type="number" id="inputValue"
					placeholder="월간 전기 사용량">
				<button onclick="calculateElectricity()">계산하기</button>
				<p class="coment">(전기 탄소배출량: 전기사용량 * 0.4781)</p>
				<h2>
					<p id="result" class="result"></p>
				</h2>
			</div>
			<div class="mini">
				<h2>
					<p>가스(m³/월)</p>
				</h2>
				<input class="box" type="number" id="inputValue2"
					placeholder="월간 가스 사용량">
				<button onclick="calculateGas()">계산하기</button>
				<p class="coment">(가스 탄소배출량: 가스사용량 * 2.176)</p>
				<h2>
					<p id="result2" class="result"></p>
				</h2>
			</div>
		</div>
		<div class="total">
			<h2>
				<p id="result3" class="result"></p>
			</h2>
		</div>
	</div>

	<!-- 2번 계산기: 에너지자립률(ZEB) -->
	<div id="calculator2" class="calculator">
		<h1>건물 에너지 자립률 계산기</h1>
		<div>
			<div>
				<label for="production">자체 생산 에너지 (kWh/년):</label> <input
					type="number" id="production" class="box2"
					placeholder="연간 에너지 생산량 입력">
			</div>

			<div>
				<label for="consumption">소비 에너지 (kWh/년):</label> <input
					type="number" id="consumption" class="box2"
					placeholder="연간 에너지 소비량 입력">
			</div>
		</div>

		<button onclick="calculateSelfSufficiency()">계산하기</button>
		<p class="coment">(해당 계산은 예상 등급이며, 실제 측정 결과와 다를 수 있습니다.)</p>
		<div class="total">
			<h2>
				<p id="result4" class="result4"></p>
			</h2>
		</div>
		<button onclick="window.open('https://zeb.energy.or.kr/BC/BC03/BC03_07_001.do');">인증 신청하러 바로가기!</button>
	</div>

	<div>
		<div id="calculator3" class="calculator">
			<h1>에너지효율등급 계산기</h1>
				<div>
					<button id="residentialBtn"
						onclick="selectBuildingType('residential')">주거용 건물</button>
					<button id="commercialBtn"
						onclick="selectBuildingType('commercial')">주거용 외 건물</button>
				</div>
			<div class="main">
				<div class="mini2">
					<div class="miniBox">
						<label for="num1">난방에너지 소요량</label> <input type="number" id="num1"
							class="box2" placeholder="연간 난방에너지 소요량">
					</div>
					<div>
						<label for="num11">난방에너지가 요구되는 바닥면적</label> <input type="number"
							id="num11" class="box2" placeholder="난방 바닥면적">
					</div>
				</div>
				<div class="mini2">
					<div class="miniBox">
						<label for="num2">냉방에너지 소요량</label> <input type="number" id="num2"
							class="box2" placeholder="연간 냉방에너지 소요량">
					</div>
					<div>
						<label for="num22">냉방에너지가 요구되는 바닥면적</label> <input type="number"
							id="num22" class="box2" placeholder="냉방 바닥면적">
					</div>
				</div>
				<div class="mini2">
					<div class="miniBox">
						<label for="num3">급탕에너지 소요량</label> <input type="number" id="num3"
							class="box2" placeholder="연간 급탕에너지 소요량">
					</div>
					<div>
						<label for="num33">급탕에너지가 요구되는 바닥면적</label> <input type="number"
							id="num33" class="box2" placeholder="급탕 바닥면적">
					</div>
				</div>
				<div class="mini2">
					<div class="miniBox">
						<label for="num4">조명에너지 소요량</label> <input type="number" id="num4"
							class="box2" placeholder="연간 조명에너지 소요량">
					</div>
					<div>
						<label for="num44">조명에너지가 요구되는 바닥면적</label> <input type="number"
							id="num44" class="box2" placeholder="조명 바닥면적">
					</div>
				</div>
				<div class="mini2">
					<div class="miniBox">
						<label for="num5">환기에너지 소요량</label> <input type="number" id="num5"
							class="box2" placeholder="연간 환기에너지 소요량">
					</div>
					<div>
						<label for="num55">환기에너지가 요구되는 바닥면적</label> <input type="number"
							id="num55" class="box2" placeholder="환기 바닥면적">
					</div>
				</div>
			</div>
			<p class="coment2">(해당 계산은 예상 등급이며, 실제 측정 결과와 다를 수 있습니다.)</p>
			<p class="coment2">(해당 계산은 전기에너지를 기준으로 측정하였습니다 .)</p>
			<button onclick="basicCalculator()">계산하기</button>
			<div class="total">
				<h2>
					<p id="result6" class="result5"></p>
					<p id="result5" class="result5"></p>
				</h2>
			</div>
			<button onclick="window.open('https://beec.energy.or.kr/BC/BC02/BC02_04_002.do');">인증 신청하러 바로가기!</button>
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
