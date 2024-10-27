<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>글상세보기</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<style>
.btn{
	border: #00B050 solid 1px;
}
div {
	margin: 0;
	padding: 0;
}

.landing {
	background-image: url("images/photovoltaic-2814504_1920.jpg");
	background-size: 100%;
}

.container {
	background-color: white;
	border-top: solid 10px #03C75A;
	border-bottom: solid 10px #03C75A;
	border-radius: 25px;
	margin-top: 200px;
	margin-bottom: 50px;
	width: 75%;
}

.container td, .container p, .container a {
	color: black;
}

.container h6 {
	color: black;
}

.container pre {
	color: black;
}

.notice td {
	color: red;
	font-weight: bold;
}

.container th {
	color: black;
	font-size: 30px;
	padding-top: 20px;
}

.bigBox {
	margin: auto;
	width: 80%;
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
	padding-left: 65%;
	margin-top: 50px;
	margin-bottom: 50px;
}

.title p {
	border-bottom: solid 10px #03C75A;
	color: #78D451;
	padding: 0;
	margin: 0;
	padding-bottom: 40px
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
}

.btn:hover {
	background-color: #BCCF86;
}

.dtitle h6 {
	margin: 0;
}

.dtitle {
	padding-left: 10px;
	font-size: 70px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.mtitle {
	padding-left: 10px;
	border-bottom: solid 3px #03C75A;
	font-size: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-top: 10px;
}

.content {
	margin: 30px;
}

.file {
	width: 60%;
}
.file a{
	background-color: rgba(3, 199, 90, 0.5);
	
}

.file:hover{
	color: red;
	font-weight: bold;
}

.com input {
	width:60%;
	color: black;
	border: solid 1px black;
	margin-right: 20px;
}

.combox {
	margin-top: 20px;
}

.btnbox {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}


.com {
	display: flex; /* Flexbox 활성화 */
	align-items: center;
}

input::placeholder {
	color: grey !important;
}

.jemock label, .jemock input{
	color:black;'
}
</style>
</head>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/inc/nav.jsp"%>

		<!-- 메인 -->
		<div class="container">
			<div class="title">
				<p>건의사항</p>
			</div>
			<div class="bigBox">
				<section>
					<div class="dtitle">
						<h6>${board.boardTitle}</h6>
					</div>
						<div class="mtitle">
							<h6>${board.memName}</h6>
							<h6>${board.boardDate}</h6>
						</div>


					<div class="content">
						<pre>${board.boardContent}</pre>
					</div>


					<!-- 파일 -->
					<div class="file mb-3 d-flex" style="margin-top: 100px">
						<c:forEach items="${attachList }" var="attach">
							<div style="color: black;">첨부파일:
								<a
									href="<c:url value="/filedownload?fileName=${attach.boardFileName }&fileOriName=${attach.boardFileOriginalName}"/>">
									 ${attach.boardFileOriginalName } (${attach.boardFileFancySize })
								</a>
							</div>
						</c:forEach>
					</div>

					<c:if test="${board.memId == sessionScope.login.memId }">
						<div>
							<div class="btnbox">
								<form action="${pageContext.request.contextPath }/boardEditView"
									method="POST">
									<input type="hidden" value="${board.boardNo }" name="boardNo">
									<button class="btn btn-warning me-2" type="submit">수정</button>
								</form>
								<form action="${pageContext.request.contextPath }/boardDeleteDo"
									method="POST" id="deleteForm">
									<input type="hidden" value="${board.boardNo }" name="boardNo">
									<button class="btn btn-danger me-2" type="button"
										id="deleteBtn">삭제</button>
								</form>
							</div>
						</div>
					</c:if>

					<!-- 댓글 목록 -->
					<div class="combox">
						<span style="color: black;">댓글</span>
						<div style="border-top: solid 3px #03C75A;">
							<table>
								<tbody id="comBody">
									<c:forEach items="${comList }" var="com">
										<tr id="${com.comNo }">
											<td>${com.comContent }</td>
											<td>${com.memName }</td>
											<td>${com.comDate }</td>
											<c:if test="${com.memId == sessionScope.login.memId}">
												<td><a onclick="f_del(this)">X</a></td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 댓글 작성 영역 -->
						<div>
							<div class="writecom">
								<form id="comForm"
									action="${pageContext.request.contextPath }/writeComDo"
									method="POST">
									<div class="com">
										<input type="text" id="comInput" name="comContent"
											placeholder="댓글 작성"> <input type="hidden"
											name="memId" value="${sessionScope.login.memId }"> <input
											type="hidden" name="boardNo" value="${board.boardNo }">
										<button class="btn btn-warning me-2" type="button" id="comBtn">등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
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