<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="member.searchId" method="post">
		<table align="center" class="m_signup">
			<tr>
				<td class="title" id="tTitle" align="center" colspan="4">
					FindId</td>
			</tr>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" id="m_name" name="m_name"></td>
			</tr>
			<tr>
				<td><label>연락처</label></td>
				<td><input type="text" id="m_phone" name="m_phone"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button class="btn-black">찾기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>