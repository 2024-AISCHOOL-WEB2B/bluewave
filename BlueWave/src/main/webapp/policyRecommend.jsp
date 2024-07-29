<%@page import="com.model.RecPolicyDAO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@page import="com.model.PolicyDAO"%>
<%@page import="com.model.PolicyDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blue Wave</title>
    <link rel="stylesheet" href="CSS/policySuggestST.css">
</head>
<body>
    <%
        UserDTO info = (UserDTO) session.getAttribute("user");

        // ����� ���� ��������
        String userRegion = info.getUserRegion();
        String userInterest = info.getUserPolicyInterest();

        // ��å DAO ��ü ����
        PolicyDAO policyDAO = new PolicyDAO();

        // ��õ ��å ����Ʈ ��������
        List<PolicyDTO> recommendedPolicies = policyDAO.getRecommendedPolicies(userRegion, userInterest);
    %>
    <header>
        <nav>
            <div class="logo">
                <a href="main.jsp">
                    <img src="image/Blue Wave.png" alt="Blue Wave Logo" />
                </a>
            </div>
            <div class="right-menu">
                <a href="LogoutServlet">�α׾ƿ�</a>
            </div>
        </nav>
    </header>

    <div class="container">
        <h2 class="doc_tit01 type2">���� ��å ��õ</h2>
        <section class="policy-recommendation">
            <%
                if (info != null) {
            %>
            <p class="promptText">
                <%= info.getUserName() %>���� <%= info.getUserRegion() %>�� �����Ͻô� <%= info.getUserJob() %>�̼���. <br />
                ȸ������ �з°� �������µ��� ���������, <br />
                �Ʒ� ��å���� ��ǿ� ���������� ����˴ϴ�. <br /><br />
                <%
                    if (recommendedPolicies != null && !recommendedPolicies.isEmpty()) {
                %>
                ���� �����ϱ⿣
                <span class="highlight"><%= recommendedPolicies.get(0).getPOLICY_NAME() %></span>
                ��å�� ���� ������ �� �� �����ϴ�.
            </p>
            <%
                    } else {
            %>
            ��õ�� ��å�� �����ϴ�.
            <%
                    }
                } else {
            %>
            <p class="promptText">
                �α����� �ٽ� ���ּ���.
            </p>
            <%
                }
            %>
        </section>

        <hr width="71%" />

        <%
            if (recommendedPolicies != null && !recommendedPolicies.isEmpty()) {
        %>
        <section class="policy-list">
            <%
                for (int i = 0; i < recommendedPolicies.size(); i++) {
                    PolicyDTO policy = recommendedPolicies.get(i);
            %>
            <div class="Policy-row">
                <div class="recPolicyList">
                    <div class="policy-info">
                        <h3><%= policy.getPOLICY_NAME() %></h3>
                        <p class="from"><%= policy.getMAIN_DEPARTMENT_NAME() %></p>
                        <p class="date"><%= policy.getAPPLICATION_PERIOD() %></p>
                    </div>
                    <div class="policy-actions">
                        <button class="btn view blue" onclick="redirectToPolicyView('<%= policy.getPOLICY_ID() %>')">�󼼺���</button>
                    </div>
                </div>
            </div>
            <hr width="100%" />
            <%
                }
            %>
        </section>

        <div class="pagination">
            <button class="prev">&lt;</button>
            <button class="next">&gt;</button>
        </div>
        <%
            }
        %>
    </div>

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
        function redirectToPolicyView(policyId) {
            console.log("Redirecting to policy view with ID: " + policyId);
            window.location.href = "policyView.jsp?policyId=" + policyId;
        }

        function redirectToMain() {
            window.location.href = "main.jsp";
        }
    </script>
</body>
</html>
