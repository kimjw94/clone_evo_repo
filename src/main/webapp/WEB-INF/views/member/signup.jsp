<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evo</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

var idFlag = true;
var nickFlag = true;
	function btn_submit() {

		var m_id = document.getElementById("m_id");
		var m_password = document.getElementById("m_password");
		var m_pwcheck = document.getElementById("m_pwcheck");
		var m_name = document.getElementById("m_name");
		var m_phone = document.getElementById("m_phone");
		var m_alias = document.getElementById("m_alias");
		var m_address1 = document.getElementById("address_input1");
		var m_address2 = document.getElementById("address_input2");
		var m_address3 = document.getElementById("address_input3");

		let result = true;

		if ((m_id.value) == "") {
			alert("아이디를 입력해주세요.");
			result = false;
			m_id.focus();
			return result;
		}

		if ((m_password.value) == "") {
			alert("비밀번호를 입력해주세요.");
			m_password.focus();
			return false;
		}


		if ((m_password.value) != (m_pwcheck.value)) {
			alert("비밀번호가 동일하지 않습니다.");
			m_pwcheck.focus();

			return false;
		} 
		
		if ((m_name.value) == "") {
			alert("이름을 입력해주세요.");
			m_name.focus();
			return false;
		}

		
		if((m_alias.value) == "") {
			alert("닉네임을 입력해주세요.");
			m_alias.focus();
			return false;
		}
		
		if((m_phone.value) == "") {
			alert("연락처를 입력해주세요.");
			m_phone.focus();
			return false;	
		} 
		
		if((m_address1.value) == "" || (m_address2.value == "") || (m_address3.value == "")) {
			alert("주소를 입력해주세요.");
			return false;
		}
		
		if(idFlag == false) {
			alert("아이디가 중복되었습니다. 다시 입력해주세요.");
			m_id.focus();
			return false;
		}
		
		if(nickFlag == false) {
			alert("닉네임이 중복되었습니다. 다시 입력해주세요.");
			m_alias.focus();
			return false;
		}
		
		else {
			return true;
		}

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
						document.getElementById('address_input1').value = data.zonecode;
						document.getElementById("address_input2").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("address_input3").focus();

					}
				}).open();

	}

	$(function() {

		$("#m_id").keyup(function() {
			let m_id = $("#m_id").val();
			//alert(m_id);
			$.getJSON("member.idCheck?m_id=" + m_id, function(memberJSON) {
				if (memberJSON.member[0] == null) {
					$("#label1").html('사용 가능한 아이디입니다.')
					$("#label1").css("color", "black");
					idFlag = true;
				} else {
					$("#label1").html('사용할 수 없는 아이디입니다.')
					$("#label1").css("color", "red");
					idFlag = false;
				}
			});
		});

	});
	$(function(){
		$("#m_alias").keyup(function() {
			let m_alias = $("#m_alias").val();
			//alert(m_alias);
			$.getJSON("member.alCheck?m_alias=" + m_alias, function(memberJSON) {
				if (memberJSON.member[0] == null) {
					$("#label2").html('사용 가능한 닉네임입니다.')
					$("#label2").css("color", "black");
					nickFlag = true;
				} else {
					$("#label2").html('사용할 수 없는 닉네임입니다.')
					$("#label2").css("color", "red");
					nickFlag = false;
				}
			});
		});
	});
	
	$(document).on('keyup', '#m_id', function() {
		$(this).val($(this).val().replace(/[^a-zA-Z0-9]/g, ''));
	});
	
	$(document).on('keyup', '#m_phone', function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
</script>
</head>
<body>
	<form action="member.signup" method="post"
		onsubmit="return btn_submit();">
		<table class="m_signup" align="center">
			<tr>
				<td class="title" id="tTitle" align="center" colspan="4">
					SignUp</td>
			</tr>
			<tr>
				<th rowspan="2"><label for="m_id">ID</label></th>
				<td><input name="m_id" id="m_id" placeholder="영문 소문자 및 숫자만 입력해주세요." class="">
				</td>
			</tr>
			<tr>
				<td><label id="label1"></label></td>
			</tr>
			<tr>
				<th><label for="m_pw">PW</label></th>
				<td><input type="password" name="m_password" id="m_password"
					placeholder="Password" class=""></td>
			</tr>
			<tr>
				<th><label for="m_pwcheck">PW확인</label></th>
				<td><input type="password" name="m_pwcheck" id="m_pwcheck"
					placeholder="Password Check" class=""></td>
			</tr>
			<tr>
				<th><label for="m_name">이름</label></th>
				<td><input type="text" name="m_name" id="m_name"
					placeholder="이름" class=""></td>
			</tr>
			<tr>
				<th rowspan="2"><label for="m_alias">닉네임</label></th>
				<td>
					<input name="m_alias" id="m_alias"
					placeholder="닉네임" class="">
				</td>
			</tr>
			<tr>
				<td><label id="label2"></label></td>
			</tr>
			<tr>
				<th><label for="m_phone">연락처</label></th>
				<td><input type="text" name="m_phone" id="m_phone" class=""
					placeholder="ex) 01012345678"></td>
			</tr>
			<tr>
				<th><label for="m_address">주소</label></th>
				<td><input type="text" name="m_address1" id="address_input1"
					class="" readonly="readonly">
					<button type="button" onclick="address_search()" class="btn-black">검색</button>
				</td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="m_address2" id="address_input2"
					class="" readonly="readonly"></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="m_address3" id="address_input3"
					class="" placeholder="상세주소"></td>
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