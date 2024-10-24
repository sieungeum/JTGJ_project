<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Spectral by HTML5 UP</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
	<body class="landing is-preload">

		<!-- Page Wrapper -->

				<!-- Header -->
					<%@ include file="/WEB-INF/inc/nav.jsp" %>

				<!-- Banner -->
					<section>
						<div class="inner">
							<img src="images/저탄고집v6.png" width="200px" >
							<p>관리자 페이지</p>
							<p>회원관리</p>
							
							<div>
								<form class="d-flex justify-content-center" action="${pageContext.request.contextPath }/adminMemView" method="GET">						
									<select class="form-select w-25" name="searchOption">
										<option value="name" selected>이름</option>
										<option value="id">아이디</option>
										<option value="email">이메일</option>
									</select>				
									<input type="text" class="form-control w-25" name="searchWord" >
									<button class="btn btn-primary" type="submit">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
											<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
										</svg>
									</button>
								</form>
							</div>
							<table id="table">
								<thead>
									<tr>
										<th scope ="col">아이디</th>
										<th scope ="col">이름</th>
										<th scope ="col">이메일</th>
										<th scope ="col">가입일</th>
										<th scope ="col">탈퇴 여부</th>
										<th scope ="col">관리자 권한</th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach items="${AdminMemList }" var = "adminMem">
										<tr>
											<td scope = "row">${adminMem.memId }</td>
											<td>${adminMem.memName }</td>
											<td>${adminMem.memEmail }  </td>
											<td>${adminMem.memDate }</td>
											<td>${adminMem.memCerYn }</td>
											<td>
												<c:if test="${adminMem.memAdminYn == 'N'}">
													<c:if test="${sessionScope.login.memAdminYn == 'Y' || sessionScope.login.memAdminYn == 'K' }">
														<form action="${pageContext.request.contextPath }/adminMemDo" method="POST">
															<input type="hidden" name="memId" value="${adminMem.memId}">
															<input type="hidden" name="memName" value="${adminMem.memName}">
														    <button class="btn btn-primary btn-xl" type="submit">일반 회원</button>
														</form>
													</c:if>
												</c:if>
												<c:if test="${adminMem.memAdminYn == 'K'}">
													<form action="${pageContext.request.contextPath }/adminMemDelDo" method="POST">
														<input type="hidden" name="memId" value="${adminMem.memId}">
														<input type="hidden" name="memName" value="${adminMem.memName}">
														<c:if test="${sessionScope.login.memAdminYn == 'Y' }">
														    <button class="btn btn-primary btn-xl" type="submit">관리자</button>
														</c:if>
															<c:if test="${sessionScope.login.memAdminYn == 'K' }">
														    <button class="btn btn-primary btn-xl" type="submit" disabled="disabled">관리자</button>
														</c:if>
													</form>
												</c:if>
												<c:if test="${adminMem.memAdminYn == 'Y'}">
													<button class="btn btn-primary btn-xl" disabled="disabled">총괄 관리자</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
						</div>
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	
	</body>
</html>
