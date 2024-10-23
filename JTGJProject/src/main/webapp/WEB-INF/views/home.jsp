<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<style>
	.landing{
		background-image: url("images/first_screen_image.jpg");
		background-size: 100%;
	}
	
	.introduce-btn{
		font-weight: bold;
		color: black;
		margin-top: 100px;
		background-color: rgba(212, 212, 212, 0.5);
		border-radius: 20px;
		padding:10px;
		width: 20%;
		cursor: pointer;
	}
	
	.introduce-btn:hover{
		background-color: rgba(190, 190, 190, 0.5);
	}
</style>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>

		<!-- Banner -->
		<section id="banner">
			<div class="inner" style="display:flex; flex-direction:column; align-items:center;">
				<img src="images/저탄고집v6.png" width="300px">
				<ul class="actions special">
					<c:if test="${sessionScope.login == null}" >
						<li><a href="${pageContext.request.contextPath }/loginView" class="button primary">로그인하기</a></li>
					</c:if>
					<c:if test="${sessionScope.login != null}" >
					</c:if>
				</ul>
				<div class="introduce-btn" id="intBtn">
					<a href="#one">탄소중립 2050을 위한 방법<br /> 함께 알아볼까요?</a>
				</div>
					
			</div>
		</section>

		<!-- 설명 On -->
		<section class="wrapper alt style2">
			<!-- 1 -->
			<section id="one" class="spotlight">
				<div class="image">
					<img src="images/pic01.jpg" alt="" />
				</div>
				<div class="content">
					<a href="#two">건물 정보</a>
				</div>
			</section>
			
			<!-- 2 -->
			<section id="two" class="spotlight">
				<div class="image">
					<img src="images/pic02.jpg" alt="" />
				</div>
				<div class="content">
					<a href="#three">건물 정보</a>
				</div>
			</section>
			
			<!-- 3 -->
			<section id="three" class="spotlight">
				<div class="image">
					<img src="images/pic03.jpg" alt="" />
				</div>
				<div class="content">
					<a href="#fourth">건물 정보</a>
				</div>
			</section>
			
			<!-- 4 -->
			<section id="fourth" class="spotlight">
				<div class="image">
					<img src="images/pic02.jpg" alt="" />
				</div>
				<div class="content">
					<a href="#fifth">건물 정보</a>
				</div>
			</section>
			
			<!-- 5 -->
			<section id="fifth" class="spotlight">
				<div class="image">
					<img src="images/pic03.jpg" alt="" />
				</div>
				<div class="content">
					
				</div>
			</section>
		</section>

		<!-- CTA -->
		<section id="cta" class="wrapper style4">
			<div class="inner">
				<header>
					<h2>Arcue ut vel commodo</h2>
					<p>Aliquam ut ex ut augue consectetur interdum endrerit
						imperdiet amet eleifend fringilla.</p>
				</header>
				<ul class="actions stacked">
					<li><a href="#" class="button fit primary">Activate</a></li>
					<li><a href="#" class="button fit">Learn More</a></li>
				</ul>
			</div>
		</section>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>

	</div>


</body>
</html>