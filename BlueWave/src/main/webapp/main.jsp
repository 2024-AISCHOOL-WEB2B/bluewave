<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blue Wave</title>
<link rel="stylesheet" href="CSS/main.css">
</head>
<body>

	<%
	UserDTO info = (UserDTO) session.getAttribute("user");
	%>
	
	<header>
		<nav>
			<div class="logo">
				<a href="#"> <img src="image/Blue Wave.png" alt="Blue Wave Logo">
				</a>
			</div>

			<div class="right-menu">
				<%
				if (info != null) {
				%>
				<a href="LogoutServlet">로그아웃<a> <%
 } else {
 %> <a
						href="login.jsp">로그인</a> <%
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
				<a href="policySuggest.jsp" class="rainbow-button"> 지금 바로 혜택
					받을수있는<br>정책 추천받기
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

			</div>

			<br> <br> <br> <br> <br> <br>

			<!--커뮤니티 글 표시-->
			<div class="popular-post">
				<div class="post-content">
					<h2 class="post-title">아이패드병에 걸린 청년들을 지원하는 정책</h2>
					<p class="post-description">금속한 사회 디지털화로 인해 청년층의 디지털 역량 강화가
						시급해졌습니다. 이에 정부 아이패드 지원 정책은 취업난 해소를 위한 디지털 스킬 향상에 기여하며, 경제적 여건에
						관계없이 균등한 학습 기회를 제공해 교육의 격차를 줄일 수 있습니다. 또한 4차 산업혁명 시대를 대비하고 창업 생태계를
						활성화하는 디지털 도구를 지원함으로써, 국가 전체의 디지털 경쟁력을 강화하고 청년층의 디지털 소외 현상을 방지하는 데
						크게 기여할 것입니다.</p>
				</div>

				<div class="post-image">
					<img src="image/unnamed.jpg" alt="아이패드 정책 관련 이미지">
				</div>
			</div>

			<!-- 두번째 게시글 섹션 추가
            <div class="second-post">
                <h2 class="post-title">두번째 게시글 제목</h2>
                <p class="post-description">여기에 두번째 게시글 내용을 추가합니다...</p>
            </div> -->
			<!--커뮤니티 글 좋아요/싫어요 커뮤니티 이동-->
			<div class="post-actions">

				<button class="like-btn">
					<img src="image/like_hand.png" alt=""><br> 좋은 아이디어입니다!
				</button>

				<button class="dislike-btn">
					<img src="image/like_hand.png" alt=""><br> 별로인것 같아요..
				</button>

				<button class="community-btn"
					onclick="location.href='community.jsp'">
					토론 참여하기<br> (커뮤니티 입장)

				</button>
			</div>


			<div class="news_list">
				<h2>핫한 청년뉴스</h2>
				<ul class="lists">

					<li>제목을 입력하세요 <br> 여기는 간단한 설명입니다
					</li>
					<li>제목을 입력하세요 <br> 여기는 간단한 설명입니다
					</li>
					<li>제목을 입력하세요 <br> 여기는 간단한 설명입니다
					</li>
					<li>제목을 입력하세요 <br> 여기는 간단한 설명입니다
					</li>
					<li>제목을 입력하세요 <br> 여기는 간단한 설명입니다
					</li>
				</ul>
			</div>





			<br> <br> <br>
	</main>

	<!-- 웹페이지 최하단 -->
	<footer>
		<div class="footer-container">
			<img src="image/Blue Wave.png" alt="Logo" class="footer-logo">
			<nav class="footer-nav">
				<a href="#">팀 소개</a> <a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a
					href="#">시스템 문의</a>
			</nav>
		</div>
	</footer>
</body>
</html>