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