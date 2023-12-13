<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center" class="title" id="tTitle">Login</div>
	<form id="login_page" action="member.login" method="post">
		<div align="center" class="lDiv">
			<input name="m_id" placeholder="ID">
			<p>
		</div>
		<div align="center" class="lDiv">
			<input id="m_password" name="m_password" placeholder="PW"
				type="password">
			<p>
			<div style="color: red;">
				<p>${r}</p>
			</div>
		</div>
		<div align="center" class="lBtn">
			<button class="btn-black" name="loginbtn" id="blogin">Login</button>
		</div>
	</form>
	<div class="searchIW" align="center">
		<a href="" class="nfont"> 아이디 찾기</a> <a href="" class="nfont">비밀번호
			찾기</a>
		<p>
	</div>
	<div align="center">
		<a href="member.signup.go" id="signupA"> 아직 회원이 아니신가요? </a>
	</div>




</body>
</html>