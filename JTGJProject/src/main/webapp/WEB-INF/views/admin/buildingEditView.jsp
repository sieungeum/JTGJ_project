<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>건물 수정</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
	<body class="landing is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<%@ include file="/WEB-INF/inc/nav.jsp" %>

				<!-- Banner -->
					<section>
						<div class="inner">
							<img src="images/저탄고집v6.png" width="200px" >
							<p>건물 수정</p>
							<form id="contactFrom" action="<c:url value="/buildingEditDo" />" method="POST">
								<input type="hidden" name="bldNm" value="${edit.bldNm}">
								<input type="hidden" name="purposeKindName" value="${edit.purposeKindName}">
								<table id="table">
									<thead>
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
								<button class="btn btn-primary btn-xl" type="submit">갱신</button>
							</form>
							
						</div>
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>