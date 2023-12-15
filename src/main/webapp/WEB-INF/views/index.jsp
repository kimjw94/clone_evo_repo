<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evo</title>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/product.css">
<link rel="stylesheet" href="resources/css/MenuBar.css">
<link rel="stylesheet" href="resources/css/productView.css">
<link rel="stylesheet" href="resources/css/helpper.css">
<script type="text/javascript">
	function toggleSubMenu(event) {
		// 클릭된 요소가 링크인 경우 토글 동작을 수행하지 않음
		if (event.target.tagName.toLowerCase() === 'a') {
			return;
		}

		var submenu = event.currentTarget.querySelector('.submenu');
		var submenuStyle = getComputedStyle(submenu);

		// 현재 상태에 따라 보이기/숨기기 토글
		if (submenuStyle.display === "none") {
			submenu.style.display = "block";
		} else {
			submenu.style.display = "none";
		}
	}

	function logout() {
		let R = confirm("로그아웃 하시겠습니까?");
		if (R) {
			location.href = "member.logout";

		}
	}
</script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
</head>
<body>
	<div class="container">
		<div class="nfont" align="right" id="loginA">
			<c:choose>
				<c:when test="${sessionScope.loginMember.m_id == null }">
					<a href="login">Login</a>
				</c:when>
				<c:otherwise>
					<a style="cursor: pointer;" onclick="logout()">Logout</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div align="center">
			<div align="center">
				<a href="/evo/" class="title">evo</a>
			</div>
			<div>
				<div class="nfont" align="left">
					<nav class="helpper">
						<ul>
							<li style="cursor: pointer;">고객센터
								<ul>
									<li><a href="">자주 묻는 질문</a></li>
									<li><a href="member.helpper.go">1:1 문의</a></li>
									<li><a href="member.helpperList.go">문의 내역</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
				<div class="nfont" align="right">
					<c:if test="${sessionScope.loginMember.m_id != null }">
						<a href="myPage">${sessionScope.loginMember.m_alias }님 환영합니다.</a>
					</c:if>
				</div>
			</div>
		</div>
		<hr />
		<div>
			<jsp:include page="${cp }" />
		</div>
		<hr class="footerHr" />
		<div class="footer" align="center">
			evo
			<p>문의 : 0000 - 0000
		</div>
	</div>
	<input type="checkbox" id="check_box" />
	<label for="check_box"> <span></span> <span></span> <span></span>
	</label>
	<div id="side_menu">
		<ul>
			<li onclick="toggleSubMenu(event)"><strong>상의</strong>&nbsp;<span>Top</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=상의">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=후드티">후드티</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=니트/스웨터">니트/스웨터</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=맨투맨">맨투맨</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=긴소매티셔츠">긴소매티셔츠</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=반소매티셔츠">반소매티셔츠</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=셔츠/블라우스">셔츠/블라우스</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=기타 상의">기타 상의</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><strong>아우터</strong>&nbsp;<span>Outer</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=아우터">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=후드집업">후드 집업</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=무스탕">무스탕</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=가디건">가디건</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=플리스/뽀글이">플리스/뽀글이</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=롱패딩">롱패딩</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=숏패딩">숏패딩</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=기타 아우터">기타 아우터</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><strong>하의</strong>&nbsp;<span>Bottom</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=바지">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=데님 팬츠">데님 팬츠</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=코튼 팬츠">코튼 팬츠</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=트레이닝/조거팬츠">트레이닝/조거팬츠</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=숏 팬츠">숏 팬츠</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=슈트팬츠/슬랙스">슈트팬츠/슬랙스</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=기타 바지">기타 바지</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>원피스</Strong>&nbsp;<span>Onepiece</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=원피스">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=미니 원피스">미니 원피스</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=미디 원피스">미디 원피스</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=맥시 원피스">맥시 원피스</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>스커트</Strong>&nbsp;<span>Skirt</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=스커트">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=미니 스커트">미니 스커트</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=미디 스커트">미디 스커트</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=롱 원피스">롱스커트</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>신발</Strong>&nbsp;<span>Shoes</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=신발">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=구두">구두</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=로퍼">로퍼</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=플랫 슈즈">플랫 슈즈</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=슬리퍼">슬리퍼</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=샌들">샌들</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=부츠">부츠</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=기타 신발">기타 신발</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>가방</Strong>&nbsp;<span>Bag</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=가방">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=백팩">백팩</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=메신저/크로스백">메신저/크로스백</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=숄더백">숄더백</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=에코백">에코백</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=캐리어">캐리어</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=클러치백">클러치백</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=기타 가방">기타 가방</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>모자</Strong>&nbsp;<span>Headwear</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=모자">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=캡/야구모자">캡/야구모자</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=비니">비니</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=베레모">베레모</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=기타 모자">기타 모자</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>액세서리</Strong>&nbsp;<span>Accessory</span>
				<ul class="submenu">
					<li><a href="product.showProduct.all?categoryName=액세서리">전체</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=귀걸이">귀걸이</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=목걸이">목걸이</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=머플러">머플러</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=장갑">장갑</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=마스크">마스크</a></li>
					<li><a href="product.showProduct.detailCategory?categoryDetailName=기타 악세서리">기타 악세사리</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
		</ul>
	</div>

</body>
</html>
