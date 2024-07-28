<%@page import="java.sql.Timestamp"%>
<%@page import="com.model.PostDTO"%>
<%@page import="com.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 목록</title>
<link rel="stylesheet" type="text/css" href="CSS/communityStyles.css">
</head>
<body>
	<header>
		<h1>커뮤니티 글 목록</h1>
		<button class="write-button" onclick="location.href='write.jsp'">글쓰기</button>
	</header>
	<main>
		<%
		PostDAO dao = new PostDAO();
		PostDTO dto = new PostDTO();

		int index_num = 64;

		dto = dao.postSearch(index_num);

		int post_idx = dto.getPostIdx(); //글 인덱스 번호
		String user_id = dto.getUserId();//작성자ID
		String post_title = dto.getPostTitle(); //타이틀
		String post_content = dto.getPostContents(); //내용
		String post_file = dto.getPostFile(); //첨부파일
		Timestamp created_at = dto.getCreatedAt();
		Timestamp updated_at = dto.getUpdatedAt();
		int post_views = dto.getPostViews();
		int post_likes = dto.getPostLikes();
		response.setCharacterEncoding("EUC-KR");
		%>
		<table>
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=index_num%></td>
					<td><a href="viewPost.jsp?index_num=<%=index_num%>"><%=post_title%></a></td>
					<td><%=user_id%></td>
					<td><%=created_at%></td>
				</tr>

			</tbody>
		</table>
	</main>
</body>
</html>
