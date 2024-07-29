package com.controller;

import java.io.IOException;
import java.net.http.HttpClient.Redirect;
import java.security.Timestamp;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.PostDAO;
import com.model.PostDTO;
import com.model.PostLikeDAO;

@WebServlet("/PostLikeService")
public class PostLikeService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 게시물 번호 가져오기
		PostDTO dto = new PostDTO();
		PostDAO dao = new PostDAO();
		int index_num = Integer.parseInt(request.getParameter("index_num"));

		dto = dao.postSearch(index_num);

		int post_idx = dto.getPostIdx(); // 글 인덱스 번호
		String user_id = dto.getUserId();// 작성자ID
		String post_title = dto.getPostTitle(); // 타이틀
		String post_content = dto.getPostContents(); // 내용
		String post_file = dto.getPostFile(); // 첨부파일
		java.sql.Timestamp created_at = dto.getCreatedAt();
		java.sql.Timestamp updated_at = dto.getUpdatedAt();
		int post_likes = dto.getPostLikes();
		int post_views = dto.getPostViews();

		// * postlikedao 객체 생성
		PostLikeDAO postlikedao = new PostLikeDAO();

		// 3. db postlike 테이블에 있는지 확인
		// postlke dao에 좋아요확인 메서드 만들어서
		// 좋아요 안눌렀으면 (조회되면) 1 반환, 좋아요 눌렀으면 (조회X) 0반환
		// 안눌렀으면 이 파일에서 테이블like컬럼값 +1, 눌렀으면 변동없게끔 설정ㅔ

		int result;
		try {
			result = postlikedao.like(user_id, post_idx);
			if (result == 0) {
				System.out.println("이미 좋아요 누른 게시물입니다 - postlikeservice메세지");
			} else {
				System.out.println("좋아요를 눌렀습니다. - postlikeservice메세지");
			}
			response.sendRedirect("viewPost.jsp?index_num=" + index_num); // 리디렉션에 index_num 추가
		} catch (SQLException e) {
			System.out.println("postLikeservice서블릿 파일에서의 catch");
			e.printStackTrace();
		}

		
	}
}
