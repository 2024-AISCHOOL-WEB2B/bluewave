<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blue Wave</title>
<link rel="stylesheet" href="CSS/baseStyle.css">
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
</body>
</html>