<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evo</title>
<script>
    function updateMinorCategoryOptions() {
        var majorCategory = document.getElementById('majorCategory').value;
        var minorCategoryDropdown = document.getElementById('minorCategory');

        while (minorCategoryDropdown.options.length > 0) {
            minorCategoryDropdown.remove(0);
        }

        switch (majorCategory) {
            case 'category1':
                minorCategoryDropdown.add(new Option('상품 문의', 'productInquiry'));
                minorCategoryDropdown.add(new Option('소분류 1-2', 'subcategory1-2'));
                break;
            case 'category2':
                minorCategoryDropdown.add(new Option('소분류 2-1', 'subcategory2-1'));
                minorCategoryDropdown.add(new Option('소분류 2-2', 'subcategory2-2'));
                break;
            // 다른 대분류에 따른 소분류 옵션 추가
        }
    }
</script>
</head>
<body>
	<form action="member.helpper" method="post">
		<div>1:1 문의하기</div>
		<hr />
		<div>
			<div>문의 유형</div>
			<select name="majorCategory" id="majorCategory">
				<option value="">선택해주세요</option>
				<option value="category1">구매자 문의</option>
				<option value="category2">판매자 문의</option>
			</select>
			<select name="minorCategory" id="minorCategory" onchange="updateMinorCategoryOptions()">
				
			</select>
		</div>
	</form>
</body>
</html>