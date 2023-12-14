<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="searchResult" >
		<table align="center">
			<tr>
				<td colspan="3" align="center" id="tTitle" class="nfont">회원정보</td>
			</tr>
			<tr align="center" class="sfont">
				<c:if test="${sessionScope.foundMember != null }">
					<td>ID : ${foundMember.m_id}</td>
				</c:if>
				<c:if test="${sessionScope.foundMember2 != null }">
					<td>PW : ${foundMember2.m_password}</td>
				</c:if>
				<td>${r }<td>
			</tr>
		</table>
	</form>
</body>
</html>