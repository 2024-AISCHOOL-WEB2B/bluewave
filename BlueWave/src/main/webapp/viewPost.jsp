<%@page import="java.sql.Timestamp"%>
<%@page import="com.model.PostDTO"%>
<%@page import="com.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	int post_likes = dto.getPostLikes();
	int post_views = dto.getPostViews();
	%>

	<header>
		<h1>
			환영합니다
			<%=user_id%>님의 글 제목
			<%=post_title%></h1>
	</header>
	<main>
		<p>내용</p>
		<p><%=post_content%></p>
		<p><%=post_file%></p>
		<!-- 좋아요 버튼 추가 -->
		<form action="PostLikeService" method="post">
			<input type="hidden" name="post_idx" value="<%=post_idx%>">
			<button type="submit">
				추천 수 : (<%=post_likes%>)
			</button> <!-- 좋아요 -->
		</form>
	</main>
</body>
</html>
