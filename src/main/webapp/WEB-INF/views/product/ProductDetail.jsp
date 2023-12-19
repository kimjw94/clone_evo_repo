<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
</head>
<body>

	<div>
		<div>
			<img src="resources/css/img/ex2.png" width="100%" height="50px">
		</div>

		<c:forEach var="p" items="${Detail}">
			<div>
				<a href="product.showProduct.all?categoryName=${p.C_CATEGORY_NAME}">${p.C_CATEGORY_NAME}</a>
				> <a
					href="product.showProduct.detailCategory?categoryDetailName=${p.D_CATEGORY_DETAIL_NAME}">${p.D_CATEGORY_DETAIL_NAME}</a>
			</div>
			<div>상품명: ${p.P_PRODUCT_NAME}</div>
			<div>
				상품사진: <img src="resources/thumnailImg/${p.IM_THUMBNAIL_IMAGE}"
					alt="Product Image">
			</div>
			<div>
				상품정보: ${p.P_INFO}
				<div>판매자명: ${p.P_M_ID}</div>
				<div>조회수: ${p.P_VIEW}</div>
				<div></div>
				<div>카테고리: ${p.CATEGORY_NAME}</div>
			</div>
		</c:forEach>
		<div>
			색상:
			<c:forEach var="color" items="${ColorList}">
				<button>${color}</button>
			</c:forEach>
		</div>
		<div>
			사이즈:
			<c:forEach var="size" items="${SizeList}">
				<button>${size}</button>
			</c:forEach>
		</div>
		<div>
			<button>상품 주문하기</button>
			<button>장바구니 담기</button>
			<button>위시리스트 담기</button>
		</div>
	</div>
	<c:forEach var="p" items="${Detail}">
	<img src="resources/infoImg/${p.IM_INFO_IMAGE}">
	</c:forEach>
	<div>상품 후기</div>


</body>
</html>