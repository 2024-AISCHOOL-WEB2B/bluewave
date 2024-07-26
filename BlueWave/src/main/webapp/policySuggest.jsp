<%@page import="com.model.RecPolicyDAO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@ page import="com.model.PolicyDAO" %>
<%@ page import="com.model.PolicyDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Blue Wave</title>
        <link rel="stylesheet" href="CSS/policySuggestST.css" />
    </head>
    <body>
        <%
        UserDTO info = (UserDTO)session.getAttribute("user");
                    // ����

                    // Ŭ���� �̸� �ʹ� ��� �ν��� ���� RecommendedPolicyDAO <- �̰� �ȵ�
                    RecPolicyDAO rdao = new RecPolicyDAO();
                    List<String> idList = rdao.getRecPolicyIds(info.getUserId());

                    PolicyDAO policyDAO = new PolicyDAO();
                    List<PolicyDTO> policies = policyDAO.getPoliciesByIds(idList);
                    
                    

                    int age = -1; // �⺻��
                    if (info != null) {
                        String birthdate = info.getUserBirthdate();
                        if (birthdate != null && birthdate.length() == 8) {
                            try {
                                java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyyMMdd");
                                java.time.LocalDate birthDate = java.time.LocalDate.parse(birthdate, formatter);
                                java.time.LocalDate currentDate = java.time.LocalDate.now();
                                age = java.time.Period.between(birthDate, currentDate).getYears();
                            } catch (java.time.format.DateTimeParseException e) {
                                // ������� ���� ���� ó��
                                // �ڹٽ�ũ��Ʈ�� �׻� 8�ڸ��� ������ϸ� �Էµǵ����ϱ⶧���� �ǹ̰� ū �κ��� �ƴ�
                                age = -1;
                            }
                        }
                    }
                    
                    //String bestPolicyName = "";
                    //if (policies != null && !policies.isEmpty()) {
                    //     bestPolicyName = policies.get(0).getPOLICY_NAME();
                    //}
                    // �� Ȯ�ο� if����(�����߻����ϰ�)

        %>
        <header>
            <nav>
                <div class="logo">
                    <a href="#">
                        <img src="image/Blue Wave.png" alt="Blue Wave Logo" onclick="redirectToMain()" />
                    </a>
                </div>

                <div class="right-menu">
                    <a href="LogoutServlet">�α׾ƿ�</a>
                </div>
            </nav>
        </header>

        <div class="container">
            <!-- ���� ��å ��õ ���� -->
            <section class="policy-recommendation">
                <h2 class="title">���� ��å ��õ</h2>
                <%
                    if (info != null) {
                %>
                    <p class="promptText">
                        <%= info.getUserName() %>���� <%= info.getUserRegion() %>�� �����Ͻô� <%= age %>�� û���̼���. <br />
                        ȸ������ �з°� �������µ��� ���������, <br />
                        �Ʒ� ��å���� ��ǿ� ���������� ����˴ϴ�. <br /><br />
                        ���� �����ϱ⿣
                        <span class="highlight"> <%= policies.get(0).getPOLICY_NAME() %></span>
                        ��å�� ���� ������ �� �� �����ϴ�.
                    </p>
                <%
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

            <!-- ��å ����Ʈ ���� -->
            <section class="policy-list">
                <!-- û�� ���õ帲 ��å �׸� -->
                <div class="bestPolicy">
                    <div class="policy-info">
                        <h3><%= policies.get(0).getPOLICY_NAME() %></h3>
                        <p class="from"><%= policies.get(0).getMAIN_DEPARTMENT_NAME() %></p>
                        <p class="date"><%= policies.get(0).getAPPLICATION_PERIOD() %></p>
                    </div>
                    <div class="policy-actions">
                        <button class="btn view" onclick="redirectToPolicyView()">�󼼺���</button>
                    </div>
                </div>

                <hr width="100%" />

                <!-- ���� ���� ��å����Ʈ -->
                <div class="Policy-row">
                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3><%= policies.get(1).getPOLICY_NAME() %></h3>
                            <p class="from"><%= policies.get(1).getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date"><%= policies.get(1).getAPPLICATION_PERIOD() %></p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">�󼼺���</button>
                        </div>
                    </div>

                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3><%= policies.get(2).getPOLICY_NAME() %></h3>
                            <p class="from"><%= policies.get(2).getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date"><%= policies.get(2).getAPPLICATION_PERIOD() %></p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">�󼼺���</button>
                        </div>
                    </div>
                </div>
                
                
                
  				<div class="Policy-row">
                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3><%= policies.get(3).getPOLICY_NAME() %></h3>
                            <p class="from"><%= policies.get(3).getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date"><%= policies.get(3).getAPPLICATION_PERIOD() %></p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">�󼼺���</button>
                        </div>
                    </div>

                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3><%= policies.get(4).getPOLICY_NAME() %></h3>
                            <p class="from"><%= policies.get(4).getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date"><%= policies.get(4).getAPPLICATION_PERIOD() %></p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">�󼼺���</button>
                        </div>
                    </div>
                </div>
                <!-- �߰� ��å �׸���� �� ������ �ݺ� -->
                <!-- �� �κ��� �ݺ����� �Ἥ 4�� �̻����� �� ���� �������� �ƴϸ� �׳� 4���� �������� ���ؾ��� -->
                <!-- ���� �̰ͺ��� ���� ��å�� ���� �°� ��õ������ �ǹ��̱⿡ -->
                
                
            </section>

            <!-- ������ �׺���̼� -->
            <div class="pagination">
                <button class="prev">&lt;</button>
                <button class="next">&gt;</button>
            </div>
        </div>

        <!-- �������� ���ϴ� -->
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
    function redirectToPolicyView() {
        // ���� �������� �̵�
        window.location.href = "policyView.jsp";
    }
    function redirectToMain() {
        window.location.href = "main.jsp";
    } 
    </script>
    </body>
</html>
