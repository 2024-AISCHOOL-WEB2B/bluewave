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

@WebServlet("/PostServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class PostServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
        UserDTO info = (UserDTO) session.getAttribute("user");

        
        if (info == null) {
            response.getWriter().print("로그인이 필요합니다.");
            return;
        }
        
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userId = info.getUserId();

		PostDTO post = new PostDTO();
		post.setPostTitle(title);
		post.setPostContents(content);
		post.setUserId(userId);

		PostDAO dao = new PostDAO();

		int result = dao.postDbSave(post);

		if (result > 0) {
			response.sendRedirect("postSaveSuccess.jsp");
		} else {
			response.getWriter().print("글 저장에 실패하였습니다.");
		}
	}

}
