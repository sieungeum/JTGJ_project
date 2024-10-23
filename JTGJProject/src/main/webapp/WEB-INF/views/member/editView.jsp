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
	href="${pageContext.request.contextPath }/css/main.css" /><link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<style>
.left-p {
	margin-left: 650px;
}
.gtr-uniform{
	
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<%@ include file="/WEB-INF/inc/head.jsp"%>
	<!-- nav -->
	<%@ include file="/WEB-INF/inc/nav.jsp"%>

	<section>
		<form class="ms-3" action="${pageContext.request.contextPath }/editDo"
			method="POST">
			<div class="gtr-uniform">
				<h2>회원수정</h2>
				<div class="col-5 d-block">
					<label name="memId">아이디(수정불가)</label>
					<input type="text" name="memId" id="inputId"
						value="${sessionScope.login.memId}" readonly />
				</div>
				<div class="col-5 d-block">
					<label name="memPw">비밀번호</label>
					<input type="password" name="memPw" id="inputpassword"
						value="${sessionScope.login.memPw}" />
				</div>
				<div class="col-5 d-block">
					<label name="memName">이름</label>
					<input type="text" name="memName" id="inputName"
						value="${sessionScope.login.memName}" />
				</div>
				<div class="col-5 d-block">
					<label name="memEmail">이메일</label>
					<input type="text" name="memEmail" id="inputEmail"
						value="${sessionScope.login.memEmail}" />
				</div>
				<div class="text-end col-5 mt-3">
					<button class="btn btn-primary btn-xl text-uppercase"
						id="submitBtn" type="submit">수정</button>
				</div>
			</div>
		</form>
	</section>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>
</html>