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

        // 사용자 정보 가져오기
        String userRegion = info.getUserRegion();
        String userInterest = info.getUserPolicyInterest();

        // 정책 DAO 객체 생성
        PolicyDAO policyDAO = new PolicyDAO();

        // 추천 정책 리스트 가져오기
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
                <a href="LogoutServlet">로그아웃</a>
            </div>
        </nav>
    </header>

    <div class="container">
        <h2 class="doc_tit01 type2">맞춤 정책 추천</h2>
        <section class="policy-recommendation">
            <%
                if (info != null) {
            %>
            <p class="promptText">
                <%= info.getUserName() %>님은 <%= info.getUserRegion() %>에 거주하시는 <%= info.getUserJob() %>이세요. <br />
                회원님의 학력과 재직상태등을 고려했을때, <br />
                아래 정책들이 요건에 맞을것으로 예상됩니다. <br /><br />
                <%
                    if (recommendedPolicies != null && !recommendedPolicies.isEmpty()) {
                %>
                저희가 생각하기엔
                <span class="highlight"><%= recommendedPolicies.get(0).getPOLICY_NAME() %></span>
                정책이 가장 도움이 될 것 같습니다.
            </p>
            <%
                    } else {
            %>
            추천할 정책이 없습니다.
            <%
                    }
                } else {
            %>
            <p class="promptText">
                로그인을 다시 해주세요.
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
                        <button class="btn view blue" onclick="redirectToPolicyView('<%= policy.getPOLICY_ID() %>')">상세보기</button>
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

        function redirectToMain() {
            window.location.href = "main.jsp";
        }
    </script>
</body>
</html>
