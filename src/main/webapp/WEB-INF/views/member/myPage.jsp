<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function logout() {
	let R = confirm("로그아웃 하시겠습니까?");
	if(R){
		location.href="member.logout";
		
	}
}
</script>
</head>
<body>
	<form action="member.myPage">
		<div align="center" valign="top">
			<div align="right">
				<div colspan="3">
						<c:if test="${sessionScope.loginMember.m_buy_sell == 0 }">
							<a href="member.info.go">
								정보수정
							</a>
						</c:if>
						<c:if test="${sessionScope.loginMember.m_buy_sell == 1 }">
							<a href="member.sellerinfo.go">
								정보수정
							</a>
						</c:if>
						&nbsp;
						<c:if test="${sessionScope.loginMember.m_id != null }">
							<a href="" onclick="logout()">로그아웃</a>
						</c:if>
				</div>
			</div>
			<div></div>
			<div class="pIcon">
				<div class="iicon" align="left">
					<a href=""><img src=""></a>
				</div>
				<div class="iicon">
					<a href=""><img src=""></a>
				</div>
				<div class="iicon">
					<a href=""><img src=""></a>
				</div>
			</div>
			<div class="pIcon">
				<div class="iiconName" align="center">장바구니</div>
				<div class="iiconName" align="center">위시리스트</div>
				<div class="iiconName" align="center">구매내역</div>
			</div>
		</div>
		<hr class="line"/>
		<div align="center" valign="bottom">
			<div align="left">
				<div colspan="4">최근 본 상품</div>
			</div>
			<div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
			<div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
	</form>

</body>
</html>