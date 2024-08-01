<%@page import="com.util.CodeUtil"%>
<%@page import="com.model.UserDTO"%>
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
    <link rel="stylesheet" href="CSS/policySuggestST.css" />
</head>
<body>
    <%
        UserDTO info = (UserDTO) session.getAttribute("user");

        if (info != null) {
            String regionCode = CodeUtil.getRegionCode(info.getUserRegion());
            String policyFieldCode = CodeUtil.getPolicyInterestCode(info.getUserPolicyInterest());
            String jobKeyword = info.getUserJob();

            PolicyDAO policyDAO = new PolicyDAO();
            List<PolicyDTO> policies = policyDAO.getFilteredPolicies(policyFieldCode, regionCode, jobKeyword);
    %>
    <header>
        <nav>
            <div class="logo">
                <a href="#">
                    <img src="image/Blue Wave.png" alt="Blue Wave Logo" onclick="redirectToMain()" />
                </a>
            </div>
            <div class="right-menu">
                <a href="LogoutServlet">로그아웃</a>
            </div>
        </nav>
    </header>

    <div class="container">
        <section class="policy-recommendation">
            <h2 class="title">맞춤 정책 추천</h2>
            <p class="promptText">
                <%= info.getUserName() %>님은 <%= info.getUserRegion() %>에 거주하시는 <%= info.getUserJob() %>입니다. <br />
                회원님의 정보를 고려했을 때, <br />
                아래 정책들이 요건에 맞을 것으로 예상됩니다. <br /><br />
                <%
                    if (policies != null && !policies.isEmpty()) {
                        PolicyDTO topPolicy = policies.get(0);
                %>
                저희가 생각하기엔 <span class="highlight"><%= topPolicy.getPOLICY_NAME() %></span> 정책이 가장 도움이 될 것 같습니다.
            </p>
            <%
                    } else {
                %>
                추천할 정책이 없습니다.
                <%
                    }
                %>
        </section>

        <hr width="71%" />

        <%
            if (policies != null && !policies.isEmpty()) {
        %>
        <section class="policy-list">
            <%
                for (PolicyDTO policy : policies) {
            %>
            <div class="Policy-row">
                <div class="recPolicyList">
                    <div class="policy-info">
                        <h3><%= policy.getPOLICY_NAME() %></h3>
                                                <p class="from"><%= policy.getMAIN_DEPARTMENT_NAME() %></p>
                        <p class="date"><%= policy.getAPPLICATION_PERIOD() %></p>
                    </div>
                    <div class="policy-actions">
                        <button class="btn view blue" onclick="redirectToPolicyView('<%= policy.getPOLICY_ID() %>')">상세보기</button>
                    </div>
                </div>
            </div>
            <hr width="100%" />
            <%
                }
            %>
        </section>
        <%
            } else {
        %>
        <p>추천할 정책이 없습니다.</p>
        <%
            }
        %>
    </div>

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
            window.location.href = "policyView.jsp?policyId=" + policyId;
        }

        function redirectToMain() {
            window.location.href = "main.jsp";
        }
    </script>
    <%
        } else {
    %>
    <p class="promptText">로그인을 다시 해주세요.</p>
    <%
        }
    %>
</body>
</html>
