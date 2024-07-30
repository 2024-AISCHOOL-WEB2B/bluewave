<%@page import="com.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원탈퇴</title>
<link rel="stylesheet" href="CSS/LoginSucST.css" />

<style>
	.confirmEmail {
		border: none;
		padding: 10px;
		border-radius: 10px;
		background-color: #eaeaea;	
		margin-bottom: 20px;
		width: 70%;
	}

	.DeleteBtn {
		border: none;
		padding: 15px 30px;
		border-radius: 10px;
		margin: 40px 20px 0px 20px;
		background-color: #6f6f6f;
		cursor: pointer;
		transition: background-color 0.3s ease, color 0.3s ease;
	}

	.DeleteBtn span {
		font-size: 20px;
		color: #ffffff;
	}

	.DeleteBtn:hover {
		background-color: #b90000; /* 호버 시 배경색을 빨간색으로 변경 */
		color: #ffffff; /* 호버 시 텍스트 색상을 흰색으로 유지 */
	}

	.error {
		color: red;
		font-size: 14px;
		margin-top: 10px;
	}
</style>
</head>
<body>

<%
UserDTO user = (UserDTO) session.getAttribute("user");
String email = user.getUserEmail(); // 이메일 값을 JSP 변수로 가져옴
String userId = user.getUserId(); // 사용자 ID 값을 JSP 변수로 가져옴
%>

<div class="login-container">
	<!-- 배경 텍스트 -->
	<div class="background-text">
		<span>BLUE</span> <span>WAVE</span>
	</div>

	<div class="login-form">
		<!-- 로고 -->
		<img src="image/Blue Wave.png" alt="Logo" />

		<!-- 텍스트 필드 -->
		<h2>회원탈퇴를 선택하셨습니다.</h2>
		<input type="email" class="confirmEmail" id="confirmEmail" placeholder="이메일 입력">
		<h3>이메일을 입력 후, 탈퇴버튼을 누르세요.</h3>
		<h4>이메일이 일치하면 탈퇴가 진행됩니다.</h4>
		<button class="DeleteBtn" id="deleteBtn"><span>회원탈퇴</span></button>
		<p id="errorMessage" class="error"></p> <!-- 오류 메시지 표시 -->
	</div>
</div>

<!-- 웹페이지 최하단 -->
<footer>
	<div class="footer-container">
		<img src="image/Blue Wave.png" alt="Logo" class="footer-logo" />
		<nav class="footer-nav">
			<a href="#">팀 소개</a> <a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a href="#">시스템 문의</a>
		</nav>
	</div>
</footer>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const userEmail = "<%= email %>";
    const userId = "<%= userId %>";
    const confirmEmailInput = document.getElementById("confirmEmail");
    const deleteBtn = document.getElementById("deleteBtn");
    const errorMessage = document.getElementById("errorMessage");

    deleteBtn.addEventListener("click", function() {
        if (confirmEmailInput.value === userEmail) {
            // 이메일이 일치하면 서버로 폼 전송
            const form = document.createElement("form");
            form.method = "POST";
            form.action = "UserDelete"; // 서블릿 URL로 이동

            // 이메일과 사용자 ID를 숨겨진 필드로 추가
            const emailInput = document.createElement("input");
            emailInput.type = "hidden";
            emailInput.name = "email";
            emailInput.value = userEmail;
            form.appendChild(emailInput);
            
            const userIdInput = document.createElement("input");
            userIdInput.type = "hidden";
            userIdInput.name = "userId";
            userIdInput.value = userId;
            form.appendChild(userIdInput);
            
            document.body.appendChild(form);
            form.submit(); // 제출
        } else {
            errorMessage.textContent = "입력하신 이메일이 등록된 이메일과 일치하지 않습니다.";
        }
    });
});
</script>

</body>
</html>
