<%@page import="com.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인</title>
<link rel="stylesheet" href="CSS/LoginSucST.css" />
</head>
<body>

<%
UserDTO user = (UserDTO) session.getAttribute("user");
String name = user.getUserName();
%>

<!-- 로그인 섹션 전체를 감싸는 컨테이너 -->
<div class="login-container">
    <!-- 배경 텍스트 -->
    <div class="background-text">
        <span>BLUE</span> <span>WAVE</span>
    </div>

    <!-- 로그인 성공 폼 -->
    <div class="login-form">
        <!-- 로고 -->
        <img src="image/Blue Wave.png" alt="Logo" />

        <!-- 텍스트 필드 -->
        <h2>
            <span> </span><%=name%>님 안녕하세요.<br /> <span>블루웨이브</span>에 오신 것을
            환영합니다.
        </h2>

        <!-- 메인페이지 이동 버튼 -->
		<button class="login-button" id="mainPageButton">
		    메인페이지로 이동
		</button>

        <!-- 리다이렉트 알림 문구 -->
        <p id="redirectMessage" class="redirect-message">5초 후 리다이렉트됩니다.</p>
    </div>
</div>

<!-- 웹페이지 최하단 -->
<footer>
    <div class="footer-container">
        <img src="image/Blue Wave.png" alt="Logo" class="footer-logo" />
        <nav class="footer-nav">
            <a href="#">팀 소개</a> <a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a
                href="#">시스템 문의</a>
        </nav>
    </div>
</footer>

<script>
function redirectToMain() {
    // 메인 페이지로 이동
    window.location.href = "main.jsp";
}

document.addEventListener("DOMContentLoaded", function() {
    let countdown = 4;
    const redirectMessage = document.getElementById("redirectMessage");
    const mainPageButton = document.getElementById("mainPageButton");

    // 버튼에 이벤트 리스너 추가
    mainPageButton.addEventListener("click", redirectToMain);

    function updateCountdown() {
        if (countdown > 0) {
            redirectMessage.innerHTML = countdown + "초 후 리다이렉트됩니다.";
            countdown--;
        } else {
            redirectMessage.innerHTML = "리다이렉트 중...";
            clearInterval(countdownInterval);
            setTimeout(redirectToMain, 1000);
        }
    }

    const countdownInterval = setInterval(updateCountdown, 1000);
});
</script>
</body>
</html>
