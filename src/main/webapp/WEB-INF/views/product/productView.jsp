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
	<div class="section_product_container">
		<div class="section_product_list">
			<ul>
				<li><c:forEach var="product" items="${products}">
						<p>
							<img src="resources/productImg/${product.p_photo}"><br>
							${product.p_product_name} ${product.p_price}
						</p>
					</c:forEach>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>