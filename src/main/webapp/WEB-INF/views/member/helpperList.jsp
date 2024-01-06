<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Board</h1>
	<table border="1">
		<tr>
			<th width="200px">글 번호</th>
			<th width="200px">글 제목</th>
			<th width="200px">작성자</th>
		</tr>
	</table>
	<table class="boardTbl" style="cursor: pointer;">
		<tr>
			<td width="200px" align="center">11111</td>
			<td width="200px" align="center">Title</td>
			<td width="200px" align="center">Writer</td>
		</tr>
		<tr>
			<td colspan="3"><div class="boardDiv"></div></td>
		</tr>
	</table>
	<table class="boardTbl" style="cursor: pointer;">
		<tr>
			<td width="200px" align="center">22222</td>
			<td width="200px" align="center">Title</td>
			<td width="200px" align="center">Writer</td>
		</tr>
		<tr>
			<td colspan="3"><div class="boardDiv"></div></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td colspan="2"><input></td>
			<td><button>검색</button></td>
		</tr>
	</table>
</body>
</html>