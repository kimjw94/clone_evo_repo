<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보</title>
</head>
<body>
	<div>
		<form action="" method="POST" enctype="multipart/form-data">
			<div>
				<div class="nfont" id="tpTitle" align="center">상품 정보</div>
			</div>
			<div class="nfont" align="right">
				<a href="product.viewAddProduct">상품 추가</a>
			</div>
			<hr style="border:dotted 2px lightgray"/>
			<div><jsp:include page="${p }" />
			</div>
			<div class="proContainer" align="center">
				<c:forEach var="p" items="${idProduct}" >
					<div class="photo">
						<div><img src="resources/productImg/${p.P_PHOTO}" id="p_image"></div>
						<div class="p_title"><a href="product.modiProduct.go">${p.P_PRODUCT_NAME}</a></div>
						<div class="p_view"><a href="">${p.P_VIEW }</a></div>
						<div><a href="p_price">￦ ${p.P_PRICE}</a></div>
					</div>
				</c:forEach>
			</div>
		</form>
	</div>


</body>
</html>