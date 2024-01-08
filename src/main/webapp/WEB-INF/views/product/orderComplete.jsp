<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    // "홈으로" 버튼 클릭 시 이벤트 처리
    function goToHome() {
        // 홈 페이지의 URL로 이동
        window.location.href = "/evo/"; // 여기에 홈 페이지의 URL을 넣어주세요
    }
</script>
</head>
<body>
<div align="center">
    <p>주문이 완료되었습니다.</p>
    <button onclick="goToHome()">홈으로</button>
    </div>
</body>
</html>