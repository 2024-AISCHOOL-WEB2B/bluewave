<%@page import="com.model.CommentDAO"%>
<%@page import="com.model.CommentDTO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.model.PostDTO"%>
<%@page import="com.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page
   import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewPost파일</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="CSS/base.css">

<style>
/* 전체 페이지 스타일 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 컨테이너 스타일 */
.container {
    width: 800px;
    margin: 100px auto; /* 중앙 정렬 및 위아래 여백 */
    padding: 20px; /* 내부 여백 설정 */
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff;
    position: relative; /* 위치 설정을 위해 relative로 설정 */
    margin-top: 10px;
}

/* h1 태그 스타일 */
.container h1 {
    font-size: 24px;
    margin: 0 0 10px 0; /* 하단 여백 조정 */
    padding: 0; /* 패딩 초기화 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
    position: relative; /* 기본 위치 설정 */
    left: 0; /* 컨테이너의 왼쪽에서 시작하도록 설정 */
}



.created_at {
	position: relative;
	left: 520px;
}

.content {
	min-height: 350px; /* 최소 높이 설정 */
	padding-bottom: 50px;
}



/* 댓글 작성 폼 스타일 */
.comment-form {
    margin-top: 20px;
}

.comment-form textarea {
    width: 100%;
    height: 80px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-bottom: 10px;
    font-size: 16px;
}

.comment-form button {
    width: 100%;
}

/* 댓글 목록 테이블 스타일 */
.comment-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.comment-table th, .comment-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

.comment-table th {
    background-color: #f8f9fa;
}



.like-button-form {
    text-align: center; /* 버튼을 중앙 정렬 */
    margin-top: 20px; /* 버튼 위 여백 조정 */
    
}

.like-button-form button {
    background-color: #007bff;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px 0;
    cursor: pointer;
    border-radius: 4px;
}
button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
   <%
   //post관련 객체 생성
   PostDAO dao = new PostDAO();
   PostDTO dto = new PostDTO();
   int post_idx = Integer.parseInt(request.getParameter("post_idx"));
   dto = dao.postSearch(post_idx);
   
   //현재 유저의 정보 가져오기 - 세션
   UserDTO user = (UserDTO) session.getAttribute("user");

   String user_id = dto.getUserId();//작성자ID
   String post_title = dto.getPostTitle(); //타이틀
   String post_content = dto.getPostContents(); //내용
   String post_file = dto.getPostFile(); //첨부파일
   Timestamp created_at = dto.getCreatedAt();
   Timestamp updated_at = dto.getUpdatedAt();
   int post_views = dto.getPostViews();
   %>
	<header>
		<nav>
		    <div class="logo">
		        <a href="main.jsp"> <img src="image/Blue Wave.png" alt="Blue Wave Logo"> </a>
		    </div>
		
		    <div class="right-menu">
		        <%
		        if (user != null) {
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
	<div class="title">
	    <h1><%=post_title%></h1>
	    <div>
	        작성자 : <span><%=user_id%></span>
	        <span class="created_at"><%= created_at%></span>
	    </div>
	    <hr>
	</div>

   <main>
      <p class="content">
         <%=post_content%>
      </p>
      <p>
         첨부 파일 :
         <%=post_file%>
      </p>

		<!-- 좋아요 버튼 폼 -->
		<form action="PostLikeService" method="post" class="like-button-form">
		    <input type="hidden" value="<%=post_idx%>" name="post_idx">
		    <button type="submit">좋아요! (클릭)</button>
		</form>


      <%
      int post_likes = dto.getPostLikes();
      %>
      <p>
         추천(좋아요)수 :
         <%=post_likes%></p>

      <!-- 댓글 작성 폼 추가 -->
      <h2>댓글</h2>
      <form action="CommentServlet" method="post" class="comment-form">
         <%
         if (user == null || user.getUserId() == null) {
             response.sendRedirect("retry.jsp");
         } else {
             String userid = user.getUserId();
         %>
         <input type="hidden" value="<%=post_idx%>" name="post_idx">
         <textarea name="comment_content" placeholder="댓글 내용을 입력하세요" required></textarea>
         <button type="submit">댓글 작성</button>
         <% } %>
      </form>

      <!-- 댓글 목록 출력 -->
      <%
      CommentDAO commentDao = new CommentDAO();
      List<CommentDTO> commentList = commentDao.getCommentsByPostId(post_idx);
      if (commentList != null && !commentList.isEmpty()) {
      %>
      <table class="comment-table">
         <thead>
            <tr>
               <th>작성자</th>
               <th>내용</th>
               <th>작성일</th>
            </tr>
         </thead>
         <tbody>
            <%
            for (CommentDTO comment : commentList) {
            %>
            <tr>
               <td><%= comment.getUserId() %></td>
               <td><%= comment.getCommentContent() %></td>
               <td><%= comment.getCreatedAt() %></td>
            </tr>
            <%
            }
            %>
         </tbody>
      </table>
      <%
      } else {
      %>
      <p>댓글이 없습니다.</p>
      <%
      }
      %>

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
</body>
</html>

