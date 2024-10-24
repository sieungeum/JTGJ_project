<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>계산기</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>

		<!-- Banner -->
		<section>
			<div class="row justify-content-center">
				<img src="images/저탄고집v6.png" width="200px">
				<p>건의사항</p>
				<form id="contactForm"
					action="${pageContext.request.contextPath }/noticeEditDo"
					method="POST">
					<input type="hidden" name="notiNo" value="${notice.notiNo }">

					<div class="mb-3">
						<label for="inputTitle">제목</label> <input class="form-control"
							id="inputTitle" type="text" name="notiTitle"
							value="${notice.notiTitle }" />
					</div>
					<div class="mb-3">
						<textarea class="form-control" name="notiContent" rows="10">${notice.notiContent }</textarea>
					</div>

					<button class="btn btn-primary btn-xl" id="submitButton"
						type="submit">등록</button>
				</form>
			</div>
		</section>



		<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>