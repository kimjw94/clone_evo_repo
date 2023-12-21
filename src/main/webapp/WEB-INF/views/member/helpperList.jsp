<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evo</title>
<style>
.boardDiv {
	display: none; /* 처음에는 감춰진 상태로 설정 */
}
</style>
<script>
function toggleDiv(postId) {
    var contentDiv = document.getElementById('boardDiv' + postId);
    contentDiv.style.display = contentDiv.style.display === 'none' ? 'block' : 'none';
}
function loadPage(pageNumber) {
    var csrfToken = $("meta[name='_csrf']").attr("content");
    var csrfHeader = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        type: 'POST',
        url: 'member.helpperList',
        data: {
            page: pageNumber
        },
        success: function(data) {
        	var extractedContent = $(data).find('#contentContainer');

            // 이전 내용 지우기
            $('#contentContainer').empty();

            // 새로운 내용 표시
            $('#contentContainer').append(extractedContent);
        },
        error: function() {
            alert('페이지 로딩 중 오류가 발생했습니다.');
        }
    });
}
</script>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
</head>
<body>
	<form action="/member.helpperList" method="post">
		<h1>문의 내역</h1>
		<table border="1" align="center">
			<tr>
				<th width="150px">상품 번호</th>
				<th width="300px">문의 제목</th>
				<th width="200px">작성자</th>
			</tr>
		</table>

		<div id="contentContainer">
			<c:forEach var="helpper" items="${helpperList}">
				<table class="boardTbl" align="center">
					<tr>
						<td width="150px" align="center">${helpper.h_productNum}</td>
						<td width="300px" align="center"><a
							href="javascript:void(0);"
							onclick="toggleDiv('${helpper.h_num}')">${helpper.h_title}</a></td>
						<td width="200px" align="center">${helpper.h_m_id}</td>
					</tr>
					<tr>
						<td colspan="3">
							<div id="boardDiv${helpper.h_num}" class="boardDiv">
								<div>작성 내용</div>
								${helpper.h_cont} <input type="text">입력
							</div>
						</td>
					</tr>
				</table>
			</c:forEach>
		</div>


		<div id="pagination" align="center">
			<c:if test="${pageCount > 1}">
				<c:forEach var="i" begin="1" end="${pageCount}">
					<a href="javascript:void(0);" onclick="loadPage(${i})">${i}</a>
				</c:forEach>
			</c:if>
		</div>
		<hr />
		<table border="1" align="right">
			<tr>
				<td colspan="2"><input></td>
				<td><button>검색</button></td>
			</tr>
		</table>
	</form>
</body>
</html>