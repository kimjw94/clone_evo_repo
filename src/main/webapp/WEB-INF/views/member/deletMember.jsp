<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evo</title>
<script type="text/javascript">
	function btn_submit() {

		
		var m_password = document.getElementById("m_password");
		let R = confirm("탈퇴 하시겠습니까?");

		if ((m_password.value) == "") {
			alert("비밀번호를 입력해주세요.");
			m_password.focus();
			return false;
		}

		if ((m_password.value) != (m_password2.value)) {
			alert("비밀번호를 확인해주세요.");
			m_password.focus();
			return false;
		} else {
			if(R){
				alert("탈퇴 되었습니다.");
				location.href = "member.deletMember";
			}
		}

	}
</script>
</head>
<body>
	<form action="member.deletMember" method="post"
		onsubmit="return btn_submit();">
		<table align="center">
			<tr>
				<td class="title" id="tTitle" align="center" colspan="4">
					SignOut</td>
			</tr>
			<tr>
				<th><label for="m_id">ID</label></th>
				<td><input value="${sessionScope.loginMember.m_id }"
					name="m_id" id="m_id" placeholder="ID" class="" readonly="readonly">
			</tr>
			<tr>
				<th><label for="m_pw">PW</label></th>
				<td><input type="password" name="m_password" id="m_password"
					placeholder="Password" class=""></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="signupTd">
					<button class="btn-black" id="deletBtn">회원 탈퇴</button>
				</td>
			</tr>
			<tr>
				<td><input value="${sessionScope.loginMember.m_password }"
					type="hidden" name="m_password2" id="m_password2" readonly="readonly"
					class=""></td>
			</tr>
		</table>
	</form>
</body>
</html>