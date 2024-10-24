<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>건의사항</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>

		<!-- Banner -->
		<section>
			<div class="inner">
				<img src="images/저탄고집v6.png" width="200px">
				<p>건의사항</p>
				<table id="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${notice}" var="notice">
							<tr>
								<td scope="row">공지</td>
								<td><a
									href="${pageContext.request.contextPath}/noticeDetailView?notiNo=${notice.notiNo}">${notice.notiTitle}</a></td>
								<td>${notice.memName}</td>
								<td>${notice.notiDate}</td>
							</tr>
						</c:forEach>
						<c:forEach items="${boardList}" var="board">
							<tr>
								<td scope="row">${board.boardNo }</td>
								<td><a
									href="${pageContext.request.contextPath}/boardDetailView?boardNo=${board.boardNo}">${board.boardTitle }</a></td>
								<td>${board.memName }</td>
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

				<c:if
					test='${sessionScope.login.memAdminYn == "Y" or 
					sessionScope.login.memAdminYn == "K"}'>
					<div class="btn">
						<a href="${pageContext.request.contextPath}/noticeWriteView">공지사항
							작성</a>
					</div>
				</c:if>

				<!-- Paging Bar -->
				<div class="d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">

							<!-- 이전 페이지 -->
							<li
								class="page-item ${pageSearch.firstPage == 1 ? 'disabled' : '' }">
								<c:if test="${searchWord == null }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/boardView?pageNo=${pageSearch.firstPage - 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
								</c:if> <c:if test="${searchWord != null }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/boardView?pageNo=${pageSearch.firstPage - 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
								</c:if>
							</li>

							<!-- 중간 페이지 번호 부분 -->
							<!-- model에 keySearch 이름으로 searchVO를 담음 -->
							<!-- searchVO 내 pageNo, firstPage, lastPage 채워져있음 -->
							<c:forEach begin="${pageSearch.firstPage }"
								end="${pageSearch.lastPage }" var="num">
								<li
									class="page-item ${PageSearch.pageNo == num ? 'active' : ''}">
									<c:if test="${pageSearch.searchWord == null }">
										<a class="page-link"
											href="${pageContext.request.contextPath }/boardView?pageNo=${num }&rowSizePerPage=${pageSearch.rowSizePerPage}">${num }</a>
									</c:if> <c:if test="${pageSearch.searchWord != null }">
										<a class="page-link"
											href="${pageContext.request.contextPath }/boardView?pageNo=${num }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}">${num }</a>
									</c:if>
								</li>
							</c:forEach>

							<!-- 다음 페이지 -->
							<!-- 마지막 페이지 도달 시 disabled 추가 -->
							<li
								class="page-item ${pageSearch.lastPage == pageSearch.totalPageCount ? 'disabled' : '' }">
								<c:if test="${pageSearch.searchWord == null }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/boardView?pageNo=${pageSearch.lastPage + 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
								</c:if> <c:if test="${pageSearch.searchWord != null }">
									<a class="page-link"
										href="${pageContext.request.contextPath }/boardView?pageNo=${pageSearch.lastPage + 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
								</c:if>
							</li>
						</ul>
					</nav>
				</div>

				<div>
					<form class="d-flex justify-content-center"
						action="${pageContext.request.contextPath }/boardView"
						method="GET">
						<select class="form-select w-25 me-1" name="searchOption">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="name">작성자</option>
						</select> <input type="text" class="form-control w-25 me-1"
							name="searchWord">
						<button class="btn btn-primary" type="submit">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
							</svg>
						</button>
					</form>
				</div>

			</div>

		</section>



		<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>