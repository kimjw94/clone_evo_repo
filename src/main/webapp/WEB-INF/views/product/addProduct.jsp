<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	function dCategory() {
		var category = $("#category" option:selected).val();
		
		$.ajax({
			type: "POST",
			url: "product.getDetailCategory",
			data: {category},
			success: function(data) {
				if(typeof(category) != "undefined") {
					var list = data;
					
					$(list).each(function(i) {
						var detailCate = list[i].D_CATEGORY_NAME;
						$("#detailCate").append("<option value=" + list[i].D_CATEGORY_CODE + ">"
							+ detailCate + "</option>");
					})
				else {
					alert("오류ㅠㅠㅠ");
					}
				},
				error: function(error) {
					alert(error);
				}
			}
		})
		
	};
}
	
</script>
</head>
<body>
	<form action="addProduct" method="POST" enctype="multipart/form-data">
		<div class="addpd">
			<div align="center">
				<input placeholder="상품명">
			</div>
			<div align="center">
				<label >
					<select id="category" onchange="dCategory();">
						<c:forEach var="c" items="${categoryName }">
							<option>선택</option>
							<option value="${c.C_CATEGORY_CODE }">${c.C_CATEGORY_NAME }</option>
						</c:forEach>
					</select>
				</label>
				<label>
					<select id="detailCate">
						<option>선택</option>
					</select>
				</label>
			</div>
		</div>
	</form>
</body>
</html>