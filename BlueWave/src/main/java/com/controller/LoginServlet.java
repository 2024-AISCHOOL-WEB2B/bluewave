package com.controller;

import com.model.UserDTO;
import com.util.PasswordUtil;
import com.util.ServletUtil;
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

		ServletUtil.setCharacterEncoding(request);

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
			response.sendRedirect("userisnull.jsp");
		}
	}
}
