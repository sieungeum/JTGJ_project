<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<%@ include file="/WEB-INF/inc/head.jsp" %>
	<body class="landing is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<%@ include file="/WEB-INF/inc/nav.jsp" %>

				<!-- Banner -->
					<section>
						<div class="inner">
							<img src="images/저탄고집v6.png" width="200px" >
							<p>건의사항</p>
							<table id="table">
								<thead>
									<tr>
										<th scope ="col">번호</th>
										<th scope ="col">제목</th>
										<th scope ="col">작성자</th>
										<th scope ="col">날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList }" var = "board">
										<tr>
											<td scope = "row">${board.boardNo }</td>
											<td>${board.boardTitle }</td>
											<td>${board.boardName }</td>
											<td>${board.boardDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-lg-8 col-xl-7 d-flex justify-content-end">
								<a href="${pageContext.request.contextPath }/boardWriteView">
									<button class="btn btn-primary btn-xl">글쓰기</button>
								</a>
							</div>
							
						</div>
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>