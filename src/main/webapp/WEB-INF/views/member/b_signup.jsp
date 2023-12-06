<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function btn_submit(){
	
	var b_id = $("#b_id").val();
	var b_pw = $("#b_pw").val();
	var b_name= $("#b_name").val();
	
	b_id = $.trim(b_id);
	b_pw = $.trim(b_pw);
	b_name = $.trim(b_name);
	if(b_id == ""){
		alert("아이디를 입력해주세요.");
		$("#b_id").focus();
		return false;
	}
	if(b_pw == ""){
		alert("비밀번호를 입력해주세요.");
		$("#b_pw").focus();
		return false;
	}
	if(b_name == ""){
		alert("이름을 입력해주세요.");
		$("#b_name").focus();
		return false;
	}
	
	
	return true;

}
</script>
</head>
<body>
	<form id="frm" action="member.b_signup" onsubmit="return btn_submit();" enctype="multipart/form-data" method="post">
		<table align="center">
			<caption>
				<h1>회원가입</h1>
			</caption>
			<tr>
				<th>
					<label for="b_id">ID</label>
				</th>
				<td>
					<input type="text" name="b_id" id="b_id" placeholder="아이디 입력" class="">
					<button>중복 확인</button>
				</td>
			</tr>	
			<tr>
				<th>
					<label for="b_pw">PW</label>
				</th>
				<td>
					<input type="password" name="b_pw" id="b_pw" placeholder="비밀번호 입력" class="">
				</td>
			</tr>	
			<tr>
				<th>
					<label for="b_name">이름</label>
				</th>
				<td>
					<input type="text" name="b_name" id="b_name" class="">
				</td>
			</tr>	
			<tr>
				<th>
					<label for="b_alias">닉네임</label>
				</th>
				<td>
					<input type="text" name="b_alias" id="b_alias" class="">
					<button>중복 확인</button>
				</td>
			</tr>
			<tr>
				<th>
					<label for="b_phone">연락처</label>
				</th>
				<td>
					<input type="text" name="b_phone" id="b_phone" class=""> ex) 010-xxxx-xxxx
				</td>
			</tr>
			<tr>
		<td colspan="2" align="center">
		<button>가입</button>

		<button onclick="cancle()">취소</button>
		</td>
	</tr>			
		</table>
	</form>
</body>
</html>