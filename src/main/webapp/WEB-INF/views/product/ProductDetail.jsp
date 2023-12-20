<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<script type="text/javascript">
	function increaseQuantity() {
		var quantityInput = document.getElementById("quantity");
		var currentQuantity = parseInt(quantityInput.value, 10);
		if (currentQuantity < 10) { // 최대 수량 제한
			quantityInput.value = currentQuantity + 1;
		}
	}

	function decreaseQuantity() {
		var quantityInput = document.getElementById("quantity");
		var currentQuantity = parseInt(quantityInput.value, 10);
		if (currentQuantity > 1) { // 최소 수량 제한
			quantityInput.value = currentQuantity - 1;
		}
	}

	function updateQuantity() {
		var selectedQuantity = document.getElementById("selected-quantity");
		var quantityInput = document.getElementById("quantity");
		var selectedQuantityValue = quantityInput.value;

		// Update the displayed quantity
		selectedQuantity.innerText =selectedQuantityValue;

		// Calculate and update the total price based on quantity
		var totalPrice = parseInt("${Detail[0].P_PRICE}")
				* selectedQuantityValue;
		var selectedTotalPrice = document
				.getElementById("selected-total-price");
		selectedTotalPrice.innerText =totalPrice + "원";
	}

	function updateSelectedProductInfo() {
		var selectedProductName = document
				.getElementById("selected-product-name");
		var selectedColor = document.getElementById("selected-color");
		var selectedSize = document.getElementById("selected-size");
		var selectedQuantity = document.getElementById("selected-quantity");
		var selectedTotalPrice = document
				.getElementById("selected-total-price");

		var colorSelect = document.getElementById("color");
		var sizeSelect = document.getElementById("size");
		var quantityInput = document.getElementById("quantity");

		var selectedColorValue = colorSelect.options[colorSelect.selectedIndex].value;
		var selectedSizeValue = sizeSelect.options[sizeSelect.selectedIndex].value;
		var selectedQuantityValue = quantityInput.value;

		console.log("Selected Color: " + selectedColorValue);
		console.log("Selected Size: " + selectedSizeValue);

		if (selectedColorValue && selectedSizeValue) {
			selectedProductName.innerText = "${Detail[0].P_PRODUCT_NAME}";
			selectedColor.innerText = selectedColorValue;
			selectedSize.innerText =  selectedSizeValue;
			selectedQuantity.innerText =  selectedQuantityValue;
			selectedTotalPrice.innerText = (parseInt("${Detail[0].P_PRICE}") * selectedQuantityValue)
					+ "원";

			// Call the updateQuantity function
			updateQuantity();

			var selectedProductInfo = document
					.querySelector(".selected-product-info");
			selectedProductInfo.style.display = "block";
		} else {
			alert("색상과 사이즈를 선택하세요.");
		}
	}
</script>

</head>
<body>

	<div class="container">

		<div class="product-details">
			<div class="banner">
				<img src="resources/css/img/ex2.png" width="100%" height="50px">
			</div>
			<c:forEach var="p" items="${Detail}">
				<div class="category-area">
					<a href="product.showProduct.all?categoryName=${p.C_CATEGORY_NAME}">${p.C_CATEGORY_NAME}</a>
					> <a
						href="product.showProduct.detailCategory?categoryDetailName=${p.D_CATEGORY_DETAIL_NAME}">${p.D_CATEGORY_DETAIL_NAME}</a>
				</div>
				<div class="product-name">${p.P_PRODUCT_NAME}</div>
				<div class="product-left-info">
					<div>
						<img src="resources/thumnailImg/${p.IM_THUMBNAIL_IMAGE}"
							alt="Product Image" class="product-image">
					</div>
				</div>

				<div class="product-right-info">
					<div>
						<strong>ProductInfo</strong> <span>제품정보</span>
					</div>
					<hr>
					${p.P_INFO}
					<div>판매자명: ${p.P_M_ID}</div>
					<div>조회수: ${p.P_VIEW}</div>
					<div>카테고리: ${p.D_CATEGORY_DETAIL_NAME}</div>
			</c:forEach>



			<div class="color-buttons">
				색상:
				<c:forEach var="color" items="${ColorList}">
					<div class="color-option" style="background-color: ${color}"></div>
				</c:forEach>
			</div>
			<div class="size-buttons">
				사이즈:
				<c:forEach var="size" items="${SizeList}" varStatus="loop">
        ${size}<c:if test="${not loop.last}"> / </c:if>
				</c:forEach>

			</div>
			<div class="price">
				<c:forEach var="p" items="${Detail}">
			가격: ${p.P_PRICE}
			</c:forEach>
			</div>

			<div class="option-selection">
				<label for="color">색상:</label> <select id="color" name="color"
					onchange="updateSelectedProductInfo()">
					<option value="">옵션 선택</option>
					<!-- 기본 옵션 -->
					<c:forEach var="color" items="${ColorList}">
						<option value="${color}">${color}</option>
					</c:forEach>
				</select>
			</div>

			<div class="option-selection">
				<label for="size">사이즈:</label> <select id="size" name="size"
					onchange="updateSelectedProductInfo()">
					<option value="">옵션 선택</option>
					<!-- 기본 옵션 -->
					<c:forEach var="size" items="${SizeList}">
						<option value="${size}">${size}</option>
					</c:forEach>
				</select>
			</div>

			<!-- 수량 선택 옵션 -->
			<div class="option-selection">
				<label for="quantity">수량:</label>
				<div class="quantity-controls">
					<button onclick="decreaseQuantity(); updateQuantity();">-</button>
					<input type="text" id="quantity" name="quantity" value="1" readonly>
					<button onclick="increaseQuantity(); updateQuantity();">+</button>
				</div>
			</div>

			<!-- 선택한 제품 정보 표시 부분 -->
	<div class="selected-product-info" style="display: none;">
    <table>
        <thead>
            <tr>
                <th>상품명</th>
                <th>색상</th>
                <th>사이즈</th>
                <th>수량</th>
                <th>총 가격</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="selected-product-name"></td>
                <td id="selected-color"></td>
                <td id="selected-size"></td>
                <td id="selected-quantity"></td>
                <td id="selected-total-price"></td>
            </tr>
        </tbody>
    </table>
</div>

</div>


			<div class="order-buttons">
				<button class="order-btn">상품 주문하기</button>
				<button class="cart-btn">장바구니 담기</button>
				<button class="wishlist-btn">위시리스트 담기</button>
			</div>
			
		</div>


		<c:forEach var="p" items="${Detail}">
			<hr>
			<div style="text-align:center;">
				<Strong>Info</Strong>&nbsp;<span>정보</span>
			</div>
			<img src="resources/infoImg/${p.IM_INFO_IMAGE}"
				alt="Product Information Image" class="product-info-image">
		</c:forEach>
	</div>

	<div class="review-section">
		<div>EVO 후기 실 구매고객의 보고 결정하세요!</div>
		<!-- Add your review section HTML here -->
	</div>

</body>
</html>
