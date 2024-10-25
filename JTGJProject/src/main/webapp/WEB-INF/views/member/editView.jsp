<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>회원수정</title>
		<%@ include file="/WEB-INF/inc/head.jsp"%>
		
		<style>
			.landing{
				background-image: url("images/회원수정_페이지.jpg");
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
				border: 3px solid #ced4da;
				width: 100%;
				background-color: #f3f1f5;
				opacity: 0.95;
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
				
				display: flex;
				flex-direction: column;
			}
			
			.input-box input {
				border: 0;
				outline: none;
				font-size: 16px;
			}
			
			.input-box hr {
				
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
				color: #212529;
				font-weight: bold;
				border-radius: 10px;
				width: 100%;
			}
			
			.a-box {
				display: flex;
				justify-content: center;
				align-items: center;
				margin-top: 20px;
				margin-bottom: 120px;
			}
			
			.rightS {
				margin-right: 30px;
				color: white;
				font-weight: 600;
			}
			
			.label-c span {
				margin-bottom: 8px;
				margin-top: 8px; 
				margin-left: 3px; 
				color: #212529;
				font-weight: 600;
			}
			
			input::placeholder {
			 	color: red;
			}
						
			input::-webkit-input-placeholder{
			 	color: red;
			}

		</style>
	</head>
	
	<body class="landing is-preload">
	
		<!-- nav -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>
		<div id="page-wrapper">
			<section>
		
				<div class="container ">
					<span class="title">회원수정</span>
					<form action="$${pageContext.request.contextPath }/editDo" method="POST">
						<div class="input-container">
							<div class="input-box">
								<div class="label-c">
									<span name="memId">아이디(수정불가)</span>
									<input type="text" name="memId" id="inputId" value="${sessionScope.login.memId}" readonly />
								</div>
								<hr>
								<div class="label-c">
									<span name="memPw">비밀번호</span>
									<input type="password" name="memPw" id="inputpassword" value="${sessionScope.login.memPw}" />
								</div>
								<hr>
								<div class="label-c">
									<span name="memName">이름</span>
									<input type="text" name="memName" id="inputName" value="${sessionScope.login.memName}" />
								</div>
								<hr>
								<div class="label-c">
									<span name="memEmail">이메일</span>
									<input type="text" name="memEmail" id="inputEmail" value="${sessionScope.login.memEmail}" />
								</div>
							</div>
		
							<div class="btn-box">
								<button class="btn-ihs" id="submitBtn" type="submit">회원수정</button>
							</div>
				
						</div>
						
						<div class="a-box">
							<a class=rightS href="${pageContext.request.contextPath }/home"> 홈으로 돌아가기</a>
						</div>
						
					</form>
					
				</div>
			</section>
			<%@ include file="/WEB-INF/inc/footer.jsp"%>
		</div>
	
	</body>
</html>