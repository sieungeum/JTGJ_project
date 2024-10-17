<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<div class="row justify-content-center">
					<img src="images/저탄고집v6.png" width="200px" >
							<p>건의사항</p>
							<div class="mb-3">
								<h6>${board.boardTitle}</h6>
							</div>
							<div>
								<h6>${board.memName}</h6>
								<h6>${board.boardDate}</h6>
							</div>
							<div class="mb-3">
								<pre>${board.boardContent}</pre>
							</div>
						</div>
							<c:if test="${board.memId == sessionScope.login.memId }">
							<div>
								<div>
									<form action="${pageContext.request.contextPath }/boardEditView" method="POST">
										<input type="hidden" value="${board.boardNo }" name="boardNo">
										<button class="btn btn-warning me-2" type="submit">수정</button>
									</form>
									<form action="${pageContext.request.contextPath }/boardDeleteDo" method="POST" id="deleteForm">
										<input type="hidden" value="${board.boardNo }" name="boardNo">
										<button class="btn btn-danger me-2" type="button" id="deleteBtn">삭제</button>
									</form>
								</div>
							</div>
							</c:if>
							
							<!-- 댓글 목록 -->
							<div>
								<div>
									<table>
										<tbody>
											<c:forEach items="${comList }" var="com">
												<tr id="${com.comNo }">
													<td>${com.comContent }</td>
													<td>${com.memName }</td>
													<td>${com.comDate }</td>
													<c:if test="${com.memId == session.login.memId}">
														<td> <a onclick="f_del(this)">X</a> </td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- 댓글 작성 영역 -->
								<div>
									<div>
										<form id="comForm" action="${pageContext.request.contextPath }/writeComDo" method="POST">
											<div>
												<input type="text" id="comInput" name="comContent">
												<input type="hidden" name="memId" value="${sessionScope.login.memId }">
												<input type="hidden" name="boardNo" value="${board.boardNo }">
											</div>
											<div>
												<button class="btn btn-warning me-2" type="button" id="comBtn">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
					</section>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	<script type="text/javascript">
		const v_btn = document.getElementById("deleteBtn");
		const v_form = document.getElementById("deleteForm");
		
		v_btn.addEventListener("click", ()=>{
			if(confirm('정말로 삭제하시겠습니까?')){
				v_form.submit();
			}
		});
		 
		
	</script>
	</body>
</html>