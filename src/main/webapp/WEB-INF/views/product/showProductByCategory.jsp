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
	
	<c:forEach var="p" items="${ProductsCategory}">
		<div  class="photo">
			<a href="product.showProduct.detail?productNo=${p.P_PRODUCT_NO }">
				<div>
					<img src="resources/thumnailImg/${p.IM_THUMBNAIL_IMAGE}"
						id="p_image">
				</div>
				<div class="p_title">${p.P_PRODUCT_NAME}</div>
				<div class="p_view">${p.P_VIEW}</div>
				<div > ${p.P_PRICE} 원</div>
			</a>
		</div>
	</c:forEach>

</body>
</html>