<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Spectral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/main.css" />

<style>
.left-p {
	margin-left: 650px;
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<%@ include file="/WEB-INF/inc/head.jsp"%>
	<!-- nav -->
	<%@ include file="/WEB-INF/inc/nav.jsp"%>

	<section>
		<h4>회원수정</h4>
		<form action="${pageContext.request.contextPath }/editDo"
			method="POST">
			<div class="row gtr-uniform">

				<div class="col-6 col-12">
					<input type="text" name="memId" id="inputId"
						value="${sessionScope.login.memId}" readonly />
				</div>
				<div class="col-6 col-12">
					<input type="password" name="memPw" id="inputpassword"
						value="${sessionScope.login.memPw}" />
				</div>
				<div class="col-6 col-12">
					<input type="text" name="memName" id="inputName"
						value="${sessionScope.login.memName}" />
				</div>
				<div class="col-6 col-12">
					<input type="text" name="memEmail" id="inputEmail"
						value="${sessionScope.login.memEmail}" />
				</div>
				<div class="col-12">
					<ul class="actions">
						<li>
							<div class="text-center">
								<button class="btn btn-primary btn-xl text-uppercase"
									id="submitBtn" type="submit">수정</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</form>
	</section>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>
</html>