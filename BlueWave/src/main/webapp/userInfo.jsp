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
<style>
    .container {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #f5f5f5;
        border-radius: 8px;
        margin-bottom: 120px;
    }
    .myInfo {
        background-color: none;
        padding: 20px;
        border-radius: 8px;
    }
    .profile {
        text-align: center;
        margin-bottom: 20px;
    }
    .profile img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background-color: #87CEEB;
    }
    .profile p {
        margin-top: 10px;
        font-weight: bold;
    }
    .info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px;
    }
    .info-label {
        font-weight: bold;
    }
    .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }
    .button {
        padding: 10px 20px;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .button-delete {
        background-color: #4CAF50;
    }
    .button-edit {
        background-color: #008CBA;
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
		        <a href="#"> <img src="image/Blue Wave.png" alt="Blue Wave Logo"> </a>
		    </div>
		
		    <div class="right-menu">
		        <%
		        if (info != null) {
		        %>
		            <a class="logNavBtn" href="LogoutServlet">�α׾ƿ�</a>
		        <%
		        } else {
		        %>
		            <a class="logNavBtn" href="login.jsp">�α���</a>
		        <%
		        }
		        %>
		    </div>
		</nav>
	</header>
	
	
	<div class="container">
	    <h2 style="text-align: center; margin-bottom: 20px;">����������</h2>
	    <div class="myInfo">
	        <div class="profile">
	            <img src="image/profile.png">
	            <p><%=info != null ? info.getUserName() : ""%> ȸ����<br>�ȳ��ϼ���.</p>
	        </div>
	        <div class="info-grid">
	            <div class="info-label">�̸�</div>
	            <div><%=info != null ? info.getUserName() : ""%></div>
	            <div class="info-label">����</div>
	            <div><%=info != null ? info.getUserGender() : ""%></div>
	            <div class="info-label">�������</div>
	            <div><%=info != null ? info.getUserBirthdate() : ""%></div>
	            <div class="info-label">�̸���</div>
	            <div><%=info != null ? info.getUserEmail() : ""%></div>
	            <div class="info-label">��������</div>
	            <div><%=info != null ? info.getUserJob() : ""%></div>
	            <div class="info-label">���ɺо�</div>
	            <div><%=info != null ? info.getUserPolicyInterest() : ""%></div>
	            <div class="info-label">��������</div>
	            <div><%=info != null ? info.getUserRegion() : ""%></div>
	            <div class="info-label">�ҵ����</div>
	            <div><%=info != null ? info.getUserIncome() : ""%></div>
	            <div class="info-label">��������</div>
	            <div><%=info != null ? info.getUserFamily() : ""%></div>
	        </div>

	    </div>
		<div class="button-group">
	        <button class="button button-delete">ȸ��Ż��</button>
	        <button class="button button-edit">ȸ����������</button>
	    </div>
	</div>



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
</body>
</html>