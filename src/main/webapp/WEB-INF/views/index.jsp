<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/product.css">
<link rel="stylesheet" href="resources/css/MenuBar.css">
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
			<div class="nfont" align="right">
				<c:if test="${sessionScope.loginMember.m_id != null }">
					<a href="myPage">${sessionScope.loginMember.m_alias }님 환영합니다.</a>
				</c:if>
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
					<li><a href="#">전체</a></li>
					<li><a href="#">후드티</a></li>
					<li><a href="#">니트/스웨터</a></li>
					<li><a href="#">맨투맨</a></li>
					<li><a href="#">긴소매티셔츠</a></li>
					<li><a href="#">반소매티셔츠</a></li>
					<li><a href="#">셔츠/블라우스</a></li>
					<li><a href="#">기타 상의</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><strong>아우터</strong>&nbsp;<span>Outer</span>
				<ul class="submenu">
					<li><a href="#">전체</a></li>
					<li><a href="#">후드 집업</a></li>
					<li><a href="#">무스탕</a></li>
					<li><a href="#">가디건</a></li>
					<li><a href="#">플리스/뽀글이</a></li>
					<li><a href="#">롱패딩</a></li>
					<li><a href="#">숏패딩</a></li>
					<li><a href="#">기타 아우터</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><strong>하의</strong>&nbsp;<span>Bottom</span>
				<ul class="submenu">
					<li><a href="#">전체</a></li>
					<li><a href="#">데님 팬츠</a></li>
					<li><a href="#">코튼 팬츠</a></li>
					<li><a href="#">트레이닝/조거팬츠</a></li>
					<li><a href="#">숏 팬츠</a></li>
					<li><a href="#">슈트팬츠/슬랙스</a></li>
					<li><a href="#">기타 바지</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>원피스</Strong>&nbsp;<span>Onepiece</span>
				<ul class="submenu">
					<li><a href="#">전체</a></li>
					<li><a href="#">미니 원피스</a></li>
					<li><a href="#">미디 원피스</a></li>
					<li><a href="#">맥시 원피스</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>스커트</Strong>&nbsp;<span>Skirt</span>
				<ul class="submenu">
					<li><a href="#">전체</a></li>
					<li><a href="#">미니 원피스</a></li>
					<li><a href="#">미디 원피스</a></li>
					<li><a href="#">맥시 원피스</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>신발</Strong>&nbsp;<span>Shoes</span>
				<ul class="submenu">
					<li><a href="#">전체</a></li>
					<li><a href="#">구두</a></li>
					<li><a href="#">로퍼</a></li>
					<li><a href="#">플랫 슈즈</a></li>
					<li><a href="#">슬리퍼</a></li>
					<li><a href="#">샌들</a></li>
					<li><a href="#">부츠</a></li>
					<li><a href="#">기타 신발</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>가방</Strong>&nbsp;<span>Bag</span>
				<ul class="submenu">
					<li><a href="#">전체</a></li>
					<li><a href="#">백팩</a></li>
					<li><a href="#">메신저/크로스백</a></li>
					<li><a href="#">숄더백</a></li>
					<li><a href="#">에코백</a></li>
					<li><a href="#">캐리어</a></li>
					<li><a href="#">클러치백</a></li>
					<li><a href="#">기타 가방</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>모자</Strong>&nbsp;<span>Headwear</span>
				<ul class="submenu">
					<li><a href="#">전체</a></li>
					<li><a href="#">캡/야구모자</a></li>
					<li><a href="#">비니</a></li>
					<li><a href="#">베레모</a></li>
					<li><a href="#">기타 모자</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
			<li onclick="toggleSubMenu(event)"><Strong>액세서리</Strong>&nbsp;<span>Accessory</span>
				<ul class="submenu">
					<li><a href="#">전체</a></li>
					<li><a href="#">귀걸이</a></li>
					<li><a href="#">머플러</a></li>
					<li><a href="#">장갑</a></li>
					<li><a href="#">마스크</a></li>
					<li><a href="#">기타 악세사리</a></li>
					<!-- 추가적인 하위 메뉴 항목들을 이곳에 추가하세요 -->
				</ul></li>
		</ul>
	</div>

</body>
</html>
