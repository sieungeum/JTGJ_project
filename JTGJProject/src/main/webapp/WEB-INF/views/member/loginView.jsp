<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Elements - Spectral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css" />

		<style>

			.left-p {
				margin-left:650px;
			}

		</style>
	</head>
	<body class="is-preload">
	
		<!-- Header -->
		<%@ include file="/WEB-INF/inc/head.jsp" %>				
		
		<%@ include file="/WEB-INF/inc/nav.jsp" %>
		
					<section>
						<h4>로그인</h4>
						<form action="${pageContext.request.contextPath }/loginDo" method="POST">
							<div class="row gtr-uniform">

								<div class="col-6 col-12">
									<input type="text" name="memId" id="inputId" value="" placeholder="아이디" />
								</div>
								<div class="col-6 col-12">
									<input type="password" name="memPw" id="inputpassword" value="" placeholder="비밀번호" />
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><div class="text-center"><button class="btn btn-primary btn-xl text-uppercase" id="submitBtn" type="submit">로그인</button></div></li>
										<li><div><a href="${pageContext.request.contextPath }/home"><button class="btn btn-primary btn-xl text-uppercase">홈으로 돌아가기</button></a></div></li>
										<li><a class="left-p" href="${pageContext.request.contextPath }/registView">회원가입</a></li>
									</ul>
									
								</div>
									
							</div>
						</form>
					</section>
		<%@ include file="/WEB-INF/inc/footer.jsp" %>
								
	</body>
</html>