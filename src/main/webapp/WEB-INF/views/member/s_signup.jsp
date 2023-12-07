<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '+ data.buildingName : data.buildingName);
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
					document.getElementById("address input3")
							.focus();
					

				}
			}).open();

}




</script>
</head>
<body>
	<form action="">
		<table class="s_signup"align="center">
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
					<input type="text" name="b_phone" id="b_phone" class="" placeholder="ex) 010-xxxx-xxxx">
				</td>
			</tr>
			<tr>
				<th>
					<label for="s_address">주소</label>
				</th>
				<td>
					<input type="text" name="s_address1" id="address input1" class="" readonly="readonly">
					<button type="button" onclick="address_search()" class="btn-black">검색</button>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input type="text" name="s_address2" id="address input2" class="" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input type="text" name="s_address3" id="address input3" class="" placeholder="상세주소">
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