<%@page import="com.model.RecPolicyDAO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@page import="com.model.PolicyDAO"%>
<%@page import="com.model.PolicyDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blue Wave</title>
    <link rel="stylesheet" href="CSS/policyViewST.css" />
</head>
<body>
<%
    UserDTO info = (UserDTO)session.getAttribute("user");
%>
<header>
    <nav>
        <div class="logo">
            <a href="#">
                <img src="image/Blue Wave.png" alt="Blue Wave Logo" onclick="redirectToMain()" />
            </a>
        </div>
        <div class="right-menu">
            <% if(info != null){ %>
                <a href="LogoutServlet">�α׾ƿ�<a>
            <% }else{ %>
                <a href="login.jsp">�α���</a>
            <% } %>
        </div>
    </nav>
</header>
<%    
    String policyId = request.getParameter("policyId");
    PolicyDAO policyDAO = new PolicyDAO();
    PolicyDTO policy = null;

    if (policyId != null && !policyId.isEmpty()) {
        policy = policyDAO.getPolicyById(policyId);
    }

    if (policy != null) {
%>
<%
	String category = "-";
	if(policy.getPOLICY_FIELD_CODE().equals("23010")) {
		category = "���ڸ� �о�";
	}else if(policy.getPOLICY_FIELD_CODE().equals("23020")) {
		category = "�ְ� �о�";
	}else if(policy.getPOLICY_FIELD_CODE().equals("23030")) {
		category = "���� �о�";
	}else if(policy.getPOLICY_FIELD_CODE().equals("23040")) {
		category = "����.��ȭ �о�";
	}else if(policy.getPOLICY_FIELD_CODE().equals("23050")) {
		category = "����.�Ǹ� �о�";
	}

%>
<div class="container">
	<h2 class="doc_tit01 type2"><%=policy.getPOLICY_NAME()%></h2>
    <div class="tbl-header">
        <h3 class="h3-tit">�� ���� ���� ��å ���</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <li>
                <div class="list_tit">��å ��ȣ</div>
                <div class="list_cont"><%= policy.getPOLICY_ID() != null ? policy.getPOLICY_ID() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">��å �о�</div>
                <div class="list_cont"><%= category%></div>
            </li>
            <li>
                <div class="list_tit">���� ����</div>
                <div class="list_cont"><%= policy.getSUPPORT_CONTENT() != null ? policy.getSUPPORT_CONTENT() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">��� � �Ⱓ</div>
                <div class="list_cont"><%= policy.getOPERATION_PERIOD() != null ? policy.getOPERATION_PERIOD() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">��� ��û �Ⱓ</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PERIOD() != null ? policy.getAPPLICATION_PERIOD() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">���� �Ը�(��)</div>
                <div class="list_cont"><%= policy.getSUPPORT_SCALE() != null ? policy.getSUPPORT_SCALE() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">���</div>
                <div class="list_cont"><%= policy.getETC() != null ? policy.getETC() : "-" %></div>
            </li>
        </ul>
    </div>
    <div class="tbl-header">
        <h3 class="h3-tit">��û�ڰ�</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <li>
                <div class="list_tit">����</div>
                <div class="list_cont"><%= policy.getAGE_INFO() != null ? policy.getAGE_INFO() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">������ �� �ҵ�</div>
                <div class="list_cont"><%= policy.getRESIDENCE_INCOME_CONDITION() != null ? policy.getRESIDENCE_INCOME_CONDITION() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">�з�</div>
                <div class="list_cont"><%= policy.getPOLICY_DESC() != null ? policy.getPOLICY_DESC() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">����</div>
                <div class="list_cont"><%= policy.getSUPPORT_CONTENT() != null ? policy.getSUPPORT_CONTENT() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">��� ����</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PROCESS() != null ? policy.getAPPLICATION_PROCESS() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">Ưȭ �о�</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PROCEDURE() != null ? policy.getAPPLICATION_PROCEDURE() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">�߰� �ܼ� ����</div>
                <div class="list_cont"><%= policy.getSUPPORT_SCALE() != null ? policy.getSUPPORT_SCALE() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">���� ���� ���</div>
                <div class="list_cont"><%= policy.getPARTICIPATION_LIMIT_TARGET() != null ? policy.getPARTICIPATION_LIMIT_TARGET() : "-" %></div>
            </li>
        </ul>
    </div>
    <div class="tbl-header">
        <h3 class="h3-tit">��û���</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <li>
                <div class="list_tit">��û ����</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PROCEDURE() != null ? policy.getAPPLICATION_PROCEDURE() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">�ɻ� �� ��ǥ</div>
                <div class="list_cont"><%= policy.getEVALUATION_AND_ANNOUNCEMENT() != null ? policy.getEVALUATION_AND_ANNOUNCEMENT() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">��û ����Ʈ</div>
                <div class="list_cont" style="word-break: break-all"><%= policy.getAPPLICATION_SITE_URL() != null ? policy.getAPPLICATION_SITE_URL() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">���� ����</div>
                <div class="list_cont"><%= policy.getSUBMISSION_DOCUMENTS() != null ? policy.getSUBMISSION_DOCUMENTS() : "-" %></div>
            </li>
        </ul>
    </div>
    <div class="tbl-header">
        <h3 class="h3-tit">��Ÿ</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <li>
                <div class="list_tit">��Ÿ ���� ����</div>
                <div class="list_cont"><%= policy.getETC() != null ? policy.getETC() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">�ְ� ���</div>
                <div class="list_cont"><%= policy.getMAIN_DEPARTMENT_NAME() != null ? policy.getMAIN_DEPARTMENT_NAME() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">� ���</div>
                <div class="list_cont"><%= policy.getOPERATING_INSTITUTION_NAME() != null ? policy.getOPERATING_INSTITUTION_NAME() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">������� ���� ����Ʈ 1</div>
                <div class="list_cont" style="word-break: break-all"><%= policy.getREFERENCE_SITE_URL1() != null ? policy.getREFERENCE_SITE_URL1() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">������� ���� ����Ʈ 2</div>
                <div class="list_cont" style="word-break: break-all"><%= policy.getREFERENCE_SITE_URL2() != null ? policy.getREFERENCE_SITE_URL2() : "-" %></div>
            </li>
<!-- 		<li>
                <div class="list_tit">÷������</div>
                <div class="list_cont">÷�����ϳ���</div>
            </li> ÷�������� ������ �ּ�ó���� -->            
        </ul>
    </div>
</div>
<%
    } else {
%>
<p>�ش� ��å�� ã�� �� �����ϴ�.</p>
<%
    }
%>
<footer>
    <div class="footer-container">
        <img src="image/Blue Wave.png" alt="Logo" class="footer-logo" />
        <nav class="footer-nav">
            <a href="#">�� �Ұ�</a>
            <a href="#">�̿���</a>
            <a href="#">��������ó����ħ</a>
            <a href="#">�ý��� ����</a>
        </nav>
    </div>
</footer>
<script>
    function redirectToMain() {
        window.location.href = "main.jsp";
    }  
</script>
</body>
</html>
