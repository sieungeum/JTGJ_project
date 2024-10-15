<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Header -->
<header id="header" class="alt">
	<h1><a href="index.html">Spectral</a></h1>
	<nav id="nav">
		<ul>
			<li class="special">
				<a href="#menu" class="menuToggle"><span>메뉴</span></a>
				<div id="menu">
					<ul>
						<li><a href="${pageContext.request.contextPath }/home">메인화면</a></li>
						<li><a href="${pageContext.request.contextPath }/mapView">지도확인</a></li>
						<li><a href="${pageContext.request.contextPath }/calView">계산하기</a></li>
						<li><a href="${pageContext.request.contextPath }/boardView">건의사항</a></li>
						<c:if test="${sessionScope.login == null }">
							<li><a href="${pageContext.request.contextPath }/loginView">로그인/회원가입</a></li>
						</c:if>
						<c:if test="${sessionScope.login != null }">
						
							<li><a href="${pageContext.request.contextPath }/logoutDo">로그아웃</a></li>
							<li><a href="">${sessionScope.login.memName} 님</a></li>
						</c:if>
					</ul>
				</div>
			</li>
		</ul>
	</nav>
</header>