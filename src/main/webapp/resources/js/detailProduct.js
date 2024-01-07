
$(function() {
	var colorNum = 2;
	var sizeNum = 2;
	var countNum = 2;
	var delNum = 1;
	var delNum2 = 2;

	
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

	})
	
	$("#categoryChange").click(function() {
		var delCate = $("#categoryDiv").find('select:eq(0)').children('option');
		var delDCate = $("#categoryDiv").find('select:eq(1)').children('option');
		var category = document.getElementById("category");
		
		if(delCate != undefined && delDCate != undefined) {
			delCate.remove();
			delDCate.remove();
			$("#categoryChange").remove();
		}
		
		$.ajax({
			type:"POST",
			url: "product.getCategory",
			success: function(data) {
				if(typeof(category) != "undefined") {
					
					var list = data;
					$(list).each(function(i) {
						var cate = list[i].C_CATEGORY_NAME;
						$("#category").append("<option value=" + list[i].C_CATEGORY_CODE + ">"
								+ cate + "</option>");
					
					})
				} else { alert("오류입니다. 다시 시도해주세요"); }
			},
			error: function(error) {
				alert("에러입니다: " + error);
			}
		
		})
	})
	
	
	$("#iAddBtn").click(function() {
		var prev = document.getElementById("mmDiv").lastElementChild.id;
		var lastStr = parseInt(prev[prev.length - 1]);
		sizeNum = lastStr + 1;
		countNum = lastStr + 1;
		colorNum = lastStr + 1;
		delNum = lastStr + 1;
		delNum2 = delNum + 1;
		console.log("sizeNum" + sizeNum);
		console.log("delNum : " + delNum);
		console.log("delNum2 : " + delNum2);
		
		
		$("#iAdd" + lastStr).after(
			"<div id='iAdd" + delNum + "'>"
			+ "<input name='a_product_color" + colorNum + "' id='i_product_color" + colorNum + "' style='width:66px; margin-right: 5px; margint-top: 5px;' placeholder='색상'>"
			+ "<input name='a_product_size" + sizeNum + "' id='i_product_size" + sizeNum + "' style='width: 66px; margin-right: 5px; margint-top: 5px; text-transform: uppercase;' placeholder='사이즈'>"
			+ "<input name='a_product_count" + countNum + "' id='i_product_count" + countNum + "' type='number' style='width:66px; margin-right: 5px; margin-top: 5px;' placeholder='수량'>"
			+ "<button id='scBtn" + delNum +"' type='button' style='width:60px; height:33px' onclick='delBtn(this.id)'>삭제</button> "
			+ "</div>"
		);
		
		sizeNum = parseInt(sizeNum) + 1;
		countNum = parseInt(countNum) + 1;
		colorNum = parseInt(colorNum) + 1;
		delNum = parseInt(delNum) + 1;
	})
	
	
	$("#im_info_image").change(function() {
		var imgF = $("#im_info_image").val();
		
		if(imgF) {
			$("#infoImg").after(
				"<div class='infor' id='infoI'>변경된 사진이 있습니다. " 
				+ "<button type='button' id='infoImgDel' onclick='delImg(im_info_image)'>삭제</button></div>"
			);
		}
	})
	
	$("#im_thumbnail_image").change(function() {
		var imgS = $("#im_thumbnail_image").val();
		console.log(imgS);
		
		if(imgS) {
			$("#thumbImg").after(
				"<div class='thumb' id='thumbI'>변경된 사진이 있습니다."
				+ "<button type='button' id='thumbImgDel' onclick='delImg(im_thumbnail_image)'>삭제</button></div>"
			);
		}
	})
	
});

var flag = true;

function delImg(click_file) {
	$('#' + click_file.id).val('');
	
	if(click_file.id == 'im_info_image') {
		$("#infoI").remove();
	} else if(click_file.id == 'im_thumbnail_image') {
		$("#thumbI").remove();
	}
	
}
	
function delBtn(click_id) {
	var delTr = $('#' + click_id).parent().attr("id");
	console.log(delTr);
	$('div').remove('#' + delTr);
}

// 재고 수정 버튼 클릭시
function modiBtn(click_id){
	var inputs = [];
	var originInven = {};
	var cId = document.getElementById(click_id);
	var ele = cId.previousElementSibling;
	var eleV;
	var elek;
	var eleK;
	
	if(!flag) {
		alert("변경된 색상 및 사이즈, 수량이 존재합니다. 확인을 클릭 후 진행해주세요.");
		return;
	}
	
	for(var i = 0; i < 3; i++) {
		elek = ele.name;
		eleV = ele.value;
		eleK = elek.replace(/[0-9]/g, "");
		eleK = eleK + 'o';
		originInven[eleK] = eleV;
		inputs.push(ele);
		ele = ele.previousElementSibling;
	}
	
	inputs.forEach(function(input) {
		input.removeAttribute('readonly');
	})
	
	$.ajax({
		url: 'product.originalInven',
		type: 'POST',
		contentType: "application/json",
		data : JSON.stringify(originInven),
		success: function(result) {
			console.log(result);
		},
		error : function(error){
			console.log("error: " + error.msg);
		}
	})
	
	var onc = "invenUpdate(" + click_id + ")";
	cId.innerText = "확인";
	cId.setAttribute("onclick", onc);
	flag = false;
}

// 재고 삭제
function deleteBtn(click_id) {
	var originInven = {};
	var cId = document.getElementById(click_id);
	var ele = cId.previousElementSibling;
	var num = window.location.search;
	var eleV;
	var elek;
	var eleK;
	var delTr = $('#' + click_id).parent().attr("id");
	
	
	if(window.confirm("선택하신 색상 및 사이즈 수량을 삭제하시겠습니까?")) {
		
	
	
		for(var i = 0; i <= 3; i++) {
			elek = ele.name;
			eleV = ele.value;
			eleK = elek.replace(/[0-9]/g, "");
			console.log(eleK + " " + i);
			eleK = eleK + 'o';
			originInven[eleK] = eleV;
			ele = ele.previousElementSibling;
		}
	
		if(num != null || num != undefined) {
			num = num.replace(/[^0-9]/g, "");
		}
		originInven["i_product_no"] = num;
		console.log(originInven);
		
		$.ajax({
			url: 'product.originalInven',
			type: 'POST',
			contentType: "application/json",
			data : JSON.stringify(originInven),
			success: function(result) {
				console.log(result);
			},
			error : function(error){
				console.log("error: " + error.msg);
			}
		})
	
		$('div').remove('#' + delTr);
	} else {
		
	}
	
}

// 재고 수정
function invenUpdate(click_id) {
	var inputs = [];
	var inven = {};
	var ele = click_id.previousElementSibling;
	var text = document.getElementById(click_id.id);
	var num = window.location.search;
	var elek;
	var eleK;
	var eleV;
	
	
	if(num != null || num != undefined) {
		num = num.replace(/[^0-9]/g, "");
	}
	inven["i_product_no"] = num;
	
	for(var i = 0; i < 3; i++) {
		elek = ele.name;
		eleK = elek.replace(/[0-9]/g, "");
		eleV = ele.value;
		inputs.push(ele);
		inven[eleK] = eleV;
		ele = ele.previousElementSibling;
	}
	
	$.ajax({
		url: 'product.updateInven',
		type: 'POST',
		contentType: "application/json",
		data : JSON.stringify(inven),
		success: function(result) {
			console.log(result);
		},
		error : function(error){
			console.log("error: " + error.msg);
		}
	})
	
	text.innerText = "수정";
	text.setAttribute("onclick", "modiBtn(this.id)");
	flag = true;
}

// 상품 삭제
function proDelBtn() {
	
	if(window.confirm("상품을 삭제하시겠습니까?")) {
		var num = window.location.search;
		if(num != null || num != undefined) {
			num = num.replace(/[^0-9]/g, "");
		}
		
		$.ajax({
			url: 'product.deleteProduct',
			type: 'GET',
			data : {p_product_no : num},
			success: function(result) {
				console.log(result);
			},
			error : function(error) {
				console.log("error : " + error.msg);
			}
		})
	} else {
		alert("취소 되었습니다.");
	}
	
}

function delLink(frm) {
	if(window.confirm("상품을 삭제하시겠습니까?")) {
		var num = window.location.search;
		if(num != null || num != undefined) {
			num = num.replace(/[^0-9]/g, "");
		}
		
		frm.action="product.deleteProduct?p_product_no=" + num;
		frm.submit();
		return true;
	} else return false;
	
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