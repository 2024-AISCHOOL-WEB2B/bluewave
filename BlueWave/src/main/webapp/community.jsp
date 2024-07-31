
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
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1); /* 영역 구분용 그림자 (나중에 지우기)*/
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
 </style>

</head>
<body>
      <%
      PostDAO dao = new PostDAO();
      PostDTO dto = new PostDTO();
       List<PostDTO> postList = dao.getAllPosts();
      int post_idx = dto.getPostIdx(); //글 인덱스 번호
      String user_id = dto.getUserId();//작성자ID
      String post_title = dto.getPostTitle(); //타이틀
      String post_content = dto.getPostContents(); //내용
      String post_file = dto.getPostFile(); //첨부파일
      Timestamp created_at = dto.getCreatedAt();
      Timestamp updated_at = dto.getUpdatedAt();
      int post_views = dto.getPostViews();
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
	    		<h1 class="communityName">VOICE of YOUTH</h1>
	    		<hr>
	    		<h2><span class="bestPost">최다 추천 글</span></h2>
	    	</div>
	    	<div class="bestPostSection">
	    	post
	    	</div>
	        <div class="communityNav">
		        <h1>글 목록</h1>
		        <button class="write-button" onclick="location.href='write.jsp'">글 작성하기</button>
	  	    </div>
	  	    <hr>
	        <table>
		        <tbody>
			        <% for(PostDTO post : postList) { %>
			        <tr class="postRow">
			            <!--<td><%= post.getPostIdx() %></td> 보통 커뮤니티 게시글에 id는 표시하지않아서 제외  -->
			            <td><a href="viewPost.jsp?post_idx=<%= post.getPostIdx() %>"><%= post.getPostTitle() %></a></td>
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
</body>
</html>
