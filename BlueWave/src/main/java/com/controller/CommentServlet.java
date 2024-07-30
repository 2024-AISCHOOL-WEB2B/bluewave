package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CommentDAO;
import com.model.CommentDTO;
import com.model.UserDTO;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	// private static final int CommentDAO = 0;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// ** post_idx 받아오기 **
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		System.out.println(post_idx);
		// 1. 댓글작성자는 로그인한 유저의 아이디 가져와야해서 세션 가져오기
		HttpSession session = request.getSession();
		UserDTO info = (UserDTO) session.getAttribute("user");
		String userid = info.getUserId(); // 댓글작성자
		System.out.println("댓글작성자 : " + userid);

		// 2. 입력한 댓글 가져오기
		String comment_content = request.getParameter("comment_content"); // 댓글내용
		System.out.println("댓글내용 : " + comment_content);

		// 3. dto, dao 객체생성
		CommentDAO dao = new CommentDAO();
		CommentDTO dto = new CommentDTO();

		// 댓글쓰는 메서드에 매개변수로 넣기
		int result = dao.writeComment(post_idx, userid, comment_content);
		System.out.println("result값: " + result + " 댓글쓰기 성공!!");

		response.setContentType("text/html; charset=UTF-8"); // 인코딩먼저
		PrintWriter writer = response.getWriter();
		// 4. 결과

		if (result == 1) {

			writer.println(
					"<script>alert('댓글 입력 완료!'); location.href='viewPost.jsp?post_idx=" + post_idx + "';</script>");
		} else

		{
			writer.println("<script>alert('댓글 저장에 실패하였습니다.'); location.href='viewPost.jsp?post_idx=" + post_idx
					+ "';</script>");
		}
		writer.close();
	}

}
