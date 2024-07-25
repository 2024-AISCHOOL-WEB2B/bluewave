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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        UserDTO user = userDAO.login(userId, password);

        if (user != null && PasswordUtil.checkPassword(password, user.getUserPw())) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("loginSuccess.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
