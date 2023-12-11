<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/product.css">
</head>
<body>
	<div class="container">
		<div class="nfont" align="right" id="loginA">
			<c:choose>
				<c:when test="${sessionScope.loginMember.m_id == null }">
					<a href="login">Login</a>
				</c:when>
				<c:otherwise>
					<a href="member.logout">Logout</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div align="center">
			<div align="center">
				<a href="/evo/" class="title">evo</a>
			</div>
			<div class="nfont" align="right">
				<c:if test="${sessionScope.loginMember.m_id != null }">
					<a href="myPage">${sessionScope.loginMember.m_alias }님 환영합니다.</a>
				</c:if>
			</div>
			
		</div>
		<hr />
		<div>
			<jsp:include page="${cp }" />
		</div>
		<hr class="footerHr" />
		<div class="footer" align="center">
			evo
			<p>문의 : 0000 - 0000
		</div>
	</div>
</body>
</html>
