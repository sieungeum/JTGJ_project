<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
					<div class="row justify-content-center">
					<img src="images/저탄고집v6.png" width="200px" >
							<p>건의사항</p>
						<form id="contactForm" action="${pageContext.request.contextPath }/boardWriteDo" method="POST">
							<div class="mb-3">
								<h6>${board.boardTitle}</h6>
							</div>
							<div>
								<h6>${board.memName}</h6>
								<h6>${board.boardDate}</h6>
							</div>
							<div class="mb-3">
								<pre>${board.boardContent}</pre>
							</div>
						</form>
						</div>
					</section>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>