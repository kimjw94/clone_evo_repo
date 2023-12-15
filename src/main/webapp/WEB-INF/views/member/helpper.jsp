<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evo</title>
<script>
	$(function() {
		var colorNum = 1;
		var sizeNum = 1;

		$('#category')
				.change(
						function() {

							var detailC = $("#p_category_code").find('option');
							var category = document.getElementById("category");
							var detailCate = document
									.getElementById("p_category_code");
							var cCode = (category.options[category.selectedIndex].value);

							// 재선택시 세부카테고리 초기화
							if (detailC != undefined) {
								detailC.remove();
							}

							// 카테고리 선택 클릭 시 if문 못 들어감! 
							if (!isNaN(cCode)) {
								$
										.ajax({
											type : "POST",
											url : "member.getDetailCategory",
											data : {
												categoryCode : cCode
											},
											success : function(data) {
												if (typeof (category) != "undefined") {
													var list = data;

													$(list)
															.each(
																	function(i) {
																		var detailCate = list[i].S_S_CATE_NAME;
																		$(
																				"#p_category_code")
																				.append(
																						"<option value=" + list[i].S_S_CATE_CODE + ">"
																								+ detailCate
																								+ "</option>");
																	})
												} else {
													alert("오류입니다. 다시 선택해주세요.");
												}
											},

											error : function(error) {
												alert("에러입니다 : " + error);
											}
										})
							}
						})
	});
</script>
</head>
<body>
	<form action="member.helpper" method="post" enctype="multipart/form-data">
		<div>1:1 문의하기</div>
		<hr />
		<div>
			<div align="left">
				<div>문의 유형</div>
				<div>
					<label> <select id="category">
							<option value="choice">선택</option>
							<c:forEach var="c" items="${categoryName }">
								<option value="${c.R_CATE_CODE }">${c.R_CATE_NAME }</option>
							</c:forEach>
					</select>
					</label> <label> <select name="p_category_code"
						id="p_category_code">
					</select>
					</label>
				</div>
			</div>
			<div>
				<div>
					<label for="h_title">주문 번호</label>
				</div>
				<div>
					<input type="text" id="h_title" name="h_title" >
				</div>
			</div>
			<div>
				<div>
					상품 내용
				</div>
				<div align="center">
					<input type="text" id="h_cont" name="h_cont" style="width: 1000px; height: 400px;">
				</div>
			</div>
			<div align="left">
				<!-- 이미지 업로드 창 -->
				<div>
					<input type="file" name="imageUpload">
				</div>
			</div>
			<div align="right">
				<div>
					<button>문의하기</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>