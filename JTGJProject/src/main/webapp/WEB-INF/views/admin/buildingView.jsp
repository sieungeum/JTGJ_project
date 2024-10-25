<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
	<title>건물 목록</title>
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
	
	</style>
	
	</head>
		<body class="landing is-preload">
	
			<!-- Page Wrapper -->
	
					<!-- Header -->
						<%@ include file="/WEB-INF/inc/nav.jsp" %>
	
					<!-- Banner -->
						<section class="mar-top">
							<div class="inner">
								
								<div class="container">
									
									
									<div class="sor">
										<p>건물 목록</p>	
										<form class="d-flex justify-content-end" action="${pageContext.request.contextPath }/buildingView" method="GET">						
											<select class="selectLong form-select me-1" name="searchOption">
												<option value="building" selected>건물명</option>
												<option value="address">주소</option>
											</select>				
											<input type="text" class="form-control w-25" name="searchWord" >
											<button class="btn btn-primary" type="submit">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
													<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
												</svg>
											</button>
										</form>
									</div>
									
									<div class="col-lg-8 col-xl-7 d-flex justify-content-end">
										<a href="${pageContext.request.contextPath }/buildingAddView">
											<button class="btn btn-primary btn-xl"> 건물 추가 </button>
										</a>
										<a class="btn-ihs" href="${pageContext.request.contextPath }/adminMainView">
											<button class="btn btn-primary btn-xl"> 관리자 메인 페이지로 </button>
										</a>
									</div>
									
									<table id="table">
										<thead>
											<tr class="th-size">
												<th scope ="col">용도</th>
												<th scope ="col">건물명</th>
												<th scope ="col">에너지효율등급</th>
												<th scope ="col">발급일</th>
												<th scope ="col">주소</th>
												<th scope ="col">ZEB 유무</th>
												<th scope ="col">1차 에너지 소요량</th>
											</tr>
										</thead>
										<tbody>
											
											<c:forEach items="${AdminList }" var = "admin">
												<tr class="td-size">
													<td scope = "row">${admin.purposeKindName }</td>
													<td>${admin.bldNm }</td>
													<td>${admin.grdName }  </td>
													<td>${admin.crtifIsuDd }</td>
													<td>${admin.locAddr }</td>
													<td>${admin.zeb } </td>
													<td>${admin.wOneEnergyRequire }</td>
													<td>
														<a href="<c:url value="/buildingDetailView?bldNm=${admin.bldNm }&purposeKindName=${admin.purposeKindName }" />">
															<button class="btn btn-primary btn-xl">상세 보기</button>
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								
							</div>
							
						</section>
	
					
	
		<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>
