<%@page import="com.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>�α���</title>
<link rel="stylesheet" href="CSS/LoginSucST.css" />
</head>
<body>


	<%
	UserDTO user = (UserDTO) session.getAttribute("user");
	String name = user.getUserName();
	%>

	<!-- �α��� ���� ��ü�� ���δ� �����̳� -->
	<div class="login-container">
		<!-- ��� �ؽ�Ʈ -->
		<div class="background-text">
			<span>BLUE</span> <span>WAVE</span>
		</div>

		<!-- �α��� ���� �� -->
		<div class="login-form">
			<!-- �ΰ� -->
			<img src="image/Blue Wave.png" alt="Logo" />

			<!-- �ؽ�Ʈ �ʵ� -->
			<h2>
				<span> </span><%=name%>�� �ȳ��ϼ���.<br /> <span>�����̺�</span>�� ���Ű���
				ȯ���մϴ�.
			</h2>

			<!-- ���������� �̵� ��ư -->
			<button class="login-button" onclick="redirectToMain()">
				������������ �̵�</button>

			<!-- �����̷�Ʈ �˸� ���� -->
			<p class="redirect-message">5�� �� �����̷�Ʈ�˴ϴ�.</p>
		</div>
	</div>

	<!-- �������� ���ϴ� -->
	<footer>
		<div class="footer-container">
			<img src="image/Blue Wave.png" alt="Logo" class="footer-logo" />
			<nav class="footer-nav">
				<a href="#">�� �Ұ�</a> <a href="#">�̿���</a> <a href="#">��������ó����ħ</a> <a
					href="#">�ý��� ����</a>
			</nav>
		</div>
	</footer>

	<script>
        function redirectToMain() {
            // ���� �������� �̵�
            window.location.href = "main.jsp";
        }

        // 5�� �� �ڵ� �����̷�Ʈ
        setTimeout(redirectToMain, 5000);
    </script>
</body>
</html>
