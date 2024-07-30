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
<link rel="stylesheet" href="CSS/mainST.css">
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
			<div class="btn-wrap">
        </div>
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


                <h1>�ֽ� ��å ������ ����</h1>
                <div class="policyFeed">
                    <h2>���ڸ��о�</h2>
                    <div class="Policy-row">
                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="policyFeed">
                    <h2>�ְźо�</h2>
                    <div class="Policy-row">
                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="policyFeed">
                    <h2>���� �о�</h2>
                    <div class="Policy-row">
                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="policyFeed">
                    <h2>����&��ȭ �о�</h2>
                    <div class="Policy-row">
                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="policyFeed">
                    <h2>����&�Ǹ� �о�</h2>
                    <div class="Policy-row">
                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>

                        <div class="recPolicyList">
                            <div class="policy-info">
                                <h3>��å�̸�</h3>
                                <p class="from">�ְ����</p>
                                <p class="date">���೯¥</p>
                            </div>
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="">
                                    �󼼺���
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <button class ="allpolicyViewButton"onclick="redirectToAllPolicy()">
                    <span class="APVbtn">��� ��å ��ȸ�ϱ�</span>
                </button>
            </div>
        </main>

    <!-- �������� ���ϴ� -->
    <footer>
        <div class="footer-container">
            <img src="image/Blue Wave.png" alt="Logo" class="footer-logo">
            <nav class="footer-nav">
                <a href="#">�� �Ұ�</a>
                <a href="#">�̿���</a>
                <a href="#">��������ó����ħ</a>
                <a href="#">�ý��� ����</a>
            </nav>
        </div>
    </footer>
    <script>
        function redirectToAllPolicy() {
            // ����������move
            window.location.href = "allPolicy.jsp";
        }
    </script>
</body>
</html>