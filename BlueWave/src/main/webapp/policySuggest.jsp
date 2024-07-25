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

                    // 올바른 클래스 이름 사용
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
                                age = -1;
                            }
                        }
                    }
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
                        <span class="highlight">추천 정책</span>
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
                        <h3>청년 주택드림 청년특별자금</h3>
                        <p class="from">국도교통부</p>
                        <p class="date">′24.04.29~′24.05.28</p>
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
                            <h3>빛고을청년대상 장학금지원</h3>
                            <p class="from">광주광역시</p>
                            <p class="date">′24.04.29~′24.05.28</p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">상세보기</button>
                        </div>
                    </div>

                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3>빛고을청년대상 장학금지원</h3>
                            <p class="from">광주광역시</p>
                            <p class="date">′24.04.29~′24.05.28</p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue" onclick="redirectToPolicyView()">상세보기</button>
                        </div>
                    </div>
                </div>
                <!-- 추가 정책 항목들은 이 구조를 반복 -->
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
