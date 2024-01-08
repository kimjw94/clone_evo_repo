<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<script type="text/javascript">
	function increaseQuantity(rowId) {
		var quantityInput = document.getElementById("quantity-" + rowId);
		var currentQuantity = parseInt(quantityInput.value, 10);
		if (currentQuantity < 10) {
			quantityInput.value = currentQuantity + 1;
			updateQuantity(rowId);
		}
	}

	function decreaseQuantity(rowId) {
		var quantityInput = document.getElementById("quantity-" + rowId);
		var currentQuantity = parseInt(quantityInput.value, 10);
		if (currentQuantity > 1) {
			quantityInput.value = currentQuantity - 1;
			updateQuantity(rowId);
		}
	}

	function updateQuantity(rowId) {
		var quantityInput = document.getElementById("quantity-" + rowId);
		var selectedQuantityValue = parseInt(quantityInput.value, 10);

		var priceCell = document
				.getElementById("select_product_price-" + rowId);
		var unitPrice = parseInt("${Detail[0].P_PRICE}");
		var totalPrice = unitPrice * selectedQuantityValue;
		priceCell.innerHTML = '<div id="selected-total-price-' + rowId + '">'
				+ totalPrice + '</div>';

		updateTotalPrice();
	}

	function resetOptions() {
		var colorSelect = document.getElementById("color");
		var sizeSelect = document.getElementById("size");

		colorSelect.value = "";
		sizeSelect.value = "";
	}

	function updateSelectedProductInfo() {
		var selectedProductName = document
				.getElementById("selected-product-name");
		var selectedColor = document.getElementById("selected-color");
		var selectedSize = document.getElementById("selected-size");

		var colorSelect = document.getElementById("color");
		var sizeSelect = document.getElementById("size");

		var selectedColorValue = colorSelect.options[colorSelect.selectedIndex].value;
		var selectedSizeValue = sizeSelect.options[sizeSelect.selectedIndex].value;

		console.log("선택한 색상: " + selectedColorValue);
		console.log("선택한 사이즈: " + selectedSizeValue);

		var tableBody = document.getElementById("selected-product-info-body");
		var rows = tableBody.getElementsByTagName("tr");
		var isProductExists = false;
		for (var i = 0; i < rows.length; i++) {
			var cells = rows[i].getElementsByTagName("td");
			var existingColor = cells[1].innerText;
			var existingSize = cells[2].innerText;
			if (existingColor === selectedColorValue
					&& existingSize === selectedSizeValue) {
				isProductExists = true;
				alert("같은 색상과 사이즈의 제품이 이미 추가되었습니다. 수량을 조절하세요.");
				resetOptions();
				return;
			}
		}

		if (isProductExists) {
			return;
		}

		if (selectedColorValue && selectedSizeValue) {
			var selectedProductInfo = document
					.querySelector(".selected-product-info");
			selectedProductInfo.style.display = "block";

			var tableBody = document
					.getElementById("selected-product-info-body");
			var newRow = tableBody.insertRow(tableBody.rows.length);

			function generateDynamicId(baseId, index) {
				return baseId + "-" + index;
			}

			var cell1 = newRow.insertCell(0);
			cell1.id = generateDynamicId("select_product_name",
					tableBody.rows.length);
			cell1.innerText = "${Detail[0].P_PRODUCT_NAME}";

			var cell2 = newRow.insertCell(1);
			cell2.id = generateDynamicId("select_product_color",
					tableBody.rows.length);
			cell2.innerText = selectedColorValue;

			var cell3 = newRow.insertCell(2);
			cell3.id = generateDynamicId("select_product_size",
					tableBody.rows.length);
			cell3.innerText = selectedSizeValue;

			var cell4 = newRow.insertCell(3);
			cell4.id = generateDynamicId("select_product_quantity",
					tableBody.rows.length);
			cell4.innerHTML = '<div class="quantity-controls"><button onclick="decreaseQuantity('
					+ tableBody.rows.length
					+ ');">-</button>'
					+ '<input type="text" id="'
					+ generateDynamicId("quantity", tableBody.rows.length)
					+ '" name="quantity" value="1" readonly style="text-align:center; height:20px; width:20px;">'
					+ '<button onclick="increaseQuantity('
					+ tableBody.rows.length + ');">+</button></div>';

			var cell5 = newRow.insertCell(4);
			cell5.id = generateDynamicId("select_product_price",
					tableBody.rows.length);
			cell5.innerHTML = '<div id="'
					+ generateDynamicId("selected-total-price",
							tableBody.rows.length) + '">0원</div>';

			addRemoveButtonToRow(newRow, tableBody.rows.length);

			updateQuantity(tableBody.rows.length);

			resetOptions();
		} else {
			alert("색상과 사이즈를 선택하세요.");
		}
	}

	function updateTotalPrice() {
		var total = 0;
		var tableBody = document.getElementById("selected-product-info-body");
		var rows = tableBody.getElementsByTagName("tr");

		for (var i = 0; i < rows.length; i++) {
			var priceCell = rows[i].cells[4];
			var priceText = priceCell.innerText;
			total += parseInt(priceText);
		}

		var totalPriceDiv = document.getElementById("totalPrice");
		totalPriceDiv.innerText = "전체 가격: " + total + "원";
	}

	function addRemoveButtonToRow(row, rowId) {
		var cell = row.insertCell(5);
		var removeButton = createRemoveButton(rowId);
		cell.appendChild(removeButton);
	}

	function createRemoveButton(rowId) {
		var removeButton = document.createElement("button");
		removeButton.innerText = "제거";
		removeButton.setAttribute("data-row-id", rowId);
		removeButton.onclick = function() {
			removeRow(this.getAttribute('data-row-id'));
		};
		return removeButton;
	}

	function generateDynamicId(baseId, index) {
		return baseId + "-" + index;
	}

	function updateIdsAndTotalPrice() {
		var tableBody = document.getElementById("selected-product-info-body");
		var rows = tableBody.getElementsByTagName("tr");

		for (var i = 0; i < rows.length; i++) {
			var cells = rows[i].getElementsByTagName("td");

			// 각 셀의 ID 업데이트
			for (var j = 0; j < cells.length; j++) {
				var currentId = cells[j].id;
				var updatedId = generateDynamicId(currentId.substring(0,
						currentId.lastIndexOf("-")), (i + 1));
				cells[j].id = updatedId;
			}

			// 수량 입력(input), 수량 버튼, 수량 증가 버튼, 수량 감소 버튼, 제거 버튼에 대한 이벤트 핸들러 업데이트
			var quantityInput = cells[3].querySelector("input[type='text']");
			var increaseButton = cells[3]
					.querySelector("button[onclick*='increaseQuantity']");
			var decreaseButton = cells[3]
					.querySelector("button[onclick*='decreaseQuantity']");
			var removeButton = cells[5].querySelector("button");

			quantityInput.id = generateDynamicId("quantity", i + 1);
			quantityInput.setAttribute("onchange", "updateQuantity(" + (i + 1)
					+ ")");
			increaseButton.setAttribute("onclick", "increaseQuantity("
					+ (i + 1) + ")");
			decreaseButton.setAttribute("onclick", "decreaseQuantity("
					+ (i + 1) + ")");
			removeButton.setAttribute("onclick", "removeRow(" + (i + 1) + ")");
		}

		updateTotalPrice();
	}
	// 초기 로딩 시 실행되는 함수
	document.addEventListener('DOMContentLoaded', function() {
		var tableBody = document.getElementById("selected-product-info-body");
		var rows = tableBody.getElementsByTagName("tr");

		for (var i = 0; i < rows.length; i++) {
			addRemoveButtonToRow(rows[i], i + 1);
		}

		updateIdsAndTotalPrice();
	});

	function removeRow(rowId) {
		var tableBody = document.getElementById("selected-product-info-body");
		var rows = tableBody.getElementsByTagName("tr");

		for (var i = 0; i < rows.length; i++) {
			var cells = rows[i].getElementsByTagName("td");
			var currentRowId = cells[0].id; // 첫 번째 셀의 id를 사용
			if (currentRowId === "select_product_name-" + rowId) {
				rows[i].parentNode.removeChild(rows[i]);

				// 업데이트된 ID로 요소들을 찾아 업데이트
				updateIdsAndTotalPrice();

				if (tableBody.rows.length === 0) {
					document.getElementById("selected-product-info").style.display = "none";
				}

				return;
			}
		}
	}
	///////////////////////// 이 위는 테이블 생성 등의 내용 이 아래는 테이블 정보 가져와서 서버에 보내는 내용 
	// 페이지 로드시 로그인 상태 체크 및 로그인 여부에 따른 처리
 function getCookie(cookieName) {
        var name = cookieName + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var cookieArray = decodedCookie.split(';');

        for (var i = 0; i < cookieArray.length; i++) {
            var cookie = cookieArray[i].trim();  // 좌우 공백 제거
            if (cookie.indexOf(name) == 0) {
                console.log('cookie:', cookie);
                return cookie.substring(name.length, cookie.length);
            }
        }

        return "";
    }
	
	
	
	function generateCookieID() {
    var cookieID = getCookie('cookieID');

    if (cookieID === "") {
        // 여기에서 적절한 방식으로 고유한 쿠키ID를 생성
        // 예시로 현재 시간을 사용하되, 보다 안전한 방법을 고려해야 합니다.
        var newCookieID = 'user_' + new Date().getTime();
        document.cookie = 'cookieID=' + newCookieID + '; path=/';
        console.log('New Cookie ID:', newCookieID);
        window.loginCheck = 0;  // 수정된 부분: 비로그인 상태이므로 0으로 설정
        
        return newCookieID;  // 생성한 쿠키ID를 반환
    }

    return cookieID;  // 이미 쿠키가 존재하는 경우 기존 쿠키ID를 반환
}
	
	
	function checkLoginStatus() {
    // 여기에서 세션 또는 쿠키 등을 사용하여 로그인 상태를 확인하고 loginCheck 변수 설정
    var isLoggedIn = ${sessionScope.loginMember != null};

    console.log("isLoggedIn:", isLoggedIn);

    // loginCheck 변수를 전역 변수로 설정
    window.loginCheck = isLoggedIn ? 1 : 0;

    console.log("window.loginCheck:", window.loginCheck); // 디버깅용 로그

    // 비로그인 상태일 때만 쿠키 생성 함수 호출
    if (!isLoggedIn) {
        generateCookieID();
    }
}
	


document.addEventListener('DOMContentLoaded', function () {
    checkLoginStatus(); // 페이지 로드시 로그인 상태 체크

    // 상품 주문하기 버튼 클릭 시
    document.querySelector('.order-btn').addEventListener('click', function () {
        var selectedOptionData = getTableDataWithCookie('selected_option_tbl');
        console.log(selectedOptionData); // 확인용 로그 추가

        if (selectedOptionData.length === 0) {
            alert('옵션을 선택해주세요.');
        } else {
            $.ajax({
                url: window.loginCheck === 1 ? 'product.order/member' : 'product.order/nonmember',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    data: selectedOptionData,
                  }),
                success: function (response) {
                    // 성공적으로 서버에서 응답을 받았을 때 수행할 로직
                    console.log('서버 응답:', response);
                    

                    // 응답에 따라 페이지 이동 처리
                    if (response === "response.nonmember") {
                        window.location.href = 'product.orderlist.nonmember';
                    } else if (response === "response.member") {
                        window.location.href = 'product.orderlist.member';
                    }
                },
                error: function (error) {
                    console.error('서버 오류:', error.responseText); // 오류 메시지 출력
                }
            });
        }
    });

       function getTableDataWithCookie(tableName) {
        var isLoggedIn = window.loginCheck === 1;
        var userIdentifier = getCookie('cookieID'); // 수정된 부분
        console.log('userIdentifier:', userIdentifier);

        var table = document.querySelector('[name="' + tableName + '"]');
        if (!table) {
            console.error('Table not found with name: ' + tableName);
            return [];
        }

        var tbody = table.querySelector('tbody');
        if (!tbody) {
            console.error('Table body not found');
            return [];
        }

        var rows = tbody.getElementsByTagName('tr');
        var rowData = [];

        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].getElementsByTagName('td');
            var quantityInput = cells[3].querySelector('input[type="text"]');
            var productInfo;

            if (isLoggedIn) {
                productInfo = {
                    memberOrder_productNo: "${Detail[0].P_PRODUCT_NO}",
                    memberOrder_productName: cells[0].innerText,
                    memberOrder_productColor: cells[1].innerText,
                    memberOrder_productSize: cells[2].innerText,
                    memberOrder_productQuantity: quantityInput.value,
                    memberOrder_productPrice: cells[4].innerText,
                    memberOrder_memberId: "${sessionScope.loginMember.m_id}"
                };
            } else {
                productInfo = {
                    NOrder_productNo: "${Detail[0].P_PRODUCT_NO}",
                    NOrder_productName: cells[0].innerText,
                    NOrder_productColor: cells[1].innerText,
                    NOrder_productSize: cells[2].innerText,
                    NOrder_productQuantity: quantityInput.value,
                    NOrder_productPrice: cells[4].innerText,
                    NOrder_cookieID: userIdentifier  // 수정된 부분
                };
            }

            // 배열에 추가
            rowData.push(productInfo);
        }

        return rowData;
    }

   
});
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

			<!-- 색상 및 사이즈 선택 옵션 -->
			<div class="option-selection">
				<label for="color">옵션 선택</label>
				<hr>
				색상: <select id="color" name="color"
					onchange="updateSelectedProductInfo()">
					<option value="">색상 선택</option>
					<c:forEach var="color" items="${ColorList}">
						<option value="${color}">${color}</option>
					</c:forEach>
				</select> <label for="size">/</label> 사이즈: <select id="size" name="size"
					onchange="updateSelectedProductInfo()">
					<option value="">사이즈 선택</option>
					<c:forEach var="size" items="${SizeList}">
						<option value="${size}">${size}</option>
					</c:forEach>
				</select>
			</div>


			<!-- 선택한 제품 정보 표시 부분 -->

			<div class="selected-product-info" style="display: none;">
				<table name="selected_option_tbl">
					<thead>
						<tr>
							<th>상품명</th>
							<th>색상</th>
							<th>사이즈</th>
							<th>수량</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody id="selected-product-info-body">
						<!-- Table rows will be dynamically added here -->
					</tbody>
				</table>
			</div>

			<div id="totalPrice">전체 가격: 0원</div>

		</div>


		<div class="order-buttons">
			<button class="order-btn">상품 주문하기</button>
			<button class="cart-btn">장바구니 담기</button>
			<button class="wishlist-btn">위시리스트 담기</button>
		</div>
		<!-- form 엘리먼트 -->
		<form id="orderForm" style="display: none;" method="POST" >
			<!-- form에 전송될 데이터 입력 필드들 -->
			<input type="hidden" id="orderData" name="data" value="">
			<!-- 비로그인인 경우에만 쿠키ID 전송 -->
			<input type="hidden" id="cookieID" name="cookieID" value="">
		</form>
	</div>


	<c:forEach var="p" items="${Detail}">
		<hr>
		<div style="text-align: center;">
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
