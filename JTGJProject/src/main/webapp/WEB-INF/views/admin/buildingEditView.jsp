<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<title>건물 수정</title>
	<%@ include file="/WEB-INF/inc/head.jsp"%>
	
	<style>
		div {
			margin: 0;
			padding: 0;
		}
		
		.landing {
			background-image: url("images/관리자_건물목록.jpg");
			background-size: 100%;
		}
		
		.container {
			width: 70%;
			background-color: white ;
			opacity: 0.9;
			border-top: solid 10px #03C75A;
			border-bottom: solid 10px #03C75A;
			border-radius: 25px;
		}
		
		.container td{
			color: black;
		}
		
		.container p {
			color: rgb(3, 199, 90);
			font-size: 45px;
			font-weight: 700;
			margin-top: 40px;
			
		}
		
		.sor {
			display: flex;
			justify-content: space-between;
			align-items: center
		}
		
		.notice td{
			color:red;
			font-weight: bold;
		}
		
		.container th{
			color: black;
			font-size: 30px;
			padding-top: 20px;
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
			margin-bottom: 0;
			padding-left: 70%;
			text-shadow: -1px -1px 0 black, 1px -1px 0 black, -1px 1px 0 black, 1px
				1px 0 black;
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
		
		.selectLong {
			width: 130px;
		}
		
		.th-size th {
			font-size: 20px;
		}
		
		.td-size td{
			font-size: 20px;
		}
		
		.mar-top {
			margin-top: 200px;
		}
		
		.width-m{
			width: 300px;
		}
		
		.mar-buttom{
			margin-bottom: 30px;
		}
		
		.td-weghit td {
			font-weight: 700;
		}
		
		.m-right{
			margin-right:50px; 
		}
	
	</style>
	
</head>
	<body class="landing is-preload">
	
		<%@ include file="/WEB-INF/inc/nav.jsp" %>
		
		<section class="mar-top">
			<div class="inner">
				<div class="container">
					<p>건물 수정</p>
					<form id="contactFrom" action="<c:url value="/buildingEditDo" />" method="POST">
					<input type="hidden" name="bldNm" value="${edit.bldNm}">
					<input type="hidden" name="purposeKindName" value="${edit.purposeKindName}">
					<table id="table">
						<thead class="td-weghit">
							<tr>
								<td scope ="col">건물 용도 : </td>
								<td scope ="col">${edit.purposeKindName}</td>
							</tr>
							<tr>
								<td scope ="col">건물명 : </td>
								<td scope ="col">${edit.bldNm}</td>
							</tr>
							<tr>
								<td scope ="col">에너지 효율 등급 : </td>
								<td><input class="form-control" id = "inputGrdName" type="text" name="grdName" value="${edit.grdName }"></td>
							</tr>
							<tr>
								<td scope ="col">1차 에너지 소요량 : 
								<td><input class="form-control" id = "inputWOneEnergyRequire" type="text" name="wOneEnergyRequire" value="${edit.wOneEnergyRequire }"></td>
							</tr>
							<tr>
								<td scope ="col">건물 주소 : </td>
								<td><input class="form-control" id = "inputLocAddr" type="text" name="locAddr" value="${edit.locAddr }"></td>
							</tr>
							<tr>
								<td scope ="col">ZEB 유무 : </td>
								<td><input class="form-control" id = "inputZeb" type="text" name="zeb" value="${edit.zeb }"></td>
							</tr>
							<tr>
								<td scope ="col">위도 : </td>
								<td><input class="form-control" id = "inputLat" type="text" name="lat" value="${edit.lat }"></td>	
							</tr>
							<tr>
								<td scope ="col">경도 : </td>
								<td><input class="form-control" id = "inputLng" type="text" name="lng" value="${edit.lng }"></td>	
							</tr>
							<tr>
								<td scope ="col">삭제 유무 : </td>
								<td><input class="form-control" id = "inputDelYn" type="text" name="delYn" value="${edit.delYn }"></td>	
								</tr>
							</thead>
						</table>
						<div class="d-flex justify-content-end mar-buttom ">
							<button class="btn btn-primary btn-xl" type="submit">갱신</button>
						</div>
					</form>
				</div>
				
			</div>
			
		</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>