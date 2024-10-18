<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<%@ include file="/WEB-INF/inc/head.jsp" %>
	<body class="landing is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<%@ include file="/WEB-INF/inc/nav.jsp" %>

				<!-- Banner -->
					<section>
						<div class="inner">
							<img src="images/저탄고집v6.png" width="200px" >
							<p>관리자 페이지</p>
							<table id="table">
								<thead>
									<tr>
										<th scope ="col">번호</th>
										<th scope ="col">제목</th>
										<th scope ="col">작성자</th>
										<th scope ="col">날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adminList }" var = "admin">
										<tr>
											<td scope = "row">${admin.purposeKindName }</td>
											<td>${admin.bldNm }</td>
											<td>${admin.grdName }</td>
											<td>${admin.crtifIsuDd }</td>
											<td>${admin.locAddr }</td>
											<td>${admin.zeb }</td>
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
