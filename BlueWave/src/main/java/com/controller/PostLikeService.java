package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpClient.Redirect;
import java.security.Timestamp;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.PostDAO;
import com.model.PostDTO;
import com.model.PostLikeDAO;
import com.model.UserDTO;

@WebServlet("/PostLikeService")
public class PostLikeService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PostDTO dto = new PostDTO();
		PostDAO dao = new PostDAO();

		// 1. 게시물 번호 가져오기
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));

		System.out.println("post_idx 가져오기 성공");
		dto = dao.postSearch(post_idx);

		post_idx = dto.getPostIdx(); // 글 인덱스 번호
		String user_id = dto.getUserId();// 글의 작성자ID
		String post_title = dto.getPostTitle(); // 타이틀
		String post_content = dto.getPostContents(); // 내용
		String post_file = dto.getPostFile(); // 첨부파일
		java.sql.Timestamp created_at = dto.getCreatedAt();
		java.sql.Timestamp updated_at = dto.getUpdatedAt();
		int post_likes = dto.getPostLikes();
		int post_views = dto.getPostViews();

		// * postlikedao 객체 생성
		PostLikeDAO postlikedao = new PostLikeDAO();
		System.out.println("postlikedao 객체생성 완료");

		HttpSession session = request.getSession();
		UserDTO info = (UserDTO) session.getAttribute("user");
		String likeuser_id = info.getUserId();
		System.out.println("likeuser_id. 현재 로그인한 사람 아이디 가져오기 성공" + likeuser_id);

		// 3. db postlike 테이블에 있는지 확인
		// postlke dao에 좋아요확인 메서드 만들어서
		// 좋아요 안눌렀으면 (조회되면) 1 반환, 좋아요 눌렀으면 (조회X) 0반환
		// 안눌렀으면 이 파일에서 테이블like컬럼값 +1, 눌렀으면 변동없게끔 설정ㅔ

		int result = postlikedao.like(likeuser_id, post_idx);
		System.out.println(result);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();

		if (result == 1) {

			writer.println(
					"<script>alert('좋아요 누르기 성공!'); location.href='viewPost.jsp?post_idx=" + post_idx + "';</script>");
		} else {
			writer.println("<script>alert('이미 좋아요를 누르셨습니다.'); location.href='viewPost.jsp?post_idx=" + post_idx
					+ "';</script>");
		}
		writer.close();
	}
}
