<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Header -->
<!-- 로고 -->
<style>
	.nav-logo{
		position: absoulte;
		
	}
	
	.nav-logo-pst{
		position: relative;
	}

	#header h2 {
		transition: opacity 0.2s ease;
		height: inherit;
		left: 0.8em;
		line-height: inherit;
		position: absolute;
		top: 0;
	}
</style>

<header id="header" class="alt nav-logo-pst">
<%-- 	<a class="nav-logo" href="${pageContext.request.contextPath }/home">
		<img class="mt-3 ms-1" src="images/저탄고집v6.png" style="width: 170px; height: 100px;">
	</a> --%>
	<h2><a href="${pageContext.request.contextPath }/">저탄고집</a></h2>
	<nav id="nav">
		<ul>
			<li class="special">
				<a href="#menu" class="menuToggle""><span>메뉴</span></a>
				<div id="menu">
					<ul>
						<li><a href="${pageContext.request.contextPath }/">메인화면</a></li>
						<!-- map view 명 나중에 바꿀 예정 -->
						<li><a href="${pageContext.request.contextPath }/mapView">지도확인</a></li>
						<li><a href="${pageContext.request.contextPath }/calView">계산하기</a></li>
						<li><a href="${pageContext.request.contextPath }/boardView">건의사항</a></li>
						<c:if test="${sessionScope.login == null }">
							<li><a href="${pageContext.request.contextPath }/loginView">로그인/회원가입</a></li>
						</c:if>
						<c:if test="${sessionScope.login != null }">
						
							<li><a href="${pageContext.request.contextPath }/logoutDo">로그아웃</a></li>
							<li><a href="${pageContext.request.contextPath }/editView">${sessionScope.login.memName} 님</a></li>
						</c:if>
						<c:if test="${sessionScope.login.memAdminYn == 'Y' || sessionScope.login.memAdminYn == 'K' }">
							<li><a href="${pageContext.request.contextPath }/chartView">관리자 페이지</a></li>
						</c:if>
					</ul>
				</div>
			</li>
		</ul>
	</nav>
</header>