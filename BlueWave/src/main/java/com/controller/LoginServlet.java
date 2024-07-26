package com.controller;

import com.model.UserDTO;
import com.util.PasswordUtil;
import com.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userid");
		String password = request.getParameter("password");

		UserDAO userDAO = new UserDAO();
		UserDTO user = userDAO.login(userId, password);

		if (user != null) {
			if (PasswordUtil.checkPassword(password, user.getUserPw())) {
				request.getSession().setAttribute("user", user);
				response.sendRedirect("loginSuccess.jsp");
			} else {
				System.out.println("password checkpw가 false입니다.");
			}
		} else {
			System.out.println("user가 null입니다.");
			response.sendRedirect("login.jsp?error=1");
			System.out.println("아이디 : "+userId);
			System.out.println("내가 입력한 값 : " + password);
			System.out.println("함수에 넣은 해시 값 : " + PasswordUtil.hashPassword(password));
			String dto = user.getUserPw();
			System.out.println("DTO에 저장된 해시값" + dto);
		}
	}
}
