<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
	$(function() {
		var colorNum = 1;
		var sizeNum = 1;
		
		$('#category').change(function() {
			
			var detailC = $("#p_category_code").find('option');
			var category = document.getElementById("category");
			var detailCate = document.getElementById("p_category_code");
			var cCode = (category.options[category.selectedIndex].value);
			
			// 재선택시 세부카테고리 초기화
			if(detailC != undefined) {
				detailC.remove();
			}

			// 카테고리 선택 클릭 시 if문 못 들어감! 
			if(!isNaN(cCode)) {
				$.ajax({
					type: "POST",
					url: "product.getDetailCategory",
					data: {categoryCode : cCode},
					success: function(data) {
						if(typeof(category) != "undefined") {
							var list = data;
							
							$(list).each(function(i) {
								var detailCate = list[i].D_CATEGORY_DETAIL_NAME;
								$("#p_category_code").append("<option value=" + list[i].D_CATEGORY_DETAIL_CODE + ">"
									+ detailCate  + "</option>");
							})
						}
						else { alert("오류입니다. 다시 선택해주세요.");}
						},
						
					error: function(error) {
							alert("에러입니다 : " + error);
					}	
				})
			}
		})
		
		$("#colorBtn").click(function() {
			
			$("#addColor").after(
					"<tr><th>추가 색상</th><td><input name=i_product_color" + colorNum
					+ " style='width:100px;'></td></tr>" 
			);
			
			colorNum = parseInt(colorNum) + 1;
		})
		
		$("#sizeBtn").click(function() {
			$("#addSize").after(
					"<tr><th>추가 사이즈</th><td><input name=i_product_size" + sizeNum
					+ " style='width:100px;'></td></tr>"
			);
			
			sizeNum = parseInt(sizeNum) + 1;
		})
	
	});

function check() {
	let productName = document.getElementById("p_product_name");
	let thumbImg = $("#im_thumbnail_image").val();
	let category = $("#p_category_code option:selected").val();
	let color = document.getElementById("i_product_color");
	let size = document.getElementById("i_product_size");
	let price = document.getElementById("p_price");
	
	try {
		if(productName.value == "" ) {
			alert("상품명을 입력해주세요.");
			productName.focus();
			return false;
		}
		

		if(category = "" || category == undefined) {
			alert("카테고리를 선택해주세요.");
			return false;
		}
		
		if(!thumbImg) {
			alert("썸네일 이미지를 등록해주세요.");
			return false;
		}

		if(color.value == "") {
			alert("색상을 입력해주세요.");
			color.focus();
			return false;
		}
		
		if(size.value == "") {
			alert("사이즈를 입력해주세요.");
			size.focus();
			return false;
		} 
		
		if(price.value == "") {
			alert("가격을 입력해주세요.");
			price.focus();
			return false;
		} else {
			return true;
		}
	} catch(error) {
		console.log(error);
		alert("오류입니다. 다시 시도해주세요.");
		return false;
	}
	
}
	
</script>
</head>
<body>
	<form action="product.addProduct" method="POST" enctype="multipart/form-data" onsubmit="return check();">
		<table class="m_signup" align="center">
			<tr>
				<td colspan="4" align="center" class="nfont" id="tpTitle">상품 추가</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input placeholder="상품명" name="p_product_name" id="p_product_name"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<label> 
					<select id="category">
						<option value="choice">선택</option>
						<c:forEach var="c" items="${categoryName }">
							<option value="${c.C_CATEGORY_CODE }">${c.C_CATEGORY_NAME }</option>
						</c:forEach>
					</select>
				</label> 
				<label> 
					<select id="p_category_code" name="p_category_code" id="p_category_code">
					</select>
				</label>
				</td>
			</tr>
			<tr>
				<th>상품 썸네일 사진</th>
				<td><input type="file" name="im_thumbnail_image" id="im_thumbnail_image"></td>
			</tr>
			<tr>
				<th>상품 설명 이미지</th>
				<td><input type="file" name="im_info_image" id="im_info_image"></td>
			</tr>
			<tr>
				<th>상품 설명</th>
				<td><textarea name="p_info" placeholder="상품설명" cols="29" rows="8" maxlength="250"></textarea></td>
			</tr>
			<tr id="addColor">
				<th>색상</th>
				<td><input name="i_product_color" id="i_product_color"></td>
				<td><button id="colorBtn" style="width:80px; height:33px;" type="button">색상 추가</button></td>
			</tr>
			
			<tr id="addSize">
				<th>사이즈</th>
				<td><input name="i_product_size" id="i_product_size"></td>
				<td><button id="sizeBtn" style="width:90px; height:33px;" type="button">사이즈 추가</button></td>
			</tr> 
			<tr>
				<th>가격</th>
				<td><input placeholder="가격" type="number" name="p_price" id="p_price"></td>
				
			</tr>
			<tr>
				<td colspan="2" align="center" class="signupTd">
					<button class="btn-black" id="signupBtn">추가</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>