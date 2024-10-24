<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>로그인 페이지</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<style>

	.landing{
		background-image: url("images/로그인_배경2.jpg");
		background-size: 100%;
	}

	.left-p {
		margin-left: 650px;
	}
	
	.container {
		width: 600px;
		margin: auto;
		padding-top: 150px;
	}
	
	.input-container {
		padding: 20px;
		border-radius: 10px;
		border: 3px solid white;
		width: 100%;
		background-color: #868296;
		opacity: 0.8;
	}
	
	.title {
		font-size: 40px;
		display: flex;
		justify-content: center;
		align-content: center;
		font-weight: 700;
		color: white;
		margin-bottom: 30px;
	}
	
	.input-box {
		border-radius: 10px;
		border: 3px solid white;
		display: flex;
		flex-direction: column;
	}
	
	.input-box input {
		border: 0;
		outline: none;
		font-size: 16px;
	}
	
	.input-box hr {
		border: 1px solid white;
		margin: 0;
	}
	
	.input-box>div {
		padding: 10px;
	}
	
	.btn-box {
		display: flex;
		justify-content: center;
		width: 100%;
		margin-top: 15px;
		margin-bottom: 10px;
	}
	
	.btn-ihs {
		background-color: rgb(3, 199, 90);
		color: white;
		font-weight: bold;
		border-radius: 10px;
		width: 100%;
	}
	
	.a-box {
		display: flex;
		justify-content: flex-end;
		align-items: center;
		margin-top: 20px;
		margin-bottom: 120px;
	}
	
	.rightS {
		margin-right: 30px;
		color: white;
		font-weight: 600;
	}
</style>
</head>
<body class="landing is-preload">

	<%@ include file="/WEB-INF/inc/nav.jsp"%>
	<div id="page-wrapper">
		<section>
	
			<div class="container ">
				<span class="title">로그인</span>
				<form action="${pageContext.request.contextPath }/loginDo"
					method="POST">
					<div class="input-container">
						<div class="input-box">
							<div>
								<input type="text" name="memId" id="inputId" value=""
									placeholder="아이디" />
							</div>
							<hr>
							<div>
								<input type="password" name="memPw" id="inputpassword" value=""
									placeholder="비밀번호" />
							</div>
						</div>
	
						<div class="btn-box">
							<button class="btn-ihs" id="submitBtn" type="submit">로그인</button>
						</div>
			
					</div>
					
					<div class="a-box">
						<a class=rightS href="${pageContext.request.contextPath }/home">홈으로돌아가기</a> 
						<a class=rightS href="${pageContext.request.contextPath }/registView"> 회원가입</a>
					</div>
					
				</form>
				
				
			</div>
		</section>
		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>

</body>
</html>