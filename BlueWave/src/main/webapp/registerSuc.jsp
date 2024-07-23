<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>로그인</title>
        <link rel="stylesheet" href="CSS/registerSucST.css" />
    </head>
    <body>
        <!-- 로그인 섹션 전체를 감싸는 컨테이너 -->
        <div class="login-container">
            <!-- 배경 텍스트 -->
            <div class="background-text">
                <span>BLUE</span>
                <span>WAVE</span>
            </div>

            <!-- 회원가입 성공 폼 -->
            <div class="login-form">
                <!-- 로고 -->
                <img src="image/Blue Wave.png" alt="Logo" />

                <!-- 텍스트 필드 -->
                <h2>
                    회원가입을 축하합니다.<br />
                    <span>블루웨이브</span>에 오신것을 환영해요.
                </h2>

                <!-- 로그인페이지 이동 버튼 -->
                <button class="login-button" onclick="redirectToLogin()">
                    로그인하러가기
                </button>
            </div>
        </div>

        <!-- 웹페이지 최하단 -->
        <footer>
            <div class="footer-container">
                <img src="image/Blue Wave.png" alt="Logo" class="footer-logo" />
                <nav class="footer-nav">
                    <a href="#">팀 소개</a>
                    <a href="#">이용약관</a>
                    <a href="#">개인정보처리방침</a>
                    <a href="#">시스템 문의</a>
                </nav>
            </div>
        </footer>

        <script>
            function redirectToLogin() {
                // 로그인 페이지로 이동
                window.location.href = "login.jsp";
            }
        </script>
    </body>
</html>