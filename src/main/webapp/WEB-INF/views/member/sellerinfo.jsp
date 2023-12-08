<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function btn_submit() {


		var m_pw = document.getElementById("m_password");
		var m_pwcheck = document.getElementById("m_pwcheck");
		var m_name = document.getElementById("m_name");

		if ((m_pw.value) == "") {
			alert("비밀번호를 입력해주세요.");
			m_pw.focus();
			return false;
		}

		if ((m_name.value) == "") {
			alert("이름을 입력해주세요.");
			m_name.focus();
			return false;
		}

		if ((m_pw.value) != (m_pwcheck.value)) {
			alert("비밀번호가 동일하지 않습니다.");
			m_pwcheck.focus();

			return false;
		}

		return true;

	}

	function address_search() {

		new daum.Postcode(
				{
					oncomplete : function(data) {

						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							addr += extraAddr;

						} else {
							addr += ' ';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('address input1').value = data.zonecode;
						document.getElementById("address input2").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("address input3").focus();

					}
				}).open();

	}
	function sellerInfo() {


		var w = (window.screen.width / 2) - 300;
		var h = (window.screen.height / 2) - 350;
		var url = "member.sellerInfoModi.go"
		window.open(url, "sellerInfoModi", "width=600,height=700,left=" + w + ",top="
				+ h)

	}
</script>
</head>
<body>
	<form action="member.sellerinfo" method="post">
		<table class="m_signup" align="center">
			<tr>
				<td class="title" id="tTitle" align="center" colspan="4">
					Infomodi</td>
			</tr>
			<tr>
				<th><label for="m_id">ID</label></th>
				<td><input value="${sessionScope.loginMember.m_id }"
					name="m_id" id="m_id" placeholder="ID" class="" readonly="readonly">
			</tr>
			<tr>
				<th><label for="m_pw">PW</label></th>
				<td><input value="${sessionScope.loginMember.m_password }"
					type="password" name="m_passwordw" id="m_pw" placeholder="Password"
					class=""></td>
			</tr>
			<tr>
				<th><label for="m_pwcheck">PW확인</label></th>
				<td><input value="${sessionScope.loginMember.m_password }"
					type="password" name="m_pwcheck" id="m_pwcheck"
					placeholder="Password Check" class=""></td>
			</tr>
			<tr>
				<th><label for="m_name">이름</label></th>
				<td><input value="${sessionScope.loginMember.m_name }"
					type="text" name="m_name" id="m_name" placeholder="이름" class=""></td>
			</tr>
			<tr>
				<th><label for="m_nickname">닉네임</label></th>
				<td><input value="${sessionScope.loginMember.m_alias }"
					type="text" name="m_alias" id="m_alias" placeholder="닉네임" class="">
					<button class="btn-black">중복 확인</button></td>
			</tr>
			<tr>
				<th><label for="b_phone">연락처</label></th>
				<td><input value="${sessionScope.loginMember.m_phone }"
					type="text" name="m_phone" id="m_phone" class=""
					placeholder="ex) 010-xxxx-xxxx"></td>
			</tr>
			<tr>
				<th><label for="m_address">주소</label></th>
				<td><input type="text" name="m_address1" id="address input1"
					class="" readonly="readonly">
					<button type="button" onclick="address_search()" class="btn-black">검색</button>
				</td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="m_address2" id="address input2"
					class="" readonly="readonly"></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="m_address3" id="address input3"
					class="" placeholder="상세주소"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="signupTd">
					<button type="button" onclick="btn_submit()" class="btn-black"
						id="signupBtn">수정</button>
					<button type="button" onclick="sellerInfo()" class="btn-black" id="">판매자
						정보 등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>