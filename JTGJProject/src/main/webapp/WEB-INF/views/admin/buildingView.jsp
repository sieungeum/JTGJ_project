<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Spectral by HTML5 UP</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
	<body class="landing is-preload">

		<!-- Page Wrapper -->

				<!-- Header -->
					<%@ include file="/WEB-INF/inc/nav.jsp" %>

				<!-- Banner -->
					<section>
						<div class="inner">
							<img src="images/저탄고집v6.png" width="200px" >
							<p>관리자 페이지</p>
							
							<div>
								<form class="d-flex justify-content-center" action="${pageContext.request.contextPath }/buildingView" method="GET">						
									<select class="form-select w-25" name="searchOption">
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
							</div>
							
							
							
							<table id="table">
								<thead>
									<tr>
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
										<tr>
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
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
