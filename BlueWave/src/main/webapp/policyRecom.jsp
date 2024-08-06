<%@page import="org.apache.commons.csv.CSVFormat"%>
<%@page import="org.apache.commons.csv.CSVParser"%>
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="com.model.PolicyDTO"%>
<%@page import="com.model.PolicyDAO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.AgeUtil"%>
<%@page import="com.util.CodeUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>추천 정책</title>
<link rel="stylesheet" href="CSS/baseStyle.css">
<style>
/* 맞춤 정책 추천 섹션 스타일 */

.policy-recommendation {
    width: 70%;
    margin-top: 25px;
}

.title {
    position: relative;
}

.promptText {
    background-color: #ececec;
    border-radius: 10px;
    width: 97%;
    margin: 0;
    padding: 40px; /* 모든 방향으로 패딩 추가 */
    padding-bottom: 25px;
    margin-bottom: 20px;
    position: relative;
    right: 20px;
}

.recommendation-text {
    font-size: 0.9em;
    line-height: 1.4;
}

.highlight {
    font-weight: bold;
    color: #4a9968;
    font-size: 20px;
}

/* 정책 리스트 스타일 */

.policy-list {
    width: 70%;
}
.bestPolicy {
    background-color: #e8f5e9;
    margin-bottom: 25px;
    margin-top: 15px;
    padding: 20px;
    width: 100%;
    box-sizing: border-box;
    border-radius: 10px;
}

.Policy-row {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 20px;
    width: 100%;
    box-sizing: border-box;
}

.recPolicyList {
    background-color: #e3f2fd;
    margin-bottom: 20px;
    margin-top: 20px;
    padding: 20px;
    width: calc(50% - 10px); /* 두 요소가 한 줄에 배치되도록 설정 */
    box-sizing: border-box;
    border-radius: 10px;
}

.policy-info h3 {
    margin: 0 0 5px 0;
    font-size: 1em;
}

.date {
    font-size: 0.8em;
    color: #666;
}

/* 버튼 스타일 */
.btn {
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    font-size: 0.9em;
}

.btn.view {
    background-color: #4caf50;
    color: white;
}

.btn.view.blue {
    background-color: #2196f3;
}

.btn.compare {
    background-color: white;
    border: 1px solid #ddd;
    margin-left: 5px;
}

/* 페이지네이션 스타일 */
.pagination {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.pagination button {
    background-color: #f0f0f0;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
}

.username {
	font-size: 22px;
	color: #639eff;
	font-weight: bold;
	
}
</style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
                <a href="main.jsp"> <img src="image/Blue Wave.png" alt="Blue Wave Logo"> </a>
            </div>
            <div class="right-menu">
                <a href="LogoutServlet">로그아웃</a>
            </div>
        </nav>
    </header>

    <div class="container">
        <section class="policy-recommendation">
            <h2 class="title">맞춤 정책 추천</h2>
            <%
                UserDTO info = (UserDTO) session.getAttribute("user");
                if (info != null) {
                    // 사용자 정보 출력
                    String userName = info.getUserName();
                    String userRegion = info.getUserRegion();
                    int userAge = AgeUtil.calculateAge(info.getUserBirthdate());
                    String userJob = info.getUserJob();
            %>
            <p class="promptText">
                <span class="username"><%= userName %></span>
                 님은 <span style=" font-size: 20px; font-weight: bold; color: #4d88e9;"><%= userRegion %></span>
                에 거주하시는 <span style=" font-size: 20px; font-weight: bold; color: #386dc5;"> <%= userAge %></span>
                세 <span style="font-size: 20px; font-weight: bold; color: #2151a1;"><%= userJob %></span>
                입니다. <br />
                회원님의 정보를 고려했을 때, <br />
                아래 정책들이 요건에 맞을 것으로 예상됩니다. <br /><br />
                <%
                } else {
                %>
                <p class="promptText">로그인을 다시 해주세요.</p>
                <%
                }
                %>
            </p>
        </section>

        <hr width="71%" />

        <section class="policy-list">
            <%
                if (info != null) {
                    List<PolicyDTO> recommendedPolicies = new ArrayList<>();
                    PolicyDAO policyDAO = new PolicyDAO();
                    String userId = info.getUserId();  // 로그인된 사용자의 ID를 가져옴
                    String csvFilePath = application.getRealPath("user/recommendations_" + userId + ".csv");  // 유저별 CSV 파일 경로 설정
                    try {
                        CSVParser parser = CSVParser.parse(Paths.get(csvFilePath), StandardCharsets.UTF_8, CSVFormat.DEFAULT.withHeader());
                        for (CSVRecord record : parser) {
                            String policyId = record.get("policy_id");
                            PolicyDTO policy = policyDAO.getPolicyById(policyId);
                            if (policy != null) {
                                recommendedPolicies.add(policy);
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    if (!recommendedPolicies.isEmpty()) {
                        for (int i = 0; i < recommendedPolicies.size(); i += 2) {
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
                <%
                    if (i + 1 < recommendedPolicies.size()) {
                        PolicyDTO policy2 = recommendedPolicies.get(i + 1);
                %>
                <div class="recPolicyList">
                    <div class="policy-info">
                        <h3><%= policy2.getPOLICY_NAME() %></h3>
                        <p class="from"><%= policy2.getMAIN_DEPARTMENT_NAME() %></p>
                        <p class="date"><%= policy2.getAPPLICATION_PERIOD() %></p>
                    </div>
                    <div class="policy-actions">
                        <button class="btn view blue" onclick="redirectToPolicyView('<%= policy2.getPOLICY_ID() %>')">상세보기</button>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <hr width="100%" />
            <%
                        }
                    } else {
            %>
            <p>추천할 정책이 없습니다.</p>
            <%
                    }
                } else {
            %>
            <p>로그인을 다시 해주세요.</p>
            <%
                }
            %>
        </section>
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
    </script>
</body>
</html>