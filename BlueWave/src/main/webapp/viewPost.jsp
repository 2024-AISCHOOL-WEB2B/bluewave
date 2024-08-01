<%@page import="com.model.CommentDAO"%>
<%@page import="com.model.CommentDTO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.model.PostDTO"%>
<%@page import="com.model.PostDAO"%>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
            padding-bottom: 10px;
            border: none;
            background-color: #fafafa;
            position: relative; /* 위치 설정을 위해 relative로 설정 */
            margin-top: 10px;
            height: 1200%
        }
        
		.communityName {
		    display: block;
		    font-size: 2em;
		    margin-block-start: 0.67em;
		    margin-block-end: 0.67em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    unicode-bidi: isolate;
		    text-align: center; /* 텍스트 중앙 정렬 */
		    width: 100%; /* 전체 너비를 차지하도록 설정 */
		    font-style: italic; /* 이탤릭체 적용 */
		    margin-bottom: 100px;
		    font-weight: bold; /* 볼드체 적용 */
		}
		.communityName:hover {
		    cursor: pointer; /* 손가락 모양 커서로 변경 */
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
        
        .content {
            min-height: 350px; /* 최소 높이 설정 */
            padding-bottom: 50px;
        }
        
        /* 댓글 작성 폼 스타일 */
        .comment-form {
            margin-top: 20px;
            display: flex; /* 플렉스 박스를 사용하여 가로 배치 */
            gap: 10px; /* 입력 필드와 버튼 사이의 간격 */
        }
        
        .comment-form textarea {
            flex: 1; /* 입력 필드가 가능한 한 넓게 확장되도록 설정 */
            height: 80px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        
        .comment-form button {
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            width: 10%;
        }
        
        .comment-form button:hover {
            background-color: #0056b3;
        }
        
        /* 댓글 목록 스타일 */
        .commentRow {
            margin: 0px;
            background-color: #eeeeee;
            padding: 10px 5px 10px 15px;
            border-radius: 20px;
            margin-bottom: 10px;
        }
        
        .commentUser {
            margin-bottom: 0px;
            margin-top: 5px;
            font-size: 15px;
        }
        
        .commentContent{
            margin-bottom: 0px;
            margin-top: 5px;
        }
        
        .commentDate {
            margin-bottom: 0px;
            margin-top: 5px;
            font-size: 10px;
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
            border-radius: 100%;
            width: 90px;
            height: 90px;
        }
        
        button:hover {
            background-color: #0056b3;
        }
        
        .like-button {
            background-color: #f0f0f0;
            border: none;
            color: #333;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 20px;
            transition: all 0.3s ease;
        }
        
        .like-button:hover {
            background-color: #ff6b6b;
            color: white;
        }
        
        .like-button .like-count {
            font-weight: bold;
            margin-left: 5px;
        }
        
        /* 댓글 입력 스타일 수정 */
        .comment-input {
            width: 97%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            resize: vertical;
        }

        /* 포스트 헤더 스타일 */
        .posthead {
            display: flex; /* 플렉스 박스를 사용하여 가로 배치 */
            justify-content: space-between; /* 양쪽 끝으로 배치 */
            margin-bottom: 10px; /* 하단 여백 설정 */
        }
    </style>
</head>
<body>
    <%
        // post 관련 객체 생성
        PostDAO dao = new PostDAO();
        PostDTO dto = new PostDTO();
        int post_idx = Integer.parseInt(request.getParameter("post_idx"));
        dto = dao.postSearch(post_idx);
        
        // 현재 유저의 정보 가져오기 - 세션
        UserDTO user = (UserDTO) session.getAttribute("user");
        
        String user_id = dto.getUserId(); // 작성자 ID
        String post_title = dto.getPostTitle(); // 타이틀
        String post_content = dto.getPostContents(); // 내용
        String post_file = dto.getPostFile(); // 첨부파일
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
    <p class="communityName" onclick="redirectToCommunity()">VOICE of YOUTH</p>
        <div class="title">
            <h1><%= post_title %></h1>
            <div class="posthead">
                <span>작성자 :<%= user_id %></span>
                <span class="created_at"><%= created_at %></span>
            </div>
            <hr>
        </div>
        
        <main>
            <p class="content"><%= post_content %></p>
            <% if (post_file != null && !post_file.isEmpty()) { %>
                <p>첨부 파일 : <%= post_file %></p>
            <% } %>
            
            <%
                int post_likes = dto.getPostLikes();
            %>
            
            <!-- 좋아요 버튼 폼 -->
            <form action="PostLikeService" method="post" class="like-button-form">
                <input type="hidden" value="<%= post_idx %>" name="post_idx">
                <button type="submit"><img src="image/likehand.png" alt="like" style="width: 50%; height: auto;"><br><span style="position: relative; top: 5px;"><%= post_likes %></span></button> 
            </form>
            
            <!-- 댓글 작성 폼 추가 -->
            <h2>댓글</h2>
            <form action="CommentServlet" method="post" class="comment-form" id="commentForm">
                <%
                    if (user == null || user.getUserId() == null) {
                        response.sendRedirect("retry.jsp");
                        return; // 리다이렉션 후 스크립트 실행 방지
                    } else {
                        String userid = user.getUserId();
                %>
                <input type="hidden" value="<%= post_idx %>" name="post_idx">
                <input type="text" name="comment_content" placeholder="댓글 내용을 입력하세요" required class="comment-input">
                <button type="submit" class="addCommentBtn">작성</button>
                <% } %>
            </form>
            <hr>
            
            <!-- 댓글 목록 출력 -->
            <%
                CommentDAO commentDao = new CommentDAO();
                List<CommentDTO> commentList = commentDao.getCommentsByPostId(post_idx);
                if (commentList != null && !commentList.isEmpty()) {
            %>
                <%
                    for (CommentDTO comment : commentList) {
                %>
                <div class="commentRow">
                    <p class="commentUser"><%= comment.getUserId() %></p>
                    <p class="commentContent"><%= comment.getCommentContent() %></p>
                    <p class="commentDate"><%= comment.getCreatedAt() %></p>
                </div>
                <%
                    }
                %>
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
    
    <script>
        document.querySelector('.comment-input').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                document.getElementById('commentForm').submit();
            }
        });
    	function redirectToCommunity() {
    	    window.location.href = "community.jsp";
    	} 
    </script>
</body>
</html>
