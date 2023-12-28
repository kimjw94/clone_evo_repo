<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/detailProduct.js"></script>
</head>
<body>
	<form action="product.modiProduct" method="POST" enctype="multipart/form-data" onsubmit="return check();">
		<div align="center" class="nfont" id="tpTitle">상품 수정</div>
		<div align="left" class="prodContainer">
		<c:forEach var="p" items="${detailProduct }">
			<div>
				<div class="proTitle">상품명</div>
				<div><input placeholder="상품명" name="p_product_name" id="p_product_name" value="${p.P_PRODUCT_NAME }"></div>
				<div><input name="p_product_no" type="hidden" value=${p.P_PRODUCT_NO }></div>
			</div>
			<div>
				<div class="proTitle">카테고리</div>
				<div id="categoryDiv">
					<label>
						<select id="category">
							<option value="${p.C_CATEGORY_CODE }">${p.C_CATEGORY_NAME }</option>
						</select>
					</label>
					<label>
						<select id="p_category_code" name="p_category_code" id="p_category_code">
							<option value="${p.D_CATEGORY_DETAIL_CODE }">${p.D_CATEGORY_DETAIL_NAME }</option>
						</select>
					</label>
					<button id="categoryChange" type="button">수정</button>
				</div>
			</div>
			<div>
				<div class="proTitle">상품 썸네일 사진</div>
				<div><img src="resources/thumbnailImg/${p.IM_THUMBNAIL_IMAGE}"></div>
				<div><input type="file" name="im_thumbnail_image" id="im_thumbnail_image"></div>
				<div class="infor" id="thumbImg">사진은 최대 30mb까지 가능합니다.</div>
			</div>
			<div>
				<div class="proTitle">상품 설명 이미지</div>
				<div><img src="resources/infoImg/${p.IM_INFO_IMAGE}"></div>
				<div><input type="file" name="im_info_image" id="im_info_image"></div>
				<div class="infor" id="infoImg">사진은 최대 30mb까지 가능합니다.</div>
			</div>
			<div>
				<div class="proTitle">상품 설명</div>
				<div><textarea name="p_info" id="p_info" placeholder="상품설명" cols="29" rows="8" maxlength="250">${p.P_INFO }</textarea></div>
			</div>
			<div id="modiDiv">
				<div class="proTitle">색상 및 사이즈, 수량</div>
				<div id="mmDiv">
					<c:forEach var="i" items="${detailInventory}" varStatus="vs">
						<div id="iAdd${vs.count }">
							<input class="detailPro" name="i_product_color${vs.count }" id="i_product_color${vs.count }"  placeholder="색상" value="${i.I_PRODUCT_COLOR }"  readonly >
							<input class="detailPro" name="i_product_size${vs.count }" id="i_product_size${vs.count }" style=' text-transform: uppercase;' placeholder="사이즈" value="${i.I_PRODUCT_SIZE }" readonly>
							<input class="detailPro" name="i_product_count${vs.count }" id="i_product_count${vs.count }" type='number' placeholder="수량" value="${i.I_PRODUCT_COUNT}" readonly>
							<button id="mdBtn${vs.count }" type="button" style='width:60px; height:33px' onclick="modiBtn(this.id)">수정</button>	
							<c:if test="${vs.count != 1}">
								<button id="scBtn${vs.index }" type="button" style='width:60px; height:33px' onclick="deleteBtn(this.id)">삭제</button>
							</c:if>
						</div>
					</c:forEach>
				</div>
				<button id="iAddBtn" type="button" style="margin-top: 20px; width:230px; height:35px;">추가</button>
			</div>
			<div>
				<div class="proTitle">가격</div>
				<div><input placeholder="가격" type="number" name="p_price" id="p_price" value="${p.P_PRICE }"></div>
			</div>
			</c:forEach>
		</div>
		<div align="center" class="addBtn">
			<button class="btn-black" id="productAddBtn">수정</button>
			<button class="btn-black" id="productDelBtn" type="button" onclick="return delLink(this.form);">삭제</button>
		</div>
	</form>
</body>
</html>