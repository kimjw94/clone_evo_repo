<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/go.js"></script>
<link rel="stylesheet" href="resources/css/member.css">
</head>
<body>
	<div align="center" class="title" id="tTitle"> Signup</div>

	<div align="center" class="nfont">
			EVO 에 오신 것을 환영합니다.<br> 지금 회원 가입하신 후 EVO를 통해 멋쟁이가 됩시다!
	</div>
	<div class="bContainer">
		<div class="lBtn" align="center" id="buyer">
			<button onclick="goBuyerSignUp()" id="BuyerSignUpBtn" class="btn-black">
				구매자 
			</button>
		</div>
		<div class="lBtn" align="center" id="seller">
			<button onclick="goSellerSignUp()" id="SellerSignUpBtn" class="btn-black">
				판매자
			</button>
		</div>
	</div>
	


</body>
</html>