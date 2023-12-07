<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/member.css">
</head>
<body>
	<div class="container">
		<div align="center">
			<a href="/evo/" class="title">evo</a>
			<div class="nfont" id="login" align="right">
				<a href="login">Login</a>
			</div>
		</div>
		<hr/>
		<div>
			<jsp:include page="${cp }"/>
		</div>
		<hr class="footerHr"/>
		<div class="footer" align="center">
			evo <p>
			문의 : 0000 - 0000
		</div>
	</div>
</body>
</html>