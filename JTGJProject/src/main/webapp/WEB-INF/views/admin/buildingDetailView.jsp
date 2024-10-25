<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>건물 상세보기</title>
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
							<p>건물 상세 보기</p>
							<table id="table">
								<thead>
									<tr>
										<td scope ="col">건물 용도 : </td><td scope ="col">${detail.purposeKindName }</td>
									</tr>
									<tr>
										<td scope ="col">건물명 : </td><td scope ="col">${detail.bldNm }</td>
									</tr>
									<tr>
										<td scope ="col">에너지 효율 등급 : </td><td scope ="col">${detail.grdName }</td>
									</tr>
									<tr>
										<td scope ="col">1차 에너지 소요량 : </td><td scope ="col">${detail.wOneEnergyRequire }</td>
									</tr>
									<tr>
										<td scope ="col">인증 발급 일자 : </td><td scope ="col">${detail.crtifIsuDd }</td>
									</tr>
									<tr>
										<td scope ="col">건물 주소 : </td><td scope ="col">${detail.locAddr }</td>
									</tr>
									<tr>
										<td scope ="col">ZEB 유무 : </td><td scope ="col">${detail.zeb }</td>
									</tr>
									<tr>
										<td scope ="col">위도 : </td><td scope ="col">${detail.lat }</td>	
									</tr>
									<tr>
										<td scope ="col">경도 : </td><td scope ="col">${detail.lng }</td>	
									</tr>
									<tr>
										<td scope ="col">삭제 유무 : </td><td scope ="col">${detail.delYn }</td>	
									</tr>
								</thead>
							</table>
							<a href="<c:url value="/buildingEditView?bldNm=${detail.bldNm }&purposeKindName=${detail.purposeKindName }" />">
								<button class="btn btn-primary btn-xl">수정 하기</button>
							</a>
							<a href="${pageContext.request.contextPath }/buildingView">건축물 목록으로 돌아가기</a>
						</div>
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>