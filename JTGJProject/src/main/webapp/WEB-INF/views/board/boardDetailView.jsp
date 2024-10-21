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
													<c:if test="${com.memId == sessionScope.login.memId}">
														<td><a onclick="f_del(this)">X</a> </td>
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
		
		const v_comBtn = document.getElementById("comBtn")
		const v_comForm = document.getElementById("comForm")
		
		v_comBtn.addEventListener("click", ()=>{
			let v_comForm = $('#comForm');
			let v_url = v_comForm.attr('action');
			let v_formData = v_comForm.serialize();
			
			$.ajax({
				type: 'POST',
				url: v_url,
				data: v_formData,
				success: function(data){
					console.log(data);
					
					let v_tr = document.createElement("tr");
					v_tr.id = data.comNo;
					
					let tdContent = document.createElement("td");
					tdContent.innerHTML = data.comContent;
					v_tr.appendChild(tdContent);
					
					let tdMemName = document.createElement("td");
					tdMemName.innerHTML = data.memName;
					v_tr.appendChild(tdMemName);
					
					let tdDate = document.createElement("td");
					tdDate.innerHTML = data.comDate;
					v_tr.appendChild(tdDate);
					
					let tdDel = document.createElement("td");
					tdDel.innerHTML = "<a onclick='f_del(this)'>X</a>";
					v_tr.appendChild(tdDel);
					
					document.getElementById("comBody").prepend(v_tr);
					document.getElementById("comInput").value = "";
				}
			});
		});
		
		function f_del(p_this){
			if(!confirm("댓글을 삭제하시겠습니까?")){
				return;
			}
			
			let v_td = p_this.parentElement;
			let v_tr = v_td.parentElement;
			let v_comNo = v_tr.id;
			
			const v_ajax = new XMLHttpRequest();
			
			v_ajax.open('POST', '<c:url value="/delComDo"/>');
			
			v_ajax.setRequestHeader("Content-Type", "application/json");
			
			const v_data = {
					'comNo' : v_comNo
			};
			
			v_ajax.onload = () => {
				if(v_ajax.status == 200){
					console.log(v_ajax.response);
					
					if(v_ajax.response == 'success'){
						document.getElementById(v_comNo).remove();
					}
				}
			};
			v_ajax.send(JSON.stringify(v_data));
		}
	</script>
	</body>
</html>