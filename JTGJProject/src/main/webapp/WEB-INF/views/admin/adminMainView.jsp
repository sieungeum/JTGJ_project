<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<title>관리자 메인 페이지</title>
	<%@ include file="/WEB-INF/inc/head.jsp"%>
	
	<style type="text/css">
		.landing{
			background-color: white;
			background-size: 100%;
		}
		
		.left-p {
			margin-left: 650px;
		}
	</style>
	
</head>
	<body class="landing is-preload">
	<!-- nav -->
	<%@ include file="/WEB-INF/inc/nav.jsp"%>
	
		<section>
			<div class="inner">
				<img src="images/저탄고집v6.png" width="200px" >
				<p>관리자 메인 페이지</p>
						
				<div>
					<a href="${pageContext.request.contextPath }/buildingView">건물 상세보기</a>
					<c:if test="${sessionScope.login.memAdminYn == 'Y'|| sessionScope.login.memAdminYn == 'K'  }">
						<a href="${pageContext.request.contextPath }/adminMemView">회원관리</a>	
					</c:if>
				</div>
							
			</div>
						
		</section>

		<%@ include file="/WEB-INF/inc/footer.jsp" %>
		
	</body>
	
	
</html>