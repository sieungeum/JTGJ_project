<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<title>관리자 메인 페이지</title>
	<%@ include file="/WEB-INF/inc/head.jsp"%>
	
	<style type="text/css">
		.landing{
			background-image: url("images/관리자_메인페이지.jpg");
			background-size: 100%;
		}
		
		.left-p {
			margin-left: 650px;
		}
		
		.inner {
			margin-top: 200px;
			height: 500px;
		}
		
		.inner p {
			color: rgb(3, 199, 90);
			font-size: 40px;
			font-weight: 600;
			margin-bottom: 150px;
		}
		
		.inner a  {
			color: black;
			margin-right: 100px;
			font-size: 24px;
		}
		
		.inner-f {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.btn-ihs {
			background-color: rgb(3, 199, 90);
			color: #212529;
			font-weight: bold;
			border-radius: 10px;
			width: 15%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
	</style>
	
</head>
	<body class="landing is-preload">
	<!-- nav -->
	<%@ include file="/WEB-INF/inc/nav.jsp"%>
	
		<section>
			<div class="inner">
				<p>관리자 메인 페이지</p>
						
				<div class="inner-f">
					<a class="btn-ihs" href="${pageContext.request.contextPath }/buildingView">건물 상세보기</a>
					<c:if test="${sessionScope.login.memAdminYn == 'Y' }">
						<a class="btn-ihs" href="${pageContext.request.contextPath }/adminMemView">회원관리</a>	
					</c:if>
					<a class="btn-ihs" href="">차트보기</a>
				</div>
							
			</div>
						
		</section>

		<%@ include file="/WEB-INF/inc/footer.jsp" %>
		
	</body>
	
	
</html>