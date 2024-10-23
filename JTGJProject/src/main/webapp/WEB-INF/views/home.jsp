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
<%@ include file="/WEB-INF/inc/head.jsp"%>
<style>
	.landing{
		background-image: url("images/first_screen_image.jpg");
		background-size: 100%;
	}
</style>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>

		<!-- Banner -->
		<section id="banner">
			<div class="inner">
				<img src="images/저탄고집v6.png" width="300px">
				<p>
					탄소중립 2050을 위한 방법<br /> 함께 알아볼까요?
				</p>
				<ul class="actions special">
					<c:if test="${sessionScope.login == null}" >
						<li><a href="${pageContext.request.contextPath }/loginView" class="button primary">로그인하기</a></li>
					</c:if>
					<c:if test="${sessionScope.login != null}" >
					</c:if>
				</ul>
			</div>

		</section>

		<!-- One -->
		<section id="one" class="wrapper style1 special">
			<div class="inner">
				<header class="major">
					<h2>
						Arcu aliquet vel lobortis ata nisl<br /> eget augue amet aliquet
						nisl cep donec
					</h2>
					<p>
						Aliquam ut ex ut augue consectetur interdum. Donec amet imperdiet
						eleifend<br /> fringilla tincidunt. Nullam dui leo Aenean mi
						ligula, rhoncus ullamcorper.
					</p>
				</header>
				<ul class="icons major">
					<li><span class="icon fa-gem major style1"><span
							class="label">Lorem</span></span></li>
					<li><span class="icon fa-heart major style2"><span
							class="label">Ipsum</span></span></li>
					<li><span class="icon solid fa-code major style3"><span
							class="label">Dolor</span></span></li>
				</ul>
			</div>
		</section>

		<!-- Two -->
		<section id="two" class="wrapper alt style2">
			<section class="spotlight">
				<div class="image">
					<img src="images/pic01.jpg" alt="" />
				</div>
				<div class="content">
					<h2>
						Magna primis lobortis<br /> sed ullamcorper
					</h2>
					<p>Aliquam ut ex ut augue consectetur interdum. Donec hendrerit
						imperdiet. Mauris eleifend fringilla nullam aenean mi ligula.</p>
				</div>
			</section>
			<section class="spotlight">
				<div class="image">
					<img src="images/pic02.jpg" alt="" />
				</div>
				<div class="content">
					<h2>
						Tortor dolore feugiat<br /> elementum magna
					</h2>
					<p>Aliquam ut ex ut augue consectetur interdum. Donec hendrerit
						imperdiet. Mauris eleifend fringilla nullam aenean mi ligula.</p>
				</div>
			</section>
			<section class="spotlight">
				<div class="image">
					<img src="images/pic03.jpg" alt="" />
				</div>
				<div class="content">
					<h2>
						Augue eleifend aliquet<br /> sed condimentum
					</h2>
					<p>Aliquam ut ex ut augue consectetur interdum. Donec hendrerit
						imperdiet. Mauris eleifend fringilla nullam aenean mi ligula.</p>
				</div>
			</section>
		</section>

		<!-- Three -->
		<section id="three" class="wrapper style3 special">
			<div class="inner">
				<header class="major">
					<h2>Accumsan mus tortor nunc aliquet</h2>
					<p>
						Aliquam ut ex ut augue consectetur interdum. Donec amet imperdiet
						eleifend<br /> fringilla tincidunt. Nullam dui leo Aenean mi
						ligula, rhoncus ullamcorper.
					</p>
				</header>
				<ul class="features">
					<li class="icon fa-paper-plane">
						<h3>Arcu accumsan</h3>
						<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris
							lorem tincidunt nullam amet leo Aenean ligula consequat
							consequat.</p>
					</li>
					<li class="icon solid fa-laptop">
						<h3>Ac Augue Eget</h3>
						<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris
							lorem tincidunt nullam amet leo Aenean ligula consequat
							consequat.</p>
					</li>
					<li class="icon solid fa-code">
						<h3>Mus Scelerisque</h3>
						<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris
							lorem tincidunt nullam amet leo Aenean ligula consequat
							consequat.</p>
					</li>
					<li class="icon solid fa-headphones-alt">
						<h3>Mauris Imperdiet</h3>
						<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris
							lorem tincidunt nullam amet leo Aenean ligula consequat
							consequat.</p>
					</li>
					<li class="icon fa-heart">
						<h3>Aenean Primis</h3>
						<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris
							lorem tincidunt nullam amet leo Aenean ligula consequat
							consequat.</p>
					</li>
					<li class="icon fa-flag">
						<h3>Tortor Ut</h3>
						<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris
							lorem tincidunt nullam amet leo Aenean ligula consequat
							consequat.</p>
					</li>
				</ul>
			</div>
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