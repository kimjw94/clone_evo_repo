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
			
			var detailC = $("#detailCate").find('option');
			var category = document.getElementById("category");
			var detailCate = document.getElementById("detailCate");
			var cCode = (category.options[category.selectedIndex].value);
			
			
			if(detailC != undefined) {
				detailC.remove();
			}
			
			if(detailCate != null) {
				$.ajax({
					type: "POST",
					url: "product.getDetailCategory",
					data: {categoryCode : cCode},
					success: function(data) {
						if(typeof(category) != "undefined") {
							var list = data;
							
							$(list).each(function(i) {
								var detailCate = list[i].D_CATEGORY_DETAIL_NAME;
								$("#detailCate").append("<option value=" + list[i].D_CATEGORY_DETAIL_CODE + ">"
									+ detailCate  + "</option>");
							})
						}
						else { alert("오류ㅠㅠㅠ");}
						},
						
					error: function(error) {
							alert("에러입니다 : " + error);
					}	
				})
			} else {
				detailCate.remove();
			}
			
		})
	
	});

	
</script>
</head>
<body>
	<form action="addProduct" method="POST" enctype="multipart/form-data">
		<table class="m_signup" align="center">
			<tr>
				<td colspan="4" align="center" class="title" id="tTitle">상품 추가</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input placeholder="상품명"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<label> 
					<select id="category">
						<option value="">선택</option>
						<c:forEach var="c" items="${categoryName }">
							<option value="${c.C_CATEGORY_CODE }">${c.C_CATEGORY_NAME }</option>
						</c:forEach>
					</select>
				</label> 
				<label> 
					<select id="detailCate">
					</select>
				</label>
				</td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td><input placeholder="상품설명"></td>
			</tr>
			<tr>
				<th>상품사진</th>
				<td><input type="file"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input placeholder="가격"></td>
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