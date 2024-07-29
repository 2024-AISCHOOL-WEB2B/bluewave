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
<link rel="stylesheet" type="text/css" href="CSS/viewPostStyles.css">
</head>
<body>
	<%
	PostDAO dao = new PostDAO();
	PostDTO dto = new PostDTO();
	int index_num = Integer.parseInt(request.getParameter("index_num"));
	dto = dao.postSearch(index_num);

	int post_idx = dto.getPostIdx(); //글 인덱스 번호
	String user_id = dto.getUserId();//작성자ID
	String post_title = dto.getPostTitle(); //타이틀
	String post_content = dto.getPostContents(); //내용
	String post_file = dto.getPostFile(); //첨부파일
	Timestamp created_at = dto.getCreatedAt();
	Timestamp updated_at = dto.getUpdatedAt();
	int post_views = dto.getPostViews();
	%>

	<header>
		<h1>
			환영합니다 <br>
			<%=user_id%>님의 글 <br> 제목
			<<%=post_title%>>
		</h1>
	</header>
	<main>
		<p>
			내용 :
			<%=post_content%></p>
		<p>
			첨부 파일 :
			<%=post_file%></p>

		<!-- 좋아요 버튼 추가 -->
		<form action="PostLikeService.java" method="post">
			<input type="hidden" name="index_num" value="<%=index_num%>">
			<!-- index_num 추가 -->
			<button type="submit">좋아요! (클릭)</button>
			<!-- 좋아요 -->
		</form>

		<%
		int post_likes = dto.getPostLikes();
		%>
		<p>
			추천(좋아요)수 :
			<%=post_likes%></p>
	</main>
</body>
</html>
