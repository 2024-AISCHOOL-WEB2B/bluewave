<%@page import="com.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글쓰기 - 커뮤니티</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/base.css">
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        /* 컨테이너 스타일 */
        .container {
            width: 800px;
            margin: 100px auto;
            padding: 20px;
            border: none;
            background-color: #fff;
            position: relative;
            margin-top: 10px;
        }
        
        .communityName {
            display: block;
            font-size: 2em;
            margin-block-start: 0.67em;
            margin-block-end: 0.67em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            unicode-bidi: isolate;
            text-align: center;
            width: 100%;
            font-style: italic;
            margin-bottom: 50px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        
        .form-group input[type="text"],
        .form-group textarea {
            width: 97%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        
        .form-group textarea {
            resize: vertical;
            min-height: 200px;
        }
        
        .submit-button {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 4px;
        }
        
        .submit-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%
    UserDTO info = (UserDTO) session.getAttribute("user");
    %>
    <header>
        <nav>
            <div class="logo">
                <a href="main.jsp"> <img src="image/Blue Wave.png" alt="Blue Wave Logo"> </a>
            </div>
            <div class="right-menu">
                <%
                if (info != null) {
                %>
                    <a class="logNavBtn" href="LogoutServlet">로그아웃</a>
                <%
                } else {
                %>
                    <a class="logNavBtn" href="login.jsp">로그인</a>
                <%
                }
                %>
            </div>
        </nav>
    </header>

    <div class="container">
        <p class="communityName" onclick="redirectToCommunity()">VOICE of YOUTH</p>
        <h1>글쓰기</h1>
        <hr>
        <form action="postSaveServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <%
                if (info != null && info.getUserId() != null) {
                %>
                    작성자 : <%=info.getUserId()%>
                <%
                } else {
                %>
                    <script type="text/javascript">
                        alert("로그인이 필요합니다.");
                        window.location.href = "login.jsp";
                    </script>
                <%}%>
            </div>
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="content">내용:</label>
                <textarea id="content" name="content" rows="10" required></textarea>
            </div>
            <div class="form-group">
                <label for="file">첨부파일:</label>
                <input type="file" id="file" name="file">
            </div>
            <div class="form-group">
                <button type="submit" class="submit-button">글 작성하기</button>
                <hr>
            </div>
        </form>
    </div>

    <!-- 웹페이지 최하단 -->
    <footer>
        <div class="footer-container">
            <img src="image/Blue Wave.png" alt="Logo" class="footer-logo">
            <nav class="footer-nav">
                <a href="#">팀 소개</a>
                <a href="#">이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">시스템 문의</a>
            </nav>
        </div>
    </footer>

    <script>
        function redirectToCommunity() {
            window.location.href = "community.jsp";
        }
    </script>
</body>
</html>