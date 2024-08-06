<%@page import="com.model.PostDTO"%>
<%@page import="com.model.PostDAO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@page import="com.model.PolicyDAO"%>
<%@page import="com.model.PolicyDTO"%>
<%@page import="com.util.PolicyUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blue Wave</title>
<link rel="stylesheet" href="CSS/base.css">
<link rel="stylesheet" href="CSS/mainStyle.css">

<style>

	header,
	main,
	footer {
	    width: 100%;
	}
	
	.container {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    width: 100%;
	    box-sizing: border-box;
	    margin-bottom: 100px;
	}
	
	.logoutNavBtn {
		position: relative;
		left: 1000px;
	}
	
	.recPolicyList {
	    background-color: #ececec;
	    margin-top: 25px;
	    padding: 20px;
	    width: calc(25% - 25px); /* 4개가 한 줄에 배치 */
	    box-sizing: border-box;
	    border-radius: 10px;
	}

	.recPolicyList h3, .recPolicyList .from, .recPolicyList .date {
        white-space: nowrap; /* 텍스트가 한 줄로 표시되도록 설정 */
        overflow: hidden;    /* 텍스트가 넘칠 경우 숨기도록 설정 */
        text-overflow: ellipsis; /* 넘치는 텍스트를 '...'으로 표시 */
        width: 100%; /* 부모 요소의 너비를 기준으로 오버플로우 처리 */
    }

	.recPolicyList h3{
        width: 250px; /* 너비 설정 */
	}
	.from{
        width: 250px; /* 너비 설정 */
	}
	.date{
        width: 250px; /* 너비 설정 */

	}
	
	.policyFeed h2 {
		margin-bottom: 0px;
		margin-top: 60px;
	}
	.rainbow-button {
	    display: inline-block;
	    padding: 15px 40px;
	    font-size: 24px;
	    font-weight: bold;
	    text-decoration: none;
	    color: white;
	    background: linear-gradient(
	        90deg,
	        #65b2ff,
	        #ff66b2
	    );
	    border-radius: 25px;
	    transition: transform 0.3s ease;
	    line-height: 1.3;
	    width: auto;
	}
	
	.rainbow-button:hover {
	    transform: scale(1.05);
	}
	
	<style>
    /* 버튼 공통 스타일 */
    .btn, .rainbow-button, .like-btn, .dislike-btn, .community-btn, .view, .allpolicyViewButton {
        display: inline-block;
        text-decoration: none;
        
        cursor: pointer;
    }

    /* 호버 시 애니메이션 효과 */
    .btn:hover, .rainbow-button:hover, .like-btn:hover, .dislike-btn:hover, .community-btn:hover, .view:hover, .allpolicyViewButton:hover {
        transform: scale(1.05); /* 버튼을 부드럽게 확대 */
        transition: transform 0.3s ease; /* 부드러운 애니메이션 추가 */
    }
    .popular-post {
    display: flex;
    background-color: #f0f8ff;
    border-radius: 0px;
    padding: 100px;
    padding-top: 50px;
    padding-bottom: 50px;
    margin-bottom: 20px;
    margin-left: -20px;
    margin-right: -20px;
    width: calc(100% + 40px);
    box-sizing: border-box;
    max-width: 3000px;
	}
</style>
	

</style>
</head>

<body>

	<%
	UserDTO info = (UserDTO) session.getAttribute("user");
	%>
	<%
	PolicyDAO policyDAO = new PolicyDAO();
	%>
	
	<header>
		<nav>
		    <div class="logo">
		        <a href="main.jsp"> <img src="image/Blue Wave.png" alt="Blue Wave Logo"> </a>
		    </div>
		
		    <div class="right-menu">
		        <%
		        if (info != null) {
		        %>	<a class="" href="userInfo.jsp">내 정보 관리</a>
		            <a class="logoutNavBtn" href="LogoutServlet">로그아웃</a>
		        <%
		        } else {
		        %>
		            <a class="logNavBtn" href="login.jsp">로그인</a>
		        <%
		        }
		        %>
		    </div>
		</nav>
	</header>

	<main>
		<div class="container">
			<div class="policy-container">
				<p class="policy-text">
					누구나 참여가능한 청년정책<br> <span id="Blue">블루웨이브</span>가 도와드립니다
				</p>
				<%
				if (info != null) {
				%>
				<a href="policyRecom.jsp" class="rainbow-button"> 지금 바로 참여 가능한<br>정책 추천받기
				</a>
				<%
				} else {
				%>
				<a href="register.jsp" class="rainbow-button"> 지금 바로 혜택 받을수있는<br>정책
					추천받기
				</a>
				<%
				}
				%>
			<div class="btn-wrap">

        </div>
			</div>

			<br> <br> <br> <br> <br> <br>
            <% 
            PostDAO dao = new PostDAO();
            PostDTO dto = new PostDTO();
            PostDTO mostLikedPost = dao.getMostLikedPost();
            %>
			<!--커뮤니티 글 표시-->
			<div class="popular-post">
				<div class="post-content">
					<h2 class="post-title"><%= mostLikedPost.getPostTitle() %></h2>
					<hr>
					<p class="post-description"><%= mostLikedPost.getPostContents()%></p>
				</div>

				<div class="post-image">
					<img src="image/unnamed.jpg" alt="아이패드 정책 관련 이미지">
				</div>
			</div>

			<!--커뮤니티 글 좋아요/싫어요 커뮤니티 이동-->
			<div class="post-actions">
	
				<% if(info != null) {%>
				<% int post_idx = mostLikedPost.getPostIdx(); %>
	            <form action="PostLikeService" method="post" class="like-button-form">
	                <input type="hidden" value="<%= post_idx %>" name="post_idx">
	                <button class="like-btn" type="submit"><img src="image/likehand.png" alt="like"><br> 좋은 아이디어입니다!</button>
	            </form>
	            <%} else {%>
	            <button class="like-btn"><img src="image/likehand.png" alt="like" onclick="redirectToLogin()"><br> 좋은 아이디어입니다!</button>
	            <%} %>


				<button class="community-btn"
					onclick="location.href='community.jsp'">
					토론 참여하기<br> (커뮤니티 입장)

				</button>
			</div>


			<h1>최신 정책 간단히 보기</h1>
			<%
			String[] fieldCodes = {"23010", "23020", "23030", "23040", "23050"};
			
			for (String fieldCode : fieldCodes) {
			    List<PolicyDTO> policies = policyDAO.getLatestPoliciesByField(fieldCode, 4);
			    
			    if (!policies.isEmpty()) {
			%>
			    <div class="policyFeed">
			        <h2><%= PolicyUtils.getCategory(fieldCode) %></h2>
			        <div class="Policy-row">
			            <% for (PolicyDTO policy : policies) { %>
			                <div class="recPolicyList">
			                    <div class="policy-info">
			                        <h3 title="<%= policy.getPOLICY_NAME() %>"><%= policy.getPOLICY_NAME() %></h3>
			                        <p class="from" title="<%= policy.getMAIN_DEPARTMENT_NAME() %>">주관: <%= policy.getMAIN_DEPARTMENT_NAME() %></p>
			                        <p class="date" title="<%= policy.getAPPLICATION_PERIOD() %>">기간: <%= policy.getAPPLICATION_PERIOD() %></p>
			                    </div>
			                    <div class="policy-actions">
			                        			                        <button class="btn view blue" onclick="redirectToPolicyView('<%= policy.getPOLICY_ID() %>')">
			                            상세보기
			                        </button>
			                    </div>
			                </div>
			            <% } %>
			        </div>
			    </div>
			<% 
			    }
			} 
			%>
                <button class="allpolicyViewButton" onclick="redirectToAllPolicy()">
                    <span class="APVbtn">모든 정책 조회하기</span>
                </button>
            </div>
        </main>

    <!-- 웹페이지 최하단 -->
    <footer>
        <div class="footer-container">
            <img src="image/Blue Wave.png" alt="Logo" class="footer-logo">
            <nav class="footer-nav">
                <a href="#">팀 소개</a>
                <a href="#">이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">시스템 문의</a>
            </nav>
        </div>
    </footer>
    <script>
        function redirectToAllPolicy() {
            // 올폴리씨로 이동
            window.location.href = "allPolicy.jsp";
        }
        
        function redirectToPolicyView(policyId) {
            console.log("Redirecting to policy view with ID: " + policyId);
            window.location.href = "policyView.jsp?policyId=" + policyId;
        }
        function redirectToLogin() {
            window.location.href = "login.jsp";
        }
    </script>
</body>
</html>

