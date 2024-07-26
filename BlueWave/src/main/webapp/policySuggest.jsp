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
                    // 세션

                    // 클래스 이름 너무 길면 인식을 못함 RecommendedPolicyDAO <- 이거 안됨
                    RecPolicyDAO rdao = new RecPolicyDAO();
                    List<String> idList = rdao.getRecPolicyIds(info.getUserId());

                    PolicyDAO policyDAO = new PolicyDAO();
                    List<PolicyDTO> policies = policyDAO.getPoliciesByIds(idList);
                    
                    

                    int age = -1; // 기본값
                    if (info != null) {
                        String birthdate = info.getUserBirthdate();
                        if (birthdate != null && birthdate.length() == 8) {
                            try {
                                java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyyMMdd");
                                java.time.LocalDate birthDate = java.time.LocalDate.parse(birthdate, formatter);
                                java.time.LocalDate currentDate = java.time.LocalDate.now();
                                age = java.time.Period.between(birthDate, currentDate).getYears();
                            } catch (java.time.format.DateTimeParseException e) {
                                // 생년월일 형식 예외 처리
                                // 자바스크립트가 항상 8자리의 생년월일만 입력되도록하기때문에 의미가 큰 부분은 아님
                                age = -1;
                            }
                        }
                    }
                    
                    //String bestPolicyName = "";
                    //if (policies != null && !policies.isEmpty()) {
                    //     bestPolicyName = policies.get(0).getPOLICY_NAME();
                    //}
                    // 값 확인용 if문임(에러발생안하게)

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
            <!-- 맞춤 정책 추천 섹션 -->
            <section class="policy-recommendation">
                <h2 class="title">맞춤 정책 추천</h2>
                <%
                    if (info != null) {
                %>
                    <p class="promptText">
                        <%= info.getUserName() %>님은 <%= info.getUserRegion() %>에 거주하시는 <%= age %>세 청년이세요. <br />
                        회원님의 학력과 재직상태등을 고려했을때, <br />
                        아래 정책들이 요건에 맞을것으로 예상됩니다. <br /><br />
                        저희가 생각하기엔
                        <span class="highlight"> <%= policies.get(0).getPOLICY_NAME() %></span>
                        정책이 가장 도움이 될 것 같습니다.
                    </p>
                <%
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

            <!-- 정책 리스트 섹션 -->
            <section class="policy-list">
                <!-- 청년 주택드림 정책 항목 -->
                <div class="bestPolicy">
                    <div class="policy-info">
                        <h3><%= policies.get(0).getPOLICY_NAME() %></h3>
                        <p class="from"><%= policies.get(0).getMAIN_DEPARTMENT_NAME() %></p>
                        <p class="date"><%= policies.get(0).getAPPLICATION_PERIOD() %></p>
                    </div>
                    <div class="policy-actions">
                        <button class="btn view" onclick="redirectToPolicyView()">상세보기</button>
                    </div>
                </div>

                <hr width="100%" />

                <!-- 차기 적합 정책리스트 -->
                <div class="Policy-row">
                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3><%= policies.get(1).getPOLICY_NAME() %></h3>
                            <p class="from"><%= policies.get(1).getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date"><%= policies.get(1).getAPPLICATION_PERIOD() %></p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">상세보기</button>
                        </div>
                    </div>

                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3><%= policies.get(2).getPOLICY_NAME() %></h3>
                            <p class="from"><%= policies.get(2).getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date"><%= policies.get(2).getAPPLICATION_PERIOD() %></p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">상세보기</button>
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
                            <button class="btn view blue" onclick="redirectToPolicyView()">상세보기</button>
                        </div>
                    </div>

                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3><%= policies.get(4).getPOLICY_NAME() %></h3>
                            <p class="from"><%= policies.get(4).getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date"><%= policies.get(4).getAPPLICATION_PERIOD() %></p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">상세보기</button>
                        </div>
                    </div>
                </div>
                <!-- 추가 정책 항목들은 이 구조를 반복 -->
                <!-- 위 부분은 반복문을 써서 4개 이상으로 더 많이 보여줄지 아니면 그냥 4개만 보여줄지 정해야함 -->
                <!-- 모델이 이것보다 많은 정책을 과연 맞게 추천해줄지 의문이기에 -->
                
                
            </section>

            <!-- 페이지 네비게이션 -->
            <div class="pagination">
                <button class="prev">&lt;</button>
                <button class="next">&gt;</button>
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
    function redirectToPolicyView() {
        // 메인 페이지로 이동
        window.location.href = "policyView.jsp";
    }
    function redirectToMain() {
        window.location.href = "main.jsp";
    } 
    </script>
    </body>
</html>
