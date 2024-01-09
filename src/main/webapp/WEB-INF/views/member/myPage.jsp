<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evo</title>
<script type="text/javascript">
</script>
</head>
<body>
	<form action="member.myPage">
		<div align="center" valign="top">
			<div class="title" id="tTitle" algin="center">MyPage</div>
			<div align="right">
				<div colspan="3" class="infoModi">
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
				<div class="iiconName" align="center"><a href="product.showShoppingbasket">장바구니</a></div>
				<div class="iiconName" align="center">위시리스트</div>
				<div class="iiconName" align="center">구매내역</div>
			<c:if test="${sessionScope.loginMember.m_buy_sell == 1 }">
				<div class="iiconName" align="center">
					<a href="product.infoProduct">상품정보</a></div>
			</c:if>
				
			</div>
		</div>
		<hr class="line"/>

	</form>

</body>
</html>