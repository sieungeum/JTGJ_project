<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header id="header" class="alt">
						<h1><a href="${pageContext.request.contextPath }/home">저탄고집</a></h1>
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
                        						<li><a href="${pageContext.request.contextPath }/registView">로그인/회원가입</a></li>
                        					</c:if>
                        					
                        					<c:if test="${sessionScope.login != null }">
                        						<li><a href="${pageContext.request.contextPath }/memView">${sessionScope.login.getMemName() }님</a></li>
                        						<li><a href="${pageContext.request.contextPath }/logoutDo">">로그아웃</a></li>
                        					</c:if>
                        					
                        					<%-- 
                        					<c:if test="${sessionScope.login != master }">
                        						<li><a href="${pageContext.request.contextPath }/masterView">관리자 페이지</a></li>
                        					</c:if> 
                        					--%>
                        					
										</ul>
										<img alt="" src="images/solar-panel-303455_1280.png">
									</div>
								</li>
							</ul>
						</nav>
					</header>