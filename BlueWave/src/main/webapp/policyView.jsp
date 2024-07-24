<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
					<a href="LogoutServlet">로그아웃<a>
				<% }else{ %>
					<a href="login.jsp">로그인</a>
				<% } %>
                </div>
            </nav>
        </header>

        <div class="container">
            <div class="tbl-header">
                <h3 class="h3-tit">한 눈에 보는 정책 요약</h3>
            </div>
            <div class="table_wrap">
                <ul class="common_table01 type2">
                    <li>
                        <div class="list_tit">정책 번호</div>
                        <div class="list_cont">bizId</div>
                    </li>
                    <li>
                        <div class="list_tit">정책 분야</div>
                        <div class="list_cont">
                            <span class="txt">bizTycdSel</span>
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">지원 내용</div>
                        <div class="list_cont">
                            sporCn
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">사업 운영 기간</div>
                        <div class="list_cont">bizPrdCn</div>
                    </li>
                    <li>
                        <div class="list_tit">사업 신청 기간</div>
                        <div class="list_cont">
                            <!-- 특정기간 -->

                            rqutPrdCn

                            <br />
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">지원 규모(명)</div>
                        <div class="list_cont">sporScvl</div>
                    </li>
                    <li>
                        <div class="list_tit">비고</div>
                        <div class="list_cont">
                            비고내용
                        </div>
                    </li>
                </ul>
            </div>
            <div class="tbl-header">
                <h3 class="h3-tit">신청자격</h3>
            </div>
            <div class="table_wrap">
                <ul class="common_table01 type2">
                    <li>
                        <div class="list_tit">연령</div>
                        <div class="list_cont">ageInfo</div>
                    </li>
                    <li>
                        <div class="list_tit">거주지 및 소득</div>
                        <div class="list_cont">
                            prcpCn
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">학력</div>
                        <div class="list_cont">accrRqisCn</div>
                    </li>
                    <li>
                        <div class="list_tit">전공</div>
                        <div class="list_cont">majrRqisCn</div>
                    </li>
                    <li>
                        <div class="list_tit">취업 상태</div>
                        <div class="list_cont">empmSttsCn</div>
                    </li>
                    <li>
                        <div class="list_tit">특화 분야</div>
                        <div class="list_cont">splzRlmRqisCn</div>
                    </li>
                    <li>
                        <div class="list_tit">추가 단서 사항</div>
                        <div class="list_cont">aditRscn</div>
                    </li>
                    <li>
                        <div class="list_tit">참여 제한 대상</div>
                        <div class="list_cont">prcpLmttTrgtCn</div>
                    </li>
                </ul>
            </div>
            <div class="tbl-header">
                <h3 class="h3-tit">신청방법</h3>
            </div>
            <div class="table_wrap">
                <ul class="common_table01 type2">
                    <li>
                        <div class="list_tit">신청 절차</div>
                        <div class="list_cont">rqutProcCn</div>
                    </li>
                    <li>
                        <div class="list_tit">심사 및 발표</div>
                        <div class="list_cont">jdgnPresCn</div>
                    </li>
                    <li>
                        <div class="list_tit">신청 사이트</div>
                        <div
                            class="list_cont"
                            style="word-break: break-all"
                        >rqutUrla</div>
                    </li>
                    <li>
                        <div class="list_tit">제출 서류</div>
                        <div class="list_cont">pstnPaprCn</div>
                    </li>
                </ul>
            </div>
            <div class="tbl-header">
                <h3 class="h3-tit">기타</h3>
            </div>
            <div class="table_wrap">
                <ul class="common_table01 type2">
                    <li>
                        <div class="list_tit">기타 유익 정보</div>
                        <div class="list_cont">
                            기타유익정보내용
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">주관 기관</div>
                        <div class="list_cont">mngtMson</div>
                    </li>
                    <li>
                        <div class="list_tit">운영 기관</div>
                        <div class="list_cont">cnsgNmor</div>
                    </li>
                    <li>
                        <div class="list_tit">사업관련 참고 사이트 1</div>
                        <div class="list_cont" style="word-break: break-all">
                            rfcSiteUrla1
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">사업관련 참고 사이트 2</div>
                        <div class="list_cont" style="word-break: break-all">
                            rfcSiteUrla2
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">첨부파일</div>
                        <div class="list_cont">첨부파일내용</div>
                    </li>
                </ul>
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
    		function redirectToMain() {
    		    window.location.href = "main.jsp";
    		}  
    	</script>
    </body>
</html>
