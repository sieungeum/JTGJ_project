<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Elements - Spectral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css" />

	
		<!-- Header -->
		<%@ include file="/WEB-INF/inc/head.jsp" %>				
		<style>

			.left-p {
				margin-left:650px;
			}
			
			.container {
	            width: 500px;
	            margin: auto;
	            padding-top: 150px;
	        }
	
	        h2 {
	        	color: white;
	            
	            
	            text-align: center;
	        }
	
	        .input-container {
	            padding: 20px;
	            border-radius: 10px;
	            border: 1px solid white;
	            
	            width: 100%;
	        }
	
	        .input-box {
	            border-radius: 10px;
	            border: 1px solid white;
	            display: flex;
	           	flex-direction: column;
	            
	        }
	
	        .input-box input {
	            border: 0;
	            outline: none;
	            font-size: 16px;
	        }
	
	        .input-box hr {
	            border: 1px solid white;
	            margin: 0;
	        }
	
	        .input-box>div {
	            padding: 10px;
	        }
	        
	        .btn-box {
	        	display: flex;
	        	justify-content: center;
	        	width:100%;
	        	margin-top: 15px;
	        }
	
	        .btn-ihs {
	            background-color: rgb(3, 199, 90);
	            color: white;
	            font-weight: bold;
	            border-radius: 10px;
	            width:100%;
	            

	        }
	        
	        .rightS {
	        	margin-right: 30px;
	        	color: white;
	        }
	        
	        
		</style>
	</head>
	<body class="is-preload">
		
		<%@ include file="/WEB-INF/inc/nav.jsp" %>
		
					<section>
							
						<div class="container ">
					        <h2>로그인</h2>
					        <form action="${pageContext.request.contextPath }/loginDo" method="POST">
						        <div class="input-container">
						            <div class="input-box">
						                <div>
						                    <input type="text" name="memId" id="inputId" value="" placeholder="아이디" />
						                </div>
						                <hr>
						                <div>
						                    <input type="password" name="memPw" id="inputpassword" value="" placeholder="비밀번호" />
						                </div>
						            </div>
						            
						            <div class="btn-box">
						            	<button class="btn-ihs" id="submitBtn" type="submit">로그인</button>
						            </div>
									
						        </div>
					        </form>
					        <a class= rightS href="${pageContext.request.contextPath }/home">홈으로 돌아가기</a>
					       
							<a class= rightS href="${pageContext.request.contextPath }/registView">  회원가입</a>
							
					    </div>
					</section>
		<%@ include file="/WEB-INF/inc/footer.jsp" %>
								
	</body>
</html>