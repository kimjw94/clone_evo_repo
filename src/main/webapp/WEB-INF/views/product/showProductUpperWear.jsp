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
	<c:forEach var="p" items="${ProductsUpperwear}">
		<div class="photo">
			<div>
				<img src="resources/productImg/${p.IM_THUMBNAIL_IMAGE}" id="p_image">
			</div>
			<div class="p_title">
				<a href="">${p.P_PRODUCT_NAME}</a>
			</div>
			<div class="p_view">
				<a href="">${p.P_VIEW }</a>
			</div>
			<div>
				<a href="p_price">￦ ${p.P_PRICE}</a>
			</div>
		</div>
	</c:forEach>

</body>
</html>