<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function clickshow(id) {
		var menu = id.replace(/[^0-9]/g, "");
		var aId = document.getElementById("a" + menu);
		
		if(aId.style.display == "none") {
			console.log("들어왔지롱");
			aId.style.display = "flex";
		} else {
			aId.style.display = "none";
		}
	}
</script>
<body>
	<div>
		<div class="nfont" id="fTitle" align="center">FAQ 자주 묻는 질문</div>
		<form>
			<div class="fSearch" align="center">
				<input type="text" placeholder="무엇을 도와드릴까요?">
				<button class="h_btn">FAQ 검색</button>
			</div>
		</form>

		
		<div class="f_List" align="center">
			<p class="f_category">구분</p>
			<p class="f_question">제목</p>
		</div>
		<div class="f_qList" id="q1" onclick="clickshow(this.id)">
			<p class="f_Category">로그인/정보</p>
			<p class="f_Question">아이디와 비밀번호가 기억나지 않아요.</p>
		</div>
		<div class="f_aList" id="a1" style="display: none;">
			<p class="f_Category">답변</p>
			<p class="f_Answer">아이디와 비밀번호 찾기를 해보세용<br>과연?</p>
		</div>
	</div>
</body>
</html>