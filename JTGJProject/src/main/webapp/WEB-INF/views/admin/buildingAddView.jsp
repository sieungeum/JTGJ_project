<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>건물 추가</title>
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
							<p>건물 추가</p>
							<form id="contactFrom" action="<c:url value="/buildingAddDo" />" method="POST">
								<table id="table">
									<thead>
										<tr>
											<td scope ="col">건물용도 : </td>
											<td><input class="form-control" id = "inputPurposeKindName" type="text" name="purposeKindName" value=""></td>
										</tr>
										<tr>
											<td scope ="col">건물명 : </td>
											<td><input class="form-control" id = "inputBldNm" type="text" name="bldNm" value=""></td>
										</tr>
										<tr>
											<td scope ="col">에너지 효율 등급 : </td>
											<td><input class="form-control" id = "inputGrdName" type="text" name="grdName" value=""></td>
										</tr>
										<tr>
											<td scope ="col">1차 에너지 소요량 : </td>
											<td><input class="form-control" id = "inputWOneEnergyRequire" type="text" name="wOneEnergyRequire" value=""></td>
										</tr>
										<tr>
											<td scope ="col">건물 주소 : </td>
											<td><input class="form-control" id = "inputLocAddr" type="text" name="locAddr" value=""></td>
										</tr>
										<tr>
											<td scope ="col">ZEB 유무 : </td>
											<td><input class="form-control" id = "inputZeb" type="text" name="zeb" value=""></td>
										</tr>
										<tr>
											<td scope ="col">위도 : </td>
											<td><input class="form-control" id = "inputLat" type="text" name="lat" value=""></td>	
										</tr>
										<tr>
											<td scope ="col">경도 : </td>
											<td><input class="form-control" id = "inputLng" type="text" name="lng" value=""></td>	
										</tr>
									</thead>
								</table>
								<button class="btn btn-primary btn-xl" type="submit">추가</button>
								<a href="${pageContext.request.contextPath }/buildingView">건축물 목록으로 돌아가기</a>
							</form>
							
						</div>
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>