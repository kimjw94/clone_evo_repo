<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="category" > <a href=""> 메인카테고리 </a>&nbsp;> <a href=""> 상세카테고리 </a><p></div>
	<div> <img src="resources/css/img/ex2.png" height="50px" width="100%"></div>
	<p>
	<p>
	<c:if test="${not empty product}">
		
		
		<div id="productPhoto"><img src="resources/productImg/${product.p_photo}" width="400px" height="400px">
		</div>
	
		<div id="productName"> ${product.p_product_name} </div>
		<div id="productDetail">
		<p>상품번호: ${product.p_product_no}</p>
		<p>상품명: ${product.p_product_name}</p>
		<p>가격: ${product.p_price } 원
		<p>색상:
		<p>size:
		<p>상품정보: ${product.p_info }
		
		</div>
	</c:if>
</body>
</html>