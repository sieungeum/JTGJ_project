<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Spectral by HTML5 UP</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>

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