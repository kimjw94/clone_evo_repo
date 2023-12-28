<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		
		$("#iAdddBtn").click(function() {
			$("#iAdd" + delNum).after(
				"<div id='iAdd" + delNum2 + "'>"
				+ "<input name='i_product_color" + colorNum + "' id='i_product_color" + colorNum + "' style='width:66px; margin-right: 5px; margint-top: 5px;' placeholder='색상'>"
				+ "<input name='i_product_size" + sizeNum + "' id='i_product_size" + sizeNum + "' style='width: 66px; margin-right: 5px; margint-top: 5px; text-transform: uppercase;' placeholder='사이즈'>"
				+ "<input name='i_product_count" + countNum + "' id='i_product_count" + countNum + "' style='width:66px; margin-right: 5px; margin-top: 5px;' placeholder='수량'>"
				+ "<button id='scBtn" + delNum +"' type='button' style='width:60px; height:33px' onclick='delBtn(this.id)'>삭제</button> "
				+ "</div>"
			);
			
			sizeNum = parseInt(sizeNum) + 1;
			countNum = parseInt(countNum) + 1;
			colorNum = parseInt(colorNum) + 1;
			delNum = parseInt(delNum) + 1;
			delNum2 = parseInt(delNum) + 1;
		})
		
		// 엔터키 입력 시 추가 이벤트
		$(document).on("keydown", 'input', function(e) {
			var count = 2;
			var idx = $('input').index(this);
			var addInput = document.querySelector('#iAdd' + count);
			
			console.log(idx);
			
			if(e.keyCode === 13) {
				e.preventDefault();
				$('input').eq(idx+1).focus();
				
				if(idx % 3 == 2) {
					addInven();
					$('input').eq(idx+1).focus();
					
				}
			}
		})
		
	});

	var colorNum = 2;
	var sizeNum = 2;
	var countNum = 2;
	var delNum = 1;
	var delNum2 = 2;
	
function addInven() {
	
	var resetAdd = document.getElementById("iAdd1").nextElementSibling;
	
	if(resetAdd == null) {
		colorNum = 2;
		sizeNum = 2;
		countNum = 2;
		delNum = 1;
		delNum2 = 2;
	}
	
	$("#iAdd" + delNum).after(
			"<div id='iAdd" + delNum2 + "'>"
			+ "<input name='i_product_color" + colorNum + "' id='i_product_color" + colorNum + "' style='width:66px; margin-right: 5px; margint-top: 5px;' placeholder='색상'>"
			+ "<input name='i_product_size" + sizeNum + "' id='i_product_size" + sizeNum + "' style='width: 66px; margin-right: 5px; margint-top: 5px; text-transform: uppercase;' placeholder='사이즈'>"
			+ "<input name='i_product_count" + countNum + "' id='i_product_count" + countNum + "' style='width:66px; margin-right: 5px; margin-top: 5px;' placeholder='수량'>"
			+ "<button id='scBtn" + delNum +"' type='button' style='width:60px; height:33px' onclick='delBtn(this.id)'>삭제</button> "
			+ "</div>"
		);
		
	sizeNum = parseInt(sizeNum) + 1;
	countNum = parseInt(countNum) + 1;
	colorNum = parseInt(colorNum) + 1;
	delNum = parseInt(delNum) + 1;
	delNum2 = parseInt(delNum) + 1;
}
	
function delBtn(click_id) {
	var delTr = $('#' + click_id).parent().attr("id");
	$('div').remove('#' + delTr);
}


function check() {
	let productName = document.getElementById("p_product_name");
	let thumbImg = $("#im_thumbnail_image").val();
	let category = $("#p_category_code option:selected").val();
	let color = document.getElementById("i_product_color1");
	let size = document.getElementById("i_product_size1");
	let cnt = document.getElementById("i_product_count1");
	let price = document.getElementById("p_price");
	let info = document.getElementById("p_info");
	

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
		
		if(info.value == "") {
			alert("상품설명을 입력해주세요.");
			info.focus();
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
		
		if(cnt.value == "") {
			alert("수량을 입력해주세요.");
			cnt.focus();
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
		<div align="center" class="nfont" id="tpTitle">상품 추가</div>
		<div align="left" class="prodContainer">
			<div>
				<div class="proTitle">상품명</div>
				<div><input placeholder="상품명" name="p_product_name" id="p_product_name"></div>
			</div>
			<div>
				<div class="proTitle">카테고리</div>
				<div>
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
				</div>
			</div>
			<div>
				<div class="proTitle">상품 썸네일 사진</div>
				<div><input type="file" name="im_thumbnail_image" id="im_thumbnail_image"></div>
				<div class="infor">사진은 최대 30mb까지 가능합니다.</div>
			</div>
			<div>
				<div class="proTitle">상품 설명 이미지</div>
				<div><input type="file" name="im_info_image" id="im_info_image"></div>
				<div class="infor">사진은 최대 30mb까지 가능합니다.</div>
			</div>
			<div>
				<div class="proTitle">상품 설명</div>
				<div><textarea name="p_info" id="p_info" placeholder="상품설명" cols="29" rows="8" maxlength="250"></textarea></div>
			</div>
			<div>
				<div class="proTitle">색상 및 사이즈, 수량</div>
				<div id="iAdd1">
					<input name="i_product_color1" id="i_product_color1" style="width:66px;" placeholder="색상">
					<input name="i_product_size1" id="i_product_size1" style='width:66px; text-transform: uppercase;' placeholder="사이즈">
					<input name="i_product_count1" id="i_product_count1" style='width:66px;' type='number' placeholder="수량">
					<button id="iAddBtn" style="width:60px; height:33px;" type="button" onclick="addInven()">추가</button>
				</div>
			</div>
			<div>
				<div class="proTitle">가격</div>
				<div><input placeholder="가격" type="number" name="p_price" id="p_price"></div>
			</div>
		</div>
		<div align="center" class="addBtn">
			<button class="btn-black" id="productAddBtn">추가</button>
		</div>
	</form>
</body>
</html>