<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
	$(function() {
		
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
	
	});

	
</script>
</head>
<body>
	<form action="product.addProduct" method="POST" enctype="multipart/form-data">
		<table class="m_signup" align="center">
			<tr>
				<td colspan="4" align="center" class="nfont" id="tpTitle">상품 추가</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input placeholder="상품명" name="p_product_name"></td>
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
					<select id="p_category_code" name="p_category_code">
					</select>
				</label>
				</td>
			</tr>
			<tr>
				<th>상품사진</th>
				<td><input type="file" name="p_photo"></td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td><textarea name="p_info" placeholder="상품설명" cols="29" rows="8" maxlength="250"></textarea></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input placeholder="가격" type="number" name="p_price"></td>
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