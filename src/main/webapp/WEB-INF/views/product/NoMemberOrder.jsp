<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">

    function address_search() {
        new daum.Postcode({
            oncomplete : function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    addr += extraAddr;
                } else {
                    addr += ' ';
                }

                document.getElementById('address input1').value = data.zonecode;
                document.getElementById("address input2").value = addr;
                document.getElementById("address input3").focus();
            }
        }).open();
    }
//
    document.addEventListener('DOMContentLoaded', function () {
        updateTotalPriceDisplay();
        generateProductNames();
        console.log('Product Names:', productNames);
    });

    var orderTable = document.getElementById('order-table');
    if (orderTable) {
        orderTable.addEventListener('input', function (event) {
            var target = event.target;
            if (target.classList.contains('product-quantity') || target.classList.contains('product-price')) {
                updateTotalPriceDisplay();
            }
        });
    }

    function calculateTotalPrice() {
        var totalPrice = 0;
        var orderRows = document.querySelectorAll('.order-row');
        orderRows.forEach(function (row) {
            var quantityElement = row.querySelector('.product-quantity');
            var priceElement = row.querySelector('.product-price');

            if (quantityElement && priceElement) {
                var quantity = parseInt(quantityElement.innerText, 10);
                var price = parseFloat(priceElement.innerText);
                totalPrice += quantity * price;
            }
        });
        return totalPrice.toFixed(0);
    }

    function updateTotalPriceDisplay() {
        var totalPrice = calculateTotalPrice();
        document.getElementById('total-price-display').innerText = '총 가격: ' + totalPrice + '원';
    }

    function generateProductNames() {
        var productNames = [];
        var orderRows = document.querySelectorAll('.order-row');

        orderRows.forEach(function (row) {
            var productNameElement = row.querySelector('.order-row td:nth-child(2)');
            if (productNameElement) {
                var productName = productNameElement.innerText;
                productNames.push(productName);
            }
        });

        return productNames;
    }

    function generateUniqueOrderNumber() {
        var timestamp = new Date().getTime();
        var randomNumber = Math.floor(Math.random() * 1000);
        return 'ORDER_' + timestamp + '_' + randomNumber;
    }

    // 서버에서 전달된 상품명 배열 사용
    var productNames = [
        <c:forEach var="order" items="${nonMemberOrder}" varStatus="loop">
            '${order.NORDER_PRODUCTNAME}'${!loop.last ? ',' : ''}
        </c:forEach>
    ];

 // 아임포트 결제창 열기
   // 기존 아임포트 초기화 부분
// var IMP = window.IMP;
// IMP.init('imp85536486');

// 페이코용 아임포트 초기화
var IMP = window.IMP;
IMP.init('imp85536486');

function requestPay() {
  var totalAmount = calculateTotalPrice();
  var uniqueOrderNumber = generateUniqueOrderNumber();

  IMP.request_pay(
    {
      pg: "payco", // 페이코 간편결제 설정
      pay_method: "card",
      merchant_uid: uniqueOrderNumber,
      name: productNames.join(', '),
      amount: totalAmount,
      buyer_name: document.querySelector('input[name="order_name"]').value,
      buyer_tel: document.querySelector('input[name="order_phone"]').value,
      buyer_addr: document.querySelector('input[name="order_address2"]').value,
      buyer_postcode: document.querySelector('input[name="order_address1"]').value,
      // 기타 필요한 결제 정보 추가
      custom_data: { // 페이코 특화 custom_data 설정
        CPID: "PARTNERTEST", // PG 상점 아이디
        PRODUCTID: "PROD_EASY", // 상품 ID
        SELLERKEY: "S0FSJE", // 판매자 키
      },
    },
    function (rsp) {
      // callback
      if (rsp.success) {
        console.log(rsp);
        sendOrderDetails(uniqueOrderNumber);
      } else {
        console.log(rsp);
      }
    }
  );
}

function sendOrderDetails(uniqueOrderNumber) {
    // 주문자 정보
    var orderName = document.querySelector('input[name="order_name"]').value;
    var orderPhone = document.querySelector('input[name="order_phone"]').value;

    // 배송 정보
    var orderAddress1 = document.querySelector('input[name="order_address1"]').value;
    var orderAddress2 = document.querySelector('input[name="order_address2"]').value;
    var orderAddress3 = document.querySelector('input[name="order_address3"]').value;

    // 주문 상품 정보
    var productNames = generateProductNames(); // 이미 구현된 함수 사용
    var totalAmount = calculateTotalPrice();

    // 사용자 ID 가져오기 (예시로 getCookieID 함수 사용)
    var orderID = getCookie('cookieID');

    // 주문 데이터 생성
    var orderData = {
        data: [
            {
                p_orderID: orderID,
                p_orderNum: uniqueOrderNumber,
                p_orderName: orderName,
                p_orderPhone: orderPhone,
                p_orderAddressNum: orderAddress1,
                p_orderAddress: orderAddress2 + ' ' + orderAddress3,
                p_productNames: productNames.join(', '),
                p_totalAmount: totalAmount
            }
        ]
    };

    // 주문 세부 정보를 서버에 전송하기 위한 AJAX 호출
    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: "product.payedorder.nonmember",
        data: JSON.stringify(orderData),
        success: function (response) {
            console.log("주문 세부 정보 전송 성공");
            window.location.href = "order_success";
        },
        error: function (error) {
            console.error("주문 세부 정보 전송 중 오류 발생", error);
        }
    });
}

	// 예시로 사용자 ID를 쿠키에서 가져오는 함수
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
</script>

</head>
<body>
	<div align=center>
		<div class="pagenation">
			<div class="nav_sub">
				<a href="/">EVO</a> > <span>비회원 주문</span>
			</div>
		</div>
		<div class="section order_delivery">
			<div class="order_delivery__inner">
				<h3 class="order__title">주문자 정보</h3>
				<ul class="order_list">
					<li class="oreder__item order__item--name"><span
						class="order__item__label">이름</span>
						<div class="order_item_area">
							<input type="text" class="order_input" name="order_name"
								placeholder="이름을 입력해주세요." maxlength="20">
						</div></li>
					<li class="oreder__item oreder__item--phone"><span
						class="order__item__label">휴대전화</span>
						<div class="order__item__area">
							<input name="order_phone">
						</div></li>
				</ul>
			</div>

			<div class="order__delivery_inner">
				<h3 class="order__title">배송정보</h3>
				<ul>
					<li><label for="s_address">주소</label></li>
					<li><input type="text" name="order_address1"
						id="address input1" class="" readonly="readonly">
						<button type="button" onclick="address_search()" class="btn-black">검색</button>
					</li>
					<li><input type="text" name="order_address2"
						id="address input2" class="" readonly="readonly"></li>
					<li><input type="text" name="order_address3"
						id="address input3" class="" placeholder="상세주소"></li>
				</ul>
			</div>
			<h2>비회원 장바구니</h2>

			<c:if test="${not empty nonMemberOrder}">
				<table border="1" id="order-table">
					<thead>
						<tr>
							<th>썸네일 이미지</th>
							<th>제품 이름</th>
							<th>제품 색상</th>
							<th>제품 크기</th>
							<th>총 수량</th>
							<th>총 가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${nonMemberOrder}">
							<tr class="order-row">
								<td><img
									src="resources/thumnailImg/${order.IM_THUMBNAIL_IMAGE}"
									alt="썸네일 이미지" width="50px" height="50px;"></td>
								<td>${order.NORDER_PRODUCTNAME}</td>
								<td>${order.NORDER_PRODUCTCOLOR}</td>
								<td>${order.NORDER_PRODUCTSIZE}</td>
								<td class="product-quantity">${order.NORDER_PRODUCTQUANTITY}</td>
								<td class="product-price">${order.NORDER_PRODUCTPRICE}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<c:if test="${empty nonMemberOrder}">
					<p>주문 내역이 없습니다.</p>
				</c:if>
			</c:if>

			<div id="total-price-display">총 가격: 0원</div>

			<div class="section order_payment">
				<button type="button" onclick="requestPay()" class="btn-payment">결제하기</button>
			</div>
		</div>
	</div>
</body>
</html>
