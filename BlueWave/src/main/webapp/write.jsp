<%@page import="com.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글쓰기 - 커뮤니티</title>
<link rel="stylesheet" type="text/css" href="CSS/WriteStyles.css">
</head>
<body>

	<%
		UserDTO info = (UserDTO)session.getAttribute("user");
		String userId = info.getUserId();
	%>
	
	<header>
		<h1>글쓰기</h1>
	</header>
	<main>
		<form action="PostServlet" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="userId">작성자:</label>
				<% if (userId != null) { %>
					<%= userId %>
				<% } else { %>
				<p>로그인이 필요합니다.</p>
				<% } %>
			</div>
			<div class="form-group">
				<label for="title">제목:</label> <input type="text" id="title"
					name="title" required>
			</div>
			<div class="form-group">
				<label for="content">내용:</label>
				<textarea id="content" name="content" rows="10" required></textarea>
			</div>
			<div class="form-group">
				<label for="file">첨부파일:</label> <input type="file" id="file"
					name="file">
			</div>
			<div class="form-group">
				<button type="submit" class="submit-button">저장</button>
			</div>
		</form>
	</main>
</body>
</html>
