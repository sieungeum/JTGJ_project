<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
	<title>회원관리</title>
	<%@ include file="/WEB-INF/inc/head.jsp"%>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<style>
	.btn{
		border: #00B050 solid 1px;
	}
	div {
		margin: 0;
		padding: 0;
	}
	
	.landing {
		background-image: url("images/관리자_회원페이지.jpg");
		background-size: 100%;
	}
	
	.container {
		background-color: white;
		border-top: solid 10px #03C75A;
		border-bottom: solid 10px #03C75A;
		border-radius: 25px;
	}
	
	.container td{
		color: black;
	}
	
	.container p {
		color: rgb(3, 199, 90);
		font-size: 45px;
		font-weight: 700;
		margin-top: 40px;
		
	}
	
	.sor {
		display: flex;
		justify-content: space-between;
		align-items: center
	}
	
	.notice td{
		color:red;
		font-weight: bold;
	}
	
	.container th{
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
		color: #78D451;
		font-size: 80px;
		font-weight: bold;
		margin: auto;
		margin-bottom: 0;
		padding-left: 70%;
		text-shadow: -1px -1px 0 black, 1px -1px 0 black, -1px 1px 0 black, 1px
			1px 0 black;
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
	
	.selectLong {
		width: 130px;
	}
	
	.th-size th {
		font-size: 20px;
	}
	
	.td-size td{
		font-size: 20px;
	}
	
	.mar-top {
		margin-top: 200px;
	}
	
	.width-m{
		width: 300px;
	}
	
	
	</style>
	
	</head>
	<body class="landing is-preload">
	
		<%@ include file="/WEB-INF/inc/nav.jsp" %>

		<section class="mar-top">
			<div class="inner">
				
				<div class="container">
					<div class="sor">
						<p>회원관리</p>
						<form class="d-flex justify-content-center" action="${pageContext.request.contextPath }/adminMemView" method="GET">						
							<select class="form-select w-50" name="searchOption">
								<option value="name" selected>이름</option>
								<option value="id">아이디</option>
								<option value="email">이메일</option>
							</select>				
							<input type="text" class="form-control w-150" name="searchWord" >
							<button class="btn btn-primary d-flex justify-content-center align-items-center"  type="submit" style="height:44px;">
								<i class="fa-solid fa-magnifying-glass fa-2xl" ></i>
							</button>
						</form>
					</div>
					
					<div class="d-flex justify-content-end">
						<a class="btn-ihs" href="${pageContext.request.contextPath }/adminMainView">
							<button class="btn btn-primary btn-xl"> 관리자 메인 페이지로 </button>
						</a>
					</div>
					
					<table id="table">
						<thead>
							<tr class="th-size">
								<th scope ="col" style="text-align: center;">아이디</th>
								<th scope ="col" style="text-align: center;">이름</th>
								<th scope ="col" style="text-align: center;">이메일</th>
								<th scope ="col" style="text-align: center;">가입일</th>
								<th scope ="col" style="text-align: center;">탈퇴 여부</th>
								<th scope ="col" style="text-align: center;">관리자 권한</th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${AdminMemList }" var = "adminMem">
								<tr>
									<td scope = "row" style="text-align: center;">${adminMem.memId }</td>
									<td style="text-align: center;">${adminMem.memName }</td>
									<td style="text-align: center;">${adminMem.memEmail }  </td>
									<td style="text-align: center;">${adminMem.memDate }</td>
									<td style="text-align: center;">${adminMem.memCerYn }</td>
									<td style="text-align: center;">
										<c:if test="${adminMem.memAdminYn == 'N'}">
											<c:if test="${sessionScope.login.memAdminYn == 'Y' || sessionScope.login.memAdminYn == 'K' }">
												<form action="${pageContext.request.contextPath }/adminMemDo" method="POST" id="checkFormB">
													<input type="hidden" name="memId" value="${adminMem.memId}">
													<input type="hidden" name="memName" value="${adminMem.memName}">
												    <c:if test="${sessionScope.login.memAdminYn == 'Y' }">
												    	<button class="btn btn-primary btn-xl" id="checkBtnB" type="button">일반회원</button>
													</c:if>
													<c:if test="${sessionScope.login.memAdminYn == 'K' }">
													    <button class="btn btn-primary btn-xl" type="submit" disabled="disabled">일반회원</button>
													</c:if>
												</form>
											</c:if>
										</c:if>
										<c:if test="${adminMem.memAdminYn == 'K'}">
											<form action="${pageContext.request.contextPath }/adminMemDelDo" method="POST" id="checkFormA">
												<input type="hidden" name="memId" value="${adminMem.memId}">
												<input type="hidden" name="memName" value="${adminMem.memName}">
												<c:if test="${sessionScope.login.memAdminYn == 'Y' }">
												    <button class="btn btn-primary btn-xl" id="checkBtnA" type="button">관리자</button>
												</c:if>
												<c:if test="${sessionScope.login.memAdminYn == 'K' }">
												    <button class="btn btn-primary btn-xl" type="button" disabled="disabled">관리자</button>
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
				
			</div>
			
		</section>

					
	
		<%@ include file="/WEB-INF/inc/footer.jsp" %>
		
		<script type="text/javascript">
			
			const v_btnA = document.getElementById("checkBtnA");
			const v_formA = document.getElementById("checkFormA");
			
			v_btnA.addEventListener("click", ()=>{
				if(confirm('정말로 권한을 강등 시키겠습니까?')){
					v_formA.submit();
				}
			});
			
			const v_btnB = document.getElementById("checkBtnB");
			const v_formB = document.getElementById("checkFormB");
			
			v_btnB.addEventListener("click", ()=>{
				if(confirm('정말로 권한을 승급 시키겠습니까?')){
					v_formB.submit();
				}
			});
		
		</script>

	
	</body>
</html>
