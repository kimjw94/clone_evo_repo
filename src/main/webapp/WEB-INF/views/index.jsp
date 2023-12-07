<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home.css">
</head>
<body>
	<div class="container">
		<div align="center">
			<a href="" class="title">evo</a>
			<div class="login" align="right">
				<a href="login">Login</a>
			</div>
		</div>
		<hr/>
		<div>
			<jsp:include page="${cp }"/>
		</div>
	</div>
</body>
</html>