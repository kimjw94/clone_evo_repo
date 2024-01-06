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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">


	function address_search() {

		new daum.Postcode(
				{
					oncomplete : function(data) {

						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							addr += extraAddr;

						} else {
							addr += ' ';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('address input1').value = data.zonecode;
						document.getElementById("address input2").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("address input3").focus();

					}
				}).open();

	}
	
	document.addEventListener('DOMContentLoaded', function () {
        updateTotalPriceDisplay();
    });

    // 주문 테이블에서 수량과 가격이 변경될 때마다 총 가격을 업데이트
    var orderTable = document.getElementById('order-table');
    orderTable.addEventListener('input', function (event) {
        var target = event.target;
        
        // 수량 또는 가격이 변경된 경우에만 업데이트 수행
        if (target.classList.contains('product-quantity') || target.classList.contains('product-price')) {
            updateTotalPriceDisplay();
        }
    });

    function calculateTotalPrice() {
        var totalPrice = 0;
        var orderRows = document.querySelectorAll('.order-row');

        orderRows.forEach(function (row) {
            var quantity = parseInt(row.querySelector('.product-quantity').innerText, 10);
            var price = parseFloat(row.querySelector('.product-price').innerText);
            totalPrice += quantity * price;
        });

        return totalPrice.toFixed(0); // 달러 표시를 하지 않고 원으로 표시
    }

    // 총 가격을 화면에 출력하는 함수
    function updateTotalPriceDisplay() {
        var totalPrice = calculateTotalPrice();
        document.getElementById('total-price-display').innerText = '총 가격: ' + totalPrice + '원';
    }
    
    function startPayment() {
        // 여기에서 결제 정보를 설정합니다.
        const paymentData = {
            merchant_uid: '주문번호 또는 고유값', // 유일한 주문 번호를 생성하여 전달
            name: '상품명', // 상품명
            amount: 1000, // 결제할 금액
            buyer_name: document.querySelector('input[name="order_name"]').value, // 주문자 이름
            buyer_tel: document.querySelector('input[name="order_phone"]').value, // 주문자 휴대전화번호
            buyer_addr: document.querySelector('input[name="order_address2"]').value, // 주문자 주소
            buyer_postcode: document.querySelector('input[name="order_address1"]').value, // 주문자 우편번호
            // 기타 필요한 결제 정보 추가
        };

        // 아임포트 결제창 열기
        const { IMP } = window;
        IMP.init('your_imp_public_key'); // 아임포트에서 발급받은 고유한 키로 대체
        IMP.request_pay(paymentData, callback);
    }

    function callback(response) {
        if (response.success) {
            // 결제 성공 시 여기에서 서버로 결제 정보 전송 등 추가 작업 가능
            alert('결제가 완료되었습니다!');
        } else {
            // 결제 실패 시 작업
            alert(`결제 실패: ${response.error_msg}`);
        }
    }
</script>

</head>
<body>
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
			<button type="button" onclick="startPayment()" class="btn-payment">결제하기</button>
		</div>
	</div>

</body>
</html>