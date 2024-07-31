<%@page import="com.model.RecPolicyDAO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
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
    <link rel="stylesheet" href="CSS/policyViewST.css" />
    <style>
        /* 정책 정보 테이블 스타일 */
        .table_wrap {
            margin-bottom: 30px;
        }
        
        .common_table01.type2 {
            width: 100%;
            border-collapse: collapse;
        }
        
        .common_table01.type2 li {
            display: flex;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .common_table01.type2 li:last-child {
            border-bottom: none;
        }
        
        .list_tit, .list_cont {
            padding: 15px;
            line-height: 1.5;
        }
        
        .list_tit {
            width: 30%;
            background-color: #f5f5f5;
            font-weight: bold;
            border-right: 1px solid #e0e0e0;
        }
        
        .list_cont {
            width: 70%;
        }
        
        /* 섹션 제목 스타일 */
        .tbl-header {
            margin-top: 30px;
            margin-bottom: 15px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        
        .h3-tit {
            font-size: 1.2em;
            color: #333;
            margin: 0;
        }
        
        /* 정책 이름 스타일 */
        .doc_tit01.type2 {
            font-size: 1.8em;
            color: #0066cc;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #0066cc;
        }
        
        /* 컨테이너 스타일 수정 */
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .common_table01.type2 li {
                flex-direction: column;
            }
        
            .list_tit, .list_cont {
                width: 100%;
                border-right: none;
            }
        
            .list_tit {
                border-bottom: 1px solid #e0e0e0;
            }
        }
    </style>
</head>
<body>
<%
    UserDTO info = (UserDTO)session.getAttribute("user");
%>
<header>
    <nav>
        <div class="logo">
            <a href="main.jsp"> <img src="image/Blue Wave.png" alt="Blue Wave Logo"> </a>
        </div>
    </nav>
</header>
<%    
    String policyId = request.getParameter("policyId");
    PolicyDAO policyDAO = new PolicyDAO();
    PolicyDTO policy = null;

    if (policyId != null && !policyId.isEmpty()) {
        policy = policyDAO.getPolicyById(policyId);
    }

    if (policy != null) {
%>
<%
    String category = "-";
    if (policy.getPOLICY_FIELD_CODE().equals("23010") || policy.getPOLICY_FIELD_CODE().equals("023010")) {
        category = "일자리 분야";
    } else if (policy.getPOLICY_FIELD_CODE().equals("23020") || policy.getPOLICY_FIELD_CODE().equals("023020")) {
        category = "주거 분야";
    } else if (policy.getPOLICY_FIELD_CODE().equals("23030") || policy.getPOLICY_FIELD_CODE().equals("023030")) {
        category = "교육 분야";
    } else if (policy.getPOLICY_FIELD_CODE().equals("23040") || policy.getPOLICY_FIELD_CODE().equals("023040")) {
        category = "복지.문화 분야";
    } else if (policy.getPOLICY_FIELD_CODE().equals("23050") || policy.getPOLICY_FIELD_CODE().equals("023050")) {
        category = "참여.권리 분야";
    }
%>
<div class="container">
    <h2 class="doc_tit01 type2"><%=policy.getPOLICY_NAME()%></h2>
    <div class="tbl-header">
        <h3 class="h3-tit">정책 정보 요약</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <% if (policy.getPOLICY_ID() != null) { %>
            <li>
                <div class="list_tit">정책 번호</div>
                <div class="list_cont"><%= policy.getPOLICY_ID() %></div>
            </li>
            <% } %>
            <% if (category != null && !category.equals("-")) { %>
            <li>
                <div class="list_tit">정책 분야</div>
                <div class="list_cont"><%= category %></div>
            </li>
            <% } %>
            <% if (policy.getSUPPORT_CONTENT() != null) { %>
            <li>
                <div class="list_tit">지원 내용</div>
                <div class="list_cont"><%= policy.getSUPPORT_CONTENT() %></div>
            </li>
            <% } %>
            <% if (policy.getOPERATION_PERIOD() != null) { %>
            <li>
                <div class="list_tit">사업 운영 기간</div>
                <div class="list_cont"><%= policy.getOPERATION_PERIOD() %></div>
            </li>
            <% } %>
            <% if (policy.getAPPLICATION_PERIOD() != null) { %>
            <li>
                <div class="list_tit">사업 신청 기간</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PERIOD() %></div>
            </li>
            <% } %>
            <% if (policy.getSUPPORT_SCALE() != null) { %>
            <li>
                <div class="list_tit">지원 규모(명)</div>
                <div class="list_cont"><%= policy.getSUPPORT_SCALE() %></div>
            </li>
            <% } %>
            <% if (policy.getETC() != null) { %>
            <li>
                <div class="list_tit">비고</div>
                <div class="list_cont"><%= policy.getETC() %></div>
            </li>
            <% } %>
        </ul>
    </div>
    <div class="tbl-header">
        <h3 class="h3-tit">신청자격</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <% if (policy.getAGE_INFO() != null) { %>
            <li>
                <div class="list_tit">연령</div>
                <div class="list_cont"><%= policy.getAGE_INFO() %></div>
            </li>
            <% } %>
            <% if (policy.getRESIDENCE_INCOME_CONDITION() != null) { %>
            <li>
                <div class="list_tit">거주지 및 소득</div>
                <div class="list_cont"><%= policy.getRESIDENCE_INCOME_CONDITION() %></div>
            </li>
            <% } %>
            <% if (policy.getPOLICY_DESC() != null) { %>
            <li>
                <div class="list_tit">학력</div>
                <div class="list_cont"><%= policy.getPOLICY_DESC() %></div>
            </li>
            <% } %>
            <% if (policy.getSUPPORT_CONTENT() != null) { %>
            <li>
                <div class="list_tit">전공</div>
                <div class="list_cont"><%= policy.getSUPPORT_CONTENT() %></div>
            </li>
            <% } %>
            <% if (policy.getAPPLICATION_PROCESS() != null) { %>
            <li>
                <div class="list_tit">취업 상태</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PROCESS() %></div>
            </li>
            <% } %>
            <% if (policy.getAPPLICATION_PROCEDURE() != null) { %>
            <li>
                <div class="list_tit">특화 분야</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PROCEDURE() %></div>
            </li>
            <% } %>
            <% if (policy.getSUPPORT_SCALE() != null) { %>
            <li>
                <div class="list_tit">추가 단서 사항</div>
                <div class="list_cont"><%= policy.getSUPPORT_SCALE() %></div>
            </li>
            <% } %>
        </ul>
    </div>
    <div class="tbl-header">
        <h3 class="h3-tit">신청 절차</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <% if (policy.getAPPLICATION_PROCEDURE() != null) { %>
            <li>
                <div class="list_tit">신청 절차</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PROCEDURE() %></div>
            </li>
            <% } %>
            <% if (policy.getEVALUATION_AND_ANNOUNCEMENT() != null) { %>
            <li>
                <div class="list_tit">심사 및 발표</div>
                <div class="list_cont"><%= policy.getEVALUATION_AND_ANNOUNCEMENT() %></div>
            </li>
            <% } %>
            <% if (policy.getAPPLICATION_SITE_URL() != null && !policy.getAPPLICATION_SITE_URL().isEmpty()) { %>
            <li>
                <div class="list_tit">신청 사이트</div>
                <div class="list_cont" style="word-break: break-all">
                    <a href="<%= policy.getAPPLICATION_SITE_URL() %>" target="_blank">
                        <%= policy.getAPPLICATION_SITE_URL() %>
                    </a>
                </div>
            </li>
            <% } %>
            <% if (policy.getSUBMISSION_DOCUMENTS() != null) { %>
            <li>
                <div class="list_tit">제출 서류</div>
                <div class="list_cont"><%= policy.getSUBMISSION_DOCUMENTS() %></div>
            </li>
            <% } %>
        </ul>
    </div>
    <div class="tbl-header">
        <h3 class="h3-tit">기타</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <% if (policy.getETC() != null) { %>
            <li>
                <div class="list_tit">기타 유익 정보</div>
                <div class="list_cont"><%= policy.getETC() %></div>
            </li>
            <% } %>
            <% if (policy.getMAIN_DEPARTMENT_NAME() != null) { %>
            <li>
                <div class="list_tit">주관 기관</div>
                <div class="list_cont"><%= policy.getMAIN_DEPARTMENT_NAME() %></div>
            </li>
            <% } %>
            <% if (policy.getOPERATING_INSTITUTION_NAME() != null) { %>
            <li>
                <div class="list_tit">운영 기관</div>
                <div class="list_cont"><%= policy.getOPERATING_INSTITUTION_NAME() %></div>
            </li>
            <% } %>
            <% if (policy.getREFERENCE_SITE_URL1() != null && !policy.getREFERENCE_SITE_URL1().isEmpty()) { %>
            <li>
                <div class="list_tit">사업관련 참고 사이트 1</div>
                <div class="list_cont" style="word-break: break-all">
                    <a href="<%= policy.getREFERENCE_SITE_URL1() %>" target="_blank">
                        <%= policy.getREFERENCE_SITE_URL1() %>
                    </a>
                </div>
            </li>
            <% } %>
            <% if (policy.getREFERENCE_SITE_URL2() != null && !policy.getREFERENCE_SITE_URL2().isEmpty()) { %>
            <li>
                <div class="list_tit">사업관련 참고 사이트 2</div>
                <div class="list_cont" style="word-break: break-all">
                    <a href="<%= policy.getREFERENCE_SITE_URL2() %>" target="_blank">
                        <%= policy.getREFERENCE_SITE_URL2() %>
                    </a>
                </div>
            </li>
            <% } %>
        </ul>
    </div>
</div>
<%
    } else {
%>
<p>해당 정책을 찾을 수 없습니다.</p>
<%
    }
%>
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
