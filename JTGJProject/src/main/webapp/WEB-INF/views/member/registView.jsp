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

		<!-- Page Wrapper -->

				<!-- Header -->
					<header id="header">
						<h1><a href="index.html">Spectral</a></h1>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
											<li><a href="index.html">Home</a></li>
											<li><a href="generic.html">Generic</a></li>
											<li><a href="elements.html">Elements</a></li>
											<li><a href="#">Sign Up</a></li>
											<li><a href="#">Log In</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>

				

					<section>
						<h4>회원가입</h4>
						<form action="${pageContext.request.contextPath }/registDo" method="POST">
							<div class="row gtr-uniform">

								<div class="col-6 col-12">
									<input type="text" name="id" id="inputId" value="" placeholder="아이디" />
								</div>
								<div class="col-6 col-12">
									<input type="password" name="password" id="inputpassword" value="" placeholder="비밀번호" />
								</div>
								<div class="col-6 col-12">
									<input type="text" name="name" id="inputName" value="" placeholder="이름" />
								</div>
								<div class="col-6 col-12">
									<input type="text" name="email" id="inputEmail" value="" placeholder="이메일" />
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><div class="text-center"><button class="btn btn-primary btn-xl text-uppercase" id="submitBtn" type="submit">회원가입 완료</button></div></li>
										<li><input type="reset" value="돌아가기" /></li>
									</ul>
									
								</div>
									
							</div>
						</form>
					</section>

								
	</body>
</html>