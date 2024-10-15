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
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>첫글</td>
										<td>이주형</td>
										<td>2024-10-14 16:37</td>
									</tr>
									<tr>
										<td>1</td>
										<td>첫글</td>
										<td>이주형</td>
										<td>2024-10-14 16:37</td>
									</tr>
									<tr>
										<td>1</td>
										<td>첫글</td>
										<td>이주형</td>
										<td>2024-10-14 16:37</td>
									</tr>
								</tbody>
							</table>
						</div>
						
					</section>

				

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	</body>
</html>