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
<link rel="stylesheet" href="CSS/main.css">
</head>
<body>

	<%
	UserDTO info = (UserDTO) session.getAttribute("user");
	%>
	
	<header>
		<nav>
			<div class="logo">
				<a href="#"> <img src="image/Blue Wave.png" alt="Blue Wave Logo">
				</a>
			</div>

			<div class="right-menu">
				<%
				if (info != null) {
				%>
				<a href="LogoutServlet">�α׾ƿ�<a> <%
 } else {
 %> <a
						href="login.jsp">�α���</a> <%
 }
 %>
			</div>
		</nav>
	</header>

	<main>
		<div class="container">
			<div class="policy-container">
				<p class="policy-text">
					������ ���������� û����å<br> <span id="Blue">�����̺�</span>�� ���͵帳�ϴ�
				</p>
				<%
				if (info != null) {
				%>
				<a href="policySuggest.jsp" class="rainbow-button"> ���� �ٷ� ����
					�������ִ�<br>��å ��õ�ޱ�
				</a>
				<%
				} else {
				%>
				<a href="register.jsp" class="rainbow-button"> ���� �ٷ� ���� �������ִ�<br>��å
					��õ�ޱ�
				</a>
				<%
				}
				%>

			</div>

			<br> <br> <br> <br> <br> <br>

			<!--Ŀ�´�Ƽ �� ǥ��-->
			<div class="popular-post">
				<div class="post-content">
					<h2 class="post-title">�����е庴�� �ɸ� û����� �����ϴ� ��å</h2>
					<p class="post-description">�ݼ��� ��ȸ ������ȭ�� ���� û������ ������ ���� ��ȭ��
						�ñ��������ϴ�. �̿� ���� �����е� ���� ��å�� ����� �ؼҸ� ���� ������ ��ų ��� �⿩�ϸ�, ������ ���ǿ�
						������� �յ��� �н� ��ȸ�� ������ ������ ������ ���� �� �ֽ��ϴ�. ���� 4�� ������� �ô븦 ����ϰ� â�� ���°踦
						Ȱ��ȭ�ϴ� ������ ������ ���������ν�, ���� ��ü�� ������ ������� ��ȭ�ϰ� û������ ������ �ҿ� ������ �����ϴ� ��
						ũ�� �⿩�� ���Դϴ�.</p>
				</div>

				<div class="post-image">
					<img src="image/unnamed.jpg" alt="�����е� ��å ���� �̹���">
				</div>
			</div>

			<!-- �ι�° �Խñ� ���� �߰�
            <div class="second-post">
                <h2 class="post-title">�ι�° �Խñ� ����</h2>
                <p class="post-description">���⿡ �ι�° �Խñ� ������ �߰��մϴ�...</p>
            </div> -->
			<!--Ŀ�´�Ƽ �� ���ƿ�/�Ⱦ�� Ŀ�´�Ƽ �̵�-->
			<div class="post-actions">

				<button class="like-btn">
					<img src="image/like_hand.png" alt=""><br> ���� ���̵���Դϴ�!
				</button>

				<button class="dislike-btn">
					<img src="image/like_hand.png" alt=""><br> �����ΰ� ���ƿ�..
				</button>

				<button class="community-btn"
					onclick="location.href='community.jsp'">
					��� �����ϱ�<br> (Ŀ�´�Ƽ ����)

				</button>
			</div>


			<div class="news_list">
				<h2>���� û�ⴺ��</h2>
				<ul class="lists">

					<li>������ �Է��ϼ��� <br> ����� ������ �����Դϴ�
					</li>
					<li>������ �Է��ϼ��� <br> ����� ������ �����Դϴ�
					</li>
					<li>������ �Է��ϼ��� <br> ����� ������ �����Դϴ�
					</li>
					<li>������ �Է��ϼ��� <br> ����� ������ �����Դϴ�
					</li>
					<li>������ �Է��ϼ��� <br> ����� ������ �����Դϴ�
					</li>
				</ul>
			</div>





			<br> <br> <br>
	</main>

	<!-- �������� ���ϴ� -->
	<footer>
		<div class="footer-container">
			<img src="image/Blue Wave.png" alt="Logo" class="footer-logo">
			<nav class="footer-nav">
				<a href="#">�� �Ұ�</a> <a href="#">�̿���</a> <a href="#">��������ó����ħ</a> <a
					href="#">�ý��� ����</a>
			</nav>
		</div>
	</footer>
</body>
</html>