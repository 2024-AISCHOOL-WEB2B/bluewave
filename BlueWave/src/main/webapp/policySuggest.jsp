<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Blue Wave</title>
        <link rel="stylesheet" href="CSS/policySuggestST.css" />
    </head>
    <body>
        <header>
            <nav>
                <div class="logo">
                    <a href="#">
                        <img src="image/Blue Wave.png" alt="Blue Wave Logo" />
                    </a>
                </div>

                <div class="right-menu">
                    <a href="mypage.jsp">내정보</a>
                </div>
            </nav>
        </header>

        <div class="container">
            <!-- 맞춤 정책 추천 섹션 -->
            <h2 class="title">맞춤 정책 추천</h2>
            <section class="policy-recommendation">
                <p class="promptText">
                    XXX님은 XX에 거주하시는 XX세 청년이세요. <br />
                    회원님의 학력과 재직상태등을 고려했을때, <br />
                    아래 정책들이 요건에 맞을것으로 예상됩니다. <br /><br />
                    저희가 생각하기엔
                    <span class="highlight">청년 주택드림 청년특별자금</span>
                    정책이 가장 도움이 될 것 같습니다.
                </p>
            </section>

            <hr width="60%" />

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
                        <button class="btn view">상세보기</button>
                    </div>
                </div>

                <hr width="86%" />

                <!-- 차기 적합 정책리스트 -->
                <div class="Policy-row">
                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3>빛고을청년대상 장학금지원</h3>
                            <p class="from">광주광역시</p>
                            <p class="date">′24.04.29~′24.05.28</p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue">상세보기</button>
                        </div>
                    </div>

                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3>빛고을청년대상 장학금지원</h3>
                            <p class="from">광주광역시</p>
                            <p class="date">′24.04.29~′24.05.28</p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue">상세보기</button>
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
    </body>
</html>