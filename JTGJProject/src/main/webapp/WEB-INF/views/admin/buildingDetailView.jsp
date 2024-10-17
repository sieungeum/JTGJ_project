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
							<p>건물 상세 보기 / 수정</p>
							<table id="table">
								<thead>
									<tr>
										<td scope ="col">${detail.purposeKindName }</td>
										<td scope ="col">${detail.bldNm }</td>
										<td scope ="col">${detail.grdName }</td>
										<td scope ="col">${detail.wOneEnergyRequire }</td>
										<td scope ="col">${detail.crtifIsuDd }</td>										
										<td scope ="col">${detail.locAddr }</td>										
										<td scope ="col">${detail.zeb }</td>										
										<td scope ="col">${detail.mmThousP }</td>										
										<td scope ="col">${detail.mmTenThousP }</td>										
										<td scope ="col">${detail.mmFiftyThousP }</td>										
										<td scope ="col">${detail.del_Yn }</td>										
									</tr>
								</thead>
							</table>
							
						</div>
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>