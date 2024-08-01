package com.controller;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.model.PostDAO;
import com.model.PostDTO;
import com.model.UserDTO;
import com.oreilly.servlet.multipart.Part;
import com.util.ServletUtil;

@WebServlet("/postSaveServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class postSaveServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//작성자userid 가져오기
		HttpSession session = request.getSession();
        UserDTO info = (UserDTO) session.getAttribute("user");
		String userId = info.getUserId();
		
		//글 제목과 내용 받아오기
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		//post객체생성
		PostDTO post = new PostDTO();
		post.setPostTitle(title);
		post.setPostContents(content);
		post.setUserId(userId);

		PostDAO dao = new PostDAO();
		
		//생성한 post를 postdbsave 메서드로 보냄
		int result = dao.postDbSave(post);

		if (result > 0) {
			response.sendRedirect("postSaveSuccess.jsp");
		} else {
			response.getWriter().print("글 저장에 실패하였습니다.");
			
		}
	}

}
