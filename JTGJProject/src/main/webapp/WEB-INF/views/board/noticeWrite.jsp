<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>계산기</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<style>
div {
	margin: 0;
	padding: 0;
}

.landing {
	background-image: url("images/photovoltaic-2814504_1920.jpg");
	background-size: 100%;
}

.container {
	background-color: white;
	border-top: solid 10px #03C75A;
	border-bottom: solid 10px #03C75A;
	border-radius: 25px;
	margin-top: 200px;
	margin-bottom: 50px;
}

.container td, .container p{
	color: black;
}

.notice td{
	color:red;
	font-weight: bold;
}

.container th{
	color: black;
	font-size: 30px;
	padding-top: 20px;
}

.jemock label{
	color: black;
}

.bigBox {
	margin: auto;
	width: 90%;
}

.calculator h2, .calculator p, .calculator label {
	color: black; /* 글자 색을 검정색으로 설정 */
	margin: 0;
	padding: 0;
}

.container h2 {
	color: black; /* 글자 색을 검정색으로 설정 */
	margin: 0;
	padding: 0;
}

.col {
	color: black;
}

.title {
	font-size: 80px;
	font-weight: bold;
	padding-left: 70%;
	margin-top:50px;
	margin-bottom:50px;
}

.title p{
	color: #78D451;
	margin: 0;
	padding: 0;
}

.calculator {
	display: none; /* 기본적으로 계산기는 숨김 */
	padding-top: 50px;
	padding-bottom: 10%;
}

.box {
	color: black;
	width: 250px;
	height: 15px;
	background-color: white;
	border-color: black;
	border-radius: 25px;
	text-align: center;
}

.box2 {
	color: black;
	width: 300px;
	background-color: white;
	border-color: black;
	border-radius: 25px;
	text-align: center;
}

.coment {
	padding-left: 50%;
	font-size: 12px;
}

.coment2 {
	margin: 0;
	padding-left: 70%;
	font-size: 12px;
}

.main {
	display: flex; /* 수평으로 배치 */
	justify-content: center; /* 중앙 정렬 */
	border: solid 5px #03C75A;
	align-items: center;
	margin: auto;
	border-radius: 30px;
}

.main2 {
	display: flex;
	justify-content: center;
	border: solid 5px #03C75A;
	align-items: center;
	margin: auto;
	border-radius: 30px;
	flex-direction: column;
}

.mini {
	padding: 50px;
}

.miniEl {
	border-right: solid 1px #03C75Aff;
	padding: 50px;
}

.mini2 {
	display: flex; /* 수평으로 배치 */
	justify-content: center; /* 중앙 정렬 */
	align-items: center;
	padding: 20px;
}

.miniBox {
	padding-right: 20%;
}

.total {
	margin: auto;
	font-size: 30px;
	background-color: #03C75A;
	color: white;
	justify-content: center; /* 중앙 정렬 */
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 30px;
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0; /* 기본 여백 제거 */
}

.btn {
	background-color: #00B050;
	color: white;
}

.urlbtn {
	margin: 20px;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
}

.urlbtn button {
	background-color: #2E75B6;
}

.calbtn {
	background-color: #78D451;
	color: white;
	border-radius: 10px;
	height: 60px;
}

.calfi {
	font-size: 30px;
	font-weight: bold;
	color: aqua;
}

.btnbox {
	margin: 10px;
	padding-right: 70%;
	padding-bottom: 0;
	margin-bottom: 0;
}

.btn:hover {
	background-color: #BCCF86;
}

input::placeholder{
	color: grey !important;	
}

.jemock label{
	color: black;
}
</style>
</head>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>
			<div class="container">
			<div class="title">
				<p>공지사항</p>
			</div>
		<!-- Banner -->
		<section>
			<div class="row justify-content-center">
				<form id="contactForm"
					action="${pageContext.request.contextPath }/noticeWriteDo"
					method="POST">
					<div class="jemock mb-3">
						<label for="inputTitle">제목</label> <input class="form-control"
							id="inputTitle" type="text" name="notiTitle" />
					</div>
					<div class="mb-3">
						<textarea class="form-control" name="notiContent" rows="10"></textarea>
					</div>

					<button class="btn btn-primary btn-xl" id="submitButton"
						type="submit">등록</button>
				</form>
			</div>
		</section>
	</div>



		<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>