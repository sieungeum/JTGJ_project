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
							<p>관리자 메인 페이지</p>
							<table id="table">
								<thead>
									<tr>
										<th scope ="col"><a href="${pageContext.request.contextPath }/buildingView">건물 상세보기</a></th>
										<c:if test="${sessionScope.login.memAdminYn == 'Y'|| sessionScope.login.memAdminYn == 'K'  }">
											<th scope ="col"><a href="${pageContext.request.contextPath }/adminMemView">회원관리</a></th>	
										</c:if>
									</tr>
								</thead>
							</table>
							
						</div>
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>