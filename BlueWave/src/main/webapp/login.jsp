<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>로그인</title>
        <link rel="stylesheet" href="CSS/loginST.css" />
    </head>
    <body>
        <!-- 로그인 섹션 전체를 감싸는 컨테이너 -->
        <div class="login-container">
            <!-- 배경 텍스트 -->
            <div class="background-text">
                <span>BLUE</span>
                <span>WAVE</span>
            </div>

            <!-- 로그인 폼 -->
            <form class="login-form" action="#" method="post">
                <!-- 로고 -->
                <img src="image/Blue Wave.png" alt="Logo" />

                <!-- 입력 필드 -->
                <input
                    type="text"
                    placeholder="아이디"
                    class="input-field"
                    name="username"
                    required
                />
                <input
                    type="password"
                    placeholder="비밀번호"
                    class="input-field"
                    name="password"
                    required
                />

                <!-- 로그인 버튼 -->
                <button type="submit" class="login-button">Login</button><br />
                <span
                    >비회원이신가요? <a href="register.jsp">회원가입</a></span
                >
            </form>
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
    </body>
</html>
