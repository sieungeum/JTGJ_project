<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>게시글작성</title>
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
					action="${pageContext.request.contextPath }/boardWriteDo"
					method="POST" enctype="multipart/form-data">
					<div class="mb-3">
						<label for="inputTitle">제목</label> <input class="form-control"
							id="inputTitle" type="text" name="boardTitle" />
					</div>
					<div class="mb-3">
						<textarea class="form-control" name="boardContent" rows="10"></textarea>
					</div>
					<!-- 파일 -->
					<div class="mb-3">
						<label for="formFileMultiple" class="form=label">파일 첨부</label> <input
							class="form-control" name="boFile" type="file"
							id="formFileMultiple" multiple>
					</div>
					<button class="btn btn-primary btn-xl" id="submitButton"
						type="submit">등록</button>
				</form>
			</div>
		</section>



		<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>