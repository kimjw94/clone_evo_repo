<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function btn_submit(){
	
	var s_id = $("#s_id").val();
	var s_pw = $("#s_pw").val();
	var s_name= $("#s_name").val();
	
	s_id = $.trim(s_id);
	s_pw = $.trim(s_pw);
	s_name = $.trim(s_name);
	if(s_id == ""){
		alert("아이디를 입력해주세요.");
		$("#s_id").focus();
		return false;
	}
	if(s_pw == ""){
		alert("비밀번호를 입력해주세요.");
		$("#s_pw").focus();
		return false;
	}
	if(s_name == ""){
		alert("이름을 입력해주세요.");
		$("#s_name").focus();
		return false;
	}
	
	
	return true;

}
</script>
</head>
<body>
	<form action="">
		<table class="s_signup" align="center">
			<tr>
				<td class="title" id="tTitle" align="center" colspan="4">
					Signup_seller
				</td>
			</tr>
			<tr>
				<th>
					<label for="s_id">ID</label>
				</th>
				<td>
					<input type="text" name="s_id" id="s_id" placeholder="ID" class="">
					<button class="btn-black">중복 확인</button>
				</td>
			</tr>	
			<tr>
				<th>
					<label for="s_pw">PW</label>
				</th>
				<td>
					<input type="password" name="s_pw" id="s_pw" placeholder="Password" class="">
				</td>
			</tr>	
			<tr>
				<th>
					<label for="s_name">회사명</label>
				</th>
				<td>
					<input type="text" name="s_name" id="s_name" placeholder="이름" class="">
				</td>
			</tr>	
			<tr>
				<th>
					<label for="b_phone">연락처</label>
				</th>
				<td>
					<input type="text" name="b_phone" id="b_phone" class=""  placeholder="ex) 010-xxxx-xxxx">
				</td>
			</tr>
			<tr>
				<th>
					<label for="s_address">주소</label>
				</th>
				<td>
					<input type="text" name="s_address" id="s_address" class="" placeholder="주소">
					<button class="btn-black">검색</button>
				</td>
			</tr>
			<tr>
				<th>
					<label for="s_bank">계좌</label>
				</th>
				<td>
					<select class="selectB">
						<option>농협</option>
						<option>카카오</option>
						<option>우리</option>
						<option>국민</option>
					</select>
					
					<input type="text" name="s_bank" id="s_bank" class="" placeholder="계좌번호">
				</td>
			</tr>
			<tr>
		<td colspan="2" align="center" class="signupTd">
		<button class="btn-black" id="signupBtn">가입</button>
		</td>
	</tr>	
		</table>
	</form>
</body>
</html>