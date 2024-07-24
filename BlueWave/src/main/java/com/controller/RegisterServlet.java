package com.controller;

import com.model.UserDTO;
import com.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        request.setCharacterEncoding("UTF-8");
        String userId = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birthdate = request.getParameter("birthdate");
        String gender = request.getParameter("gender");
        String job = request.getParameter("job");
        int income = Integer.parseInt(request.getParameter("pay"));
        int family = Integer.parseInt(request.getParameter("family"));
        String region = request.getParameter("address");
        String policyInterest = request.getParameter("policyType");

        UserDTO user = new UserDTO();
        user.setUserId(userId);
        user.setUserPw(password);
        user.setUserName(name);
        user.setUserEmail(email);
        user.setUserBirthdate(birthdate);
        user.setUserGender(gender);
        user.setUserJob(job);
        user.setUserIncome(income);
        user.setUserFamily(family);
        user.setUserRegion(region);
        user.setUserPolicyInterest(policyInterest);

        UserDAO userDAO = new UserDAO();
        int result = userDAO.register(user);

        if (result == 1) {
            response.sendRedirect("registerSuccess.html");
        } else {
            response.sendRedirect("register.html");
        }
    }
}
