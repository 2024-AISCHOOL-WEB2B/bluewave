<%@page import="com.model.RecPolicyDAO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@page import="com.model.PolicyDAO"%>
<%@page import="com.model.PolicyDTO"%>
<%@page import="com.util.PolicyUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Blue Wave</title>
        <link rel="stylesheet" href="CSS/allPolicyST.css" />
    </head>
    <body>
        <%
            UserDTO info = (UserDTO) session.getAttribute("user");

            // 페이지 번호 가져오기, 기본값은 1
            int currentPage = Optional.ofNullable(request.getParameter("page")).map(Integer::parseInt).orElse(1);
            int pageSize = 24;

            PolicyDAO pDAO = new PolicyDAO();
            List<PolicyDTO> allPolicies = pDAO.getAllPolicies(currentPage, pageSize);
            int totalPolicyCount = pDAO.getTotalPolicyCount();
            int totalPages = (int) Math.ceil(totalPolicyCount / (double) pageSize);
        %>
        <header>
            <nav>
                <div class="logo">
                    <a href="main.jsp">
                        <img src="image/Blue Wave.png" alt="Blue Wave Logo" />
                    </a>
                </div>
                <div class="right-menu">
                    <% if (info != null) { %>
                        <a href="LogoutServlet">로그아웃</a>
                    <% } else { %>
                        <a href="login.jsp">로그인</a>
                    <% } %>
                </div>
            </nav>
        </header>

        <div class="container">
            <h1>전체 청년정책 보기</h1>

            <div class="allPolicyList">
                <div class="in-header">청년정책 조회결과 <%= totalPolicyCount %>건</div>
                <hr width="100%" />

                <div class="Policy-row">
                    <% for (PolicyDTO policy : allPolicies) { %>
                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3><%= policy.getPOLICY_NAME() %></h3>
                            <p class="from"><%= policy.getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date"><%= policy.getAPPLICATION_PERIOD() %></p>
                        </div>
                        <div class="botton-info">
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="redirectToPolicyView('<%= policy.getPOLICY_ID() %>')">
                                    상세보기
                                </button>
                            </div>
                            <div class="policy-category">
                                <span class="cate"><%= PolicyUtils.getCategory(policy.getPOLICY_FIELD_CODE()) %></span>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>

                <!-- 페이지 네비게이션 -->
                <div class="pagination">
                    <% if (currentPage > 1) { %>
                    <button class="prev" onclick="redirectToPage(<%= currentPage - 1 %>)">&lt;</button>
                    <% } %>
                    <% if (currentPage < totalPages) { %>
                    <button class="next" onclick="redirectToPage(<%= currentPage + 1 %>)">&gt;</button>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- 웹페이지 최하단 -->
        <footer>
            <div class="footer-container">
                <img src="image/Blue Wave.png" alt="Logo" class="footer-logo" />
                <nav class="footer-nav">
                    <a href="#">팀 소개</a>
                    <a href="#">이용약관</a>
                    <a href="#">개인정보처리방침</a>
                    <a href="#">시스템 문의</a>
                </nav>
            </div>
        </footer>
        <script>
            function redirectToPolicyView(policyId) {
                console.log("Redirecting to policy view with ID: " + policyId);
                window.location.href = "policyView.jsp?policyId=" + policyId;
            }

            function redirectToPage(page) {
                window.location.href = "allPolicy.jsp?page=" + page;
            }
        </script>
    </body>
</html>
