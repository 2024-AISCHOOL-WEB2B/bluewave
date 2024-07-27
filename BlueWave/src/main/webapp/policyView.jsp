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
	if(policy.getPOLICY_FIELD_CODE().equals("23010")) {
		category = "일자리 분야";
	}else if(policy.getPOLICY_FIELD_CODE().equals("23020")) {
		category = "주거 분야";
	}else if(policy.getPOLICY_FIELD_CODE().equals("23030")) {
		category = "교육 분야";
	}else if(policy.getPOLICY_FIELD_CODE().equals("23040")) {
		category = "복지.문화 분야";
	}else if(policy.getPOLICY_FIELD_CODE().equals("23050")) {
		category = "참여.권리 분야";
	}

%>
<div class="container">
	<h2 class="doc_tit01 type2"><%=policy.getPOLICY_NAME()%></h2>
    <div class="tbl-header">
        <h3 class="h3-tit">한 눈에 보는 정책 요약</h3>
    </div>
    <div class="table_wrap">
        <ul class="common_table01 type2">
            <li>
                <div class="list_tit">정책 번호</div>
                <div class="list_cont"><%= policy.getPOLICY_ID() != null ? policy.getPOLICY_ID() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">정책 분야</div>
                <div class="list_cont"><%= category%></div>
            </li>
            <li>
                <div class="list_tit">지원 내용</div>
                <div class="list_cont"><%= policy.getSUPPORT_CONTENT() != null ? policy.getSUPPORT_CONTENT() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">사업 운영 기간</div>
                <div class="list_cont"><%= policy.getOPERATION_PERIOD() != null ? policy.getOPERATION_PERIOD() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">사업 신청 기간</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PERIOD() != null ? policy.getAPPLICATION_PERIOD() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">지원 규모(명)</div>
                <div class="list_cont"><%= policy.getSUPPORT_SCALE() != null ? policy.getSUPPORT_SCALE() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">비고</div>
                <div class="list_cont"><%= policy.getETC() != null ? policy.getETC() : "-" %></div>
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
                <div class="list_cont"><%= policy.getAGE_INFO() != null ? policy.getAGE_INFO() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">거주지 및 소득</div>
                <div class="list_cont"><%= policy.getRESIDENCE_INCOME_CONDITION() != null ? policy.getRESIDENCE_INCOME_CONDITION() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">학력</div>
                <div class="list_cont"><%= policy.getPOLICY_DESC() != null ? policy.getPOLICY_DESC() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">전공</div>
                <div class="list_cont"><%= policy.getSUPPORT_CONTENT() != null ? policy.getSUPPORT_CONTENT() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">취업 상태</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PROCESS() != null ? policy.getAPPLICATION_PROCESS() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">특화 분야</div>
                <div class="list_cont"><%= policy.getAPPLICATION_PROCEDURE() != null ? policy.getAPPLICATION_PROCEDURE() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">추가 단서 사항</div>
                <div class="list_cont"><%= policy.getSUPPORT_SCALE() != null ? policy.getSUPPORT_SCALE() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">참여 제한 대상</div>
                <div class="list_cont"><%= policy.getPARTICIPATION_LIMIT_TARGET() != null ? policy.getPARTICIPATION_LIMIT_TARGET() : "-" %></div>
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
                <div class="list_cont"><%= policy.getAPPLICATION_PROCEDURE() != null ? policy.getAPPLICATION_PROCEDURE() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">심사 및 발표</div>
                <div class="list_cont"><%= policy.getEVALUATION_AND_ANNOUNCEMENT() != null ? policy.getEVALUATION_AND_ANNOUNCEMENT() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">신청 사이트</div>
                <div class="list_cont" style="word-break: break-all"><%= policy.getAPPLICATION_SITE_URL() != null ? policy.getAPPLICATION_SITE_URL() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">제출 서류</div>
                <div class="list_cont"><%= policy.getSUBMISSION_DOCUMENTS() != null ? policy.getSUBMISSION_DOCUMENTS() : "-" %></div>
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
                <div class="list_cont"><%= policy.getETC() != null ? policy.getETC() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">주관 기관</div>
                <div class="list_cont"><%= policy.getMAIN_DEPARTMENT_NAME() != null ? policy.getMAIN_DEPARTMENT_NAME() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">운영 기관</div>
                <div class="list_cont"><%= policy.getOPERATING_INSTITUTION_NAME() != null ? policy.getOPERATING_INSTITUTION_NAME() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">사업관련 참고 사이트 1</div>
                <div class="list_cont" style="word-break: break-all"><%= policy.getREFERENCE_SITE_URL1() != null ? policy.getREFERENCE_SITE_URL1() : "-" %></div>
            </li>
            <li>
                <div class="list_tit">사업관련 참고 사이트 2</div>
                <div class="list_cont" style="word-break: break-all"><%= policy.getREFERENCE_SITE_URL2() != null ? policy.getREFERENCE_SITE_URL2() : "-" %></div>
            </li>
<!-- 		<li>
                <div class="list_tit">첨부파일</div>
                <div class="list_cont">첨부파일내용</div>
            </li> 첨부파일은 없으니 주석처리함 -->            
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
<script>
    function redirectToMain() {
        window.location.href = "main.jsp";
    }  
</script>
</body>
</html>
