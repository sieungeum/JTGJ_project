<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<%@ include file="/WEB-INF/inc/head.jsp"%>

<!-- ajax 통신 시 필요 script -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<style type="text/css">
	.map-container{
		position: relative;
		
		width: 100%;
		height: 600px;
	}
	
	.map-detail{
		display: none;
	
		position: absolute;
		width: 50%;
		height:500px;
		bottom: 0px;
		left: 0px;
		
	}
</style>
</head>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>
		
		<!-- Banner -->
		<div class="map-container bg-primary mt-5">
			<button id='detailBtn' class="btn btn-primary">지도 상세 보기</button>
			<div class="map-detail bg-success" >
				<p>건물용도 : ${sessionScope.mapInfo.purposeKindName}</p>
				<p>건물명 : ${sessionScope.mapInfo.bldNm}</p>
				<p>에너지 효율 등급 : ${sessionScope.mapInfo.grdName}</p>
				<p>1차 에너지 소요량 : ${sessionScope.mapInfo.wOneEnergyRequire}</p>
				<p>인증발급일자 : ${sessionScope.mapInfo.crtifIsuDd}</p>
				<p>건물 주소 : ${sessionScope.mapInfo.locAddr}</p>
				<p>ZEB 인증 유무 : ${sessionScope.mapInfo.zeb}</p>
				<span>1000m^2 : ${sessionScope.mapInfo.mmThousP}</span>
				<span>10000m^2 : ${sessionScope.mapInfo.mmTenThousP}</span>
				<span>50000m^2 : ${sessionScope.mapInfo.mmFiftyThousP}</span>
			</div>
		</div>
		
		
		
		<%@ include file="/WEB-INF/inc/footer.jsp"%>

	</div>
	
	<script type="text/javascript">
		let v_detailBtn = document.querySelector("#detailBtn");
		let v_mapDetail = document.querySelector(".map-detail");
		
		v_detailBtn.addEventListener("click", () => {
			v_mapDetail.style.display = "inline-block";
		})
	
	</script>
</body>
</html>