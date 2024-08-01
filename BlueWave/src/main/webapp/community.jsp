
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.model.PostDTO"%>
<%@page import="com.model.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 목록</title>
<link rel="stylesheet" href="CSS/baseStyle.css">

 <style>
 	/* communityStyles.css */
  .communityName {
      font-weight: bold;
      font-style: italic;
  }
  /* bestPost 클래스 스타일 */
  .bestPost {
      font-size: 24px;
      font-weight: bold;
      background: linear-gradient(90deg, #75ffaa, #75ffb1, #75ffcc, #75ffe8, #75f1ff, #75c8ff, #75afff);
      -webkit-background-clip: text; /* 텍스트에 배경을 적용 */
      -webkit-text-fill-color: transparent; /* 텍스트 색상을 투명으로 설정 */
  }
  body {
      font-family: Arial, sans-serif;
      background-color: #ffffff;
      margin: 0;
      padding: 0;
  }
  .container {
      max-width: 1200px;
      margin: 0 auto;
      margin-bottom: 170px;
      padding: 40px;
      background-color: #fafafa;
  }
  .title {
      text-align: center;
      margin-bottom: 30px;
  }
  .title span {
      font-size: 24px;
      font-weight: bold;
      color: #333;
  }
  .title hr {
      width: 50%;
      margin: 10px auto;
      border: none;
      border-top: 2px solid #007bff;
  }
  .bestPostSection {
      background-color: #e9f5ff;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 30px;
  }
  .communityNav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 0px;
  }
  .communityNav h1 {
      font-size: 25px;
      font-style: bold;
      color: #333;
      margin-bottom: 0px;
  }
  .write-button {
      padding: 5px 20px 5px 20px;
      background-color: #d9d9d9;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
      position: relative;
      top: 7px;
  }
  .write-button:hover {
      background-color: #7b96ff;
  }
  table {
      width: 100%;
      border-collapse: collapse;
      background-color: #ffffff;
  }
  td {
      padding: 7px 15px;
      text-align: left;
  }
  .postRow {
      border-bottom: 1px solid #ddd;
      cursor: pointer; /* 클릭 가능하게 커서 변경 */
  }
  .createAt {
      text-align: right;
  }
  tbody tr:hover {
      background-color: #f9f9f9;
  }
  a {
      color: #007bff;
      text-decoration: none;
  }
  a:hover {
      text-decoration: underline;
  }
  footer {
      background-color: #333;
      color: #fff;
      padding: 20px 0;
      margin-top: 40px;
  }
  .footer-container {
      max-width: 1200px;
      margin: 0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
  }
  .footer-logo {
      height: 40px;
  }
  .footer-nav a {
      color: #fff;
      margin-left: 20px;
      text-decoration: none;
  }
  .footer-nav a:hover {
      text-decoration: underline;
  }
  h1:hover {
      cursor: pointer; /* 손가락 모양 커서로 변경 */
  }
  
  /* bestPostView 버튼 스타일 */
.bestPostView {
    padding: 5px 10px; /* 여백 조정 */
    font-size: 12px; /* 폰트 크기 조정 */
    color: #fff; /* 텍스트 색상 */
    background-color: #007bff; /* 배경색 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    cursor: pointer; /* 커서 손가락 모양으로 변경 */
    transition: background-color 0.3s, transform 0.3s; /* 애니메이션 효과 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

.bestPostView:hover {
    background-color: #0056b3; /* 호버 시 배경색 변경 */
    transform: scale(1.02); /* 호버 시 버튼 확대 효과 */
}

.bestPostView:focus {
    outline: none; /* 포커스 시 외곽선 제거 */
}
  
 </style>

</head>
<body>
<%
PostDAO dao = new PostDAO();
PostDTO dto = new PostDTO();
List<PostDTO> postList = dao.getAllPosts();
response.setCharacterEncoding("EUC-KR");
%>
<%
UserDTO info = (UserDTO) session.getAttribute("user");
%>

<header>
    <nav>
        <div class="logo">
            <a href="main.jsp"> <img src="image/Blue Wave.png" alt="Blue Wave Logo"> </a>
        </div>
        
        <div class="right-menu">
            <%
            if (info != null) {
            %>
                <a class="logNavBtn" href="LogoutServlet">로그아웃</a>
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
<div class="container">
    <main>
        <div class="title">
            <h1 class="communityName" onclick="redirectToCommunity()">VOICE of YOUTH</h1>
            <hr>
            <h2><span class="bestPost">최다 추천 글</span></h2>
        </div>
        <div class="bestPostSection">
            <% 
            PostDTO mostLikedPost = dao.getMostLikedPost();
            if (mostLikedPost != null) {
            %>
                <%= mostLikedPost.getPostTitle() %>
            <% 
            } else {
            %>
                <p>현재 추천 글이 없습니다.</p>
            <% 
            } 
            %>
            <hr>
            <p><%= mostLikedPost.getPostContents()%></p>
            <button class="bestPostView" data-post-idx="<%= mostLikedPost.getPostIdx() %>">댓글로 소통하러 가기</button>
        </div>
        <div class="communityNav">
            <h1>글 목록</h1>
            <button class="write-button" onclick="location.href='write.jsp'">글 작성하기</button>
        </div>
        <hr>
        <table>
            <tbody>
                <% for(PostDTO post : postList) { %>
                <tr class="postRow" data-post-idx="<%= post.getPostIdx() %>">
                    <!--<td><%= post.getPostIdx() %></td> 보통 커뮤니티 게시글에 id는 표시하지않아서 제외  -->
                    <td><%= post.getPostTitle() %></td>
                    <td><%= post.getUserId() %></td>
                    <td class="createAt"><%= post.getCreatedAt() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </main>
</div>

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
function redirectToCommunity() {
    window.location.href = "community.jsp";
}

function redirectToViewPost(postIdx) {
    window.location.href = "viewPost.jsp?post_idx=" + postIdx;
}

// 게시글 클릭시 상세보기로 이동
document.querySelectorAll('.postRow').forEach(row => {
    row.addEventListener('click', function() {
        const postIdx = this.getAttribute('data-post-idx');
        redirectToViewPost(postIdx);
    });
});

document.querySelectorAll('.bestPostView').forEach(row => {
    row.addEventListener('click', function() {
        const postIdx = this.getAttribute('data-post-idx');
        redirectToViewPost(postIdx);
    });
});
</script>
</body>
</html>

