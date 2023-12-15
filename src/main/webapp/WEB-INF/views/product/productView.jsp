<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="nfont" id="tpTitle" align="center">상품 정보</div>
		<div class="proContainer">
			<div class="proContainer" align="center">
				<c:forEach var="product" items="${products}" >
					<div class="photo">
						<a href="product.viewDetail?p_product_no=${product.p_product_no}">
						<img src="resources/productImg/${product.p_photo}" id="p_image">
						${product.p_product_name}
						${product.p_price}
						</a>
					
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
	
	
	
</body>
</html>