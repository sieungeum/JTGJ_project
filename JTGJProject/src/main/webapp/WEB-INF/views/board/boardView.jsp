<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>건의사항</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<style>
div {
	margin: 0;
	padding: 0;
}

.landing {
	background-image: url("images/cloudy-4374619_1280.jpg");
	background-size: 100%;
}

.container {
	background-color: white;
	border-top: solid 10px #03C75A;
	border-bottom: solid 10px #03C75A;
	border-radius: 25px;
	margin-top: 200px;
	margin-bottom: 50px;
}

.container td, .container p {
	color: black;
}

.notice td {
	color: #3F48CC;
	font-weight: bold;
}

.noticegong {
	border-left: solid 10px #03C75A;
}

.container th {
	color: black;
	font-size: 30px;
	padding-top: 20px;
}

.bigBox {
	margin: auto;
	width: 90%;
}

.calculator h2, .calculator p, .calculator label {
	color: black; /* 글자 색을 검정색으로 설정 */
	margin: 0;
	padding: 0;
}

.container h2 {
	color: black; /* 글자 색을 검정색으로 설정 */
	margin: 0;
	padding: 0;
}

.col {
	color: black;
}

.title {
	font-size: 80px;
	font-weight: bold;
	padding-left: 70%;
	margin-top: 50px;
	margin-bottom: 50px;
}

.title p {
	color: #78D451;
	margin: 0;
	padding: 0;
}

.calculator {
	display: none; /* 기본적으로 계산기는 숨김 */
	padding-top: 50px;
	padding-bottom: 10%;
}

.box {
	color: black;
	width: 250px;
	height: 15px;
	background-color: white;
	border-color: black;
	border-radius: 25px;
	text-align: center;
}

.box2 {
	color: black;
	width: 300px;
	background-color: white;
	border-color: black;
	border-radius: 25px;
	text-align: center;
}

.coment {
	padding-left: 50%;
	font-size: 12px;
}

.coment2 {
	margin: 0;
	padding-left: 70%;
	font-size: 12px;
}

.main {
	display: flex; /* 수평으로 배치 */
	justify-content: center; /* 중앙 정렬 */
	border: solid 5px #03C75A;
	align-items: center;
	margin: auto;
	border-radius: 30px;
}

.main2 {
	display: flex;
	justify-content: center;
	border: solid 5px #03C75A;
	align-items: center;
	margin: auto;
	border-radius: 30px;
	flex-direction: column;
}

.mini {
	padding: 50px;
}

.miniEl {
	border-right: solid 1px #03C75Aff;
	padding: 50px;
}

.mini2 {
	display: flex; /* 수평으로 배치 */
	justify-content: center; /* 중앙 정렬 */
	align-items: center;
	padding: 20px;
}

.miniBox {
	padding-right: 20%;
}

.total {
	margin: auto;
	font-size: 30px;
	background-color: #03C75A;
	color: white;
	justify-content: center; /* 중앙 정렬 */
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 30px;
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0; /* 기본 여백 제거 */
}

.btn {
	background-color: #00B050;
	color: white;
}

.urlbtn {
	margin: 20px;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
}

.urlbtn button {
	background-color: #2E75B6;
}

.calbtn {
	background-color: #78D451;
	color: white;
	border-radius: 10px;
	height: 60px;
}

.calfi {
	font-size: 30px;
	font-weight: bold;
	color: aqua;
}

.btnbox {
	margin: 10px;
	padding-right: 70%;
	padding-bottom: 0;
	margin-bottom: 0;
}

.btn:hover {
	background-color: #BCCF86;
}

.createBtn {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}
</style>
</head>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>
		<div class="container">
			<div class="title">
				<p>건의사항</p>
			</div>
			<!-- Banner -->
			<section>
				<div class="inner">
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
								<tr class="notice">
									<td class="noticegong" scope="row">공지</td>
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
					<div class="createBtn">
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
					</div>
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
									<li class="page-item ${PageSearch.pageNo == num ? 'active' : ''}">
										<c:if test="${pageSearch.searchWord == null }">
											<a class="page-link" href="${pageContext.request.contextPath }/boardView?pageNo=${num }&rowSizePerPage=${pageSearch.rowSizePerPage}">${num }</a>
										</c:if> <c:if test="${pageSearch.searchWord != null }">
											<a class="page-link" href="${pageContext.request.contextPath }/boardView?pageNo=${num }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}">${num }</a>
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
		</div>

		</section>



		<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>